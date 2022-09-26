import UIKit

final class MenuViewController: UIViewController, MenuDisplayLogic {
    private let interactor: MenuBusinessLogic
    private let router: MenuRoutingLogic

    private var menuOptions: [MenuModels.Items.ViewModel.MenuCell] = []
    private let menuView = MenuView()

    private lazy var optionsTable: UITableView = {
        $0.delegate = self
        $0.dataSource = self
        return $0
    }(menuView.optionsTable)

    init(interactor: MenuBusinessLogic, router: MenuRoutingLogic) {
        self.interactor = interactor
        self.router = router
        super.init(nibName: nil, bundle: nil)
        setUp()
        showItems()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func displayMenu(_ viewModel: MenuModels.Items.ViewModel) {
        menuOptions = viewModel.menuOptions
        menuView.configure(with: viewModel.userInfo)
        optionsTable.reloadData()
    }
}

private extension MenuViewController {
    func setUp() {
        self.view = menuView
    }
}

private extension MenuViewController {
    func showItems() {
        interactor.fetchMenu(MenuModels.Items.Request())
    }
}

extension MenuViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat { 64 }
}

extension MenuViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        menuOptions.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let menuItem = menuOptions[indexPath.item]

        guard let cell = tableView.dequeueReusableCell(
            withIdentifier: MenuCell.identifier,
            for: indexPath
        ) as? MenuConfigurableCell else { return UITableViewCell() }

        cell.configure(with: menuItem)
        return cell as? UITableViewCell ?? UITableViewCell()
    }
}
