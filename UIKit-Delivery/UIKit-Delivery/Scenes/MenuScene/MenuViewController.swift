import UIKit

final class MenuViewController: UIViewController, MenuDisplayLogic, MenuConfigurableView {
    // MARK: - Properties
    private let interactor: MenuBusinessLogic
    private let router: MenuRoutingLogic

    private var menuOptions: [MenuModel.Item.ViewModel.MenuCell] = []

    // MARK: - UI Elements
    private let userImage = UIImageView()
    private let nameLabel = UILabel()
    private let phoneLabel = UILabel()

    private lazy var stack: UIStackView = {
        $0.axis = .vertical
        $0.spacing = 20
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.addArrangedSubview(userStack)
        $0.addArrangedSubview(SeparatorView())
        $0.addArrangedSubview(table)
        return $0
    }(UIStackView())

    private lazy var userStack: UIStackView = {
        lazy var userInfoStack: UIStackView = {
            nameLabel.font = UIFont.systemFont(ofSize: 20, weight: .medium)
            phoneLabel.font = UIFont.systemFont(ofSize: 20, weight: .regular)

            $0.axis = .vertical
            $0.spacing = -8
            $0.distribution = .fillEqually
            $0.addArrangedSubview(nameLabel)
            $0.addArrangedSubview(phoneLabel)
            return $0
        }(UIStackView())

        userImage.contentMode = .scaleAspectFill
        userImage.translatesAutoresizingMaskIntoConstraints = false

        $0.axis = .horizontal
        $0.spacing = 30
        $0.addArrangedSubview(userImage)
        $0.addArrangedSubview(userInfoStack)
        return $0
    }(UIStackView())

    private lazy var table: UITableView = {
        $0.showsVerticalScrollIndicator = false
        $0.separatorStyle = .none
        $0.register(MenuCell.self, forCellReuseIdentifier: MenuCell.identifier)
        $0.delegate = self
        $0.dataSource = self
        return $0
    }(UITableView())

    private let footerButton: UIButton = {
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.contentHorizontalAlignment = .left
        $0.titleLabel?.numberOfLines = 0
        $0.titleEdgeInsets = UIEdgeInsets(top: 0, left: 15, bottom: 0, right: 0)
        $0.setImage(Styles.Images.contacts, for: .normal)
        $0.setTitle(" ??????????????????\n ?? ????????", for: .normal)
        $0.setTitleColor(Styles.Colors.grey, for: .normal)
        return $0
    }(UIButton())

    // MARK: - Initializers && View Configurators
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

    func displayMenu(_ viewModel: MenuModel.Item.ViewModel) {
        menuOptions = viewModel.menuCells
        configure(with: viewModel.userInfo)
    }

    func configure(with model: MenuModel.Item.ViewModel.User) {
        userImage.image = model.image
        nameLabel.text = model.name
        phoneLabel.text = model.phone
        table.reloadData()
    }
}

// MARK: - Private Methods
private extension MenuViewController {
    func setUp() {
        view.backgroundColor = Styles.Colors.background
        view.addSubview(stack)
        view.addSubview(footerButton)
        activateConstraints()
    }

    func showItems() {
        interactor.fetchMenu(MenuModel.Item.Request())
    }
}

// MARK: - Table Delegates
extension MenuViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat { 56 }
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

// MARK: - Constraints
private extension MenuViewController {
    func activateConstraints() {
        NSLayoutConstraint.activate([
            stack.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 16),
            stack.leftAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leftAnchor, constant: 16),
            stack.bottomAnchor.constraint(equalTo: footerButton.topAnchor, constant: -16),
            stack.rightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.rightAnchor, constant: -16)
        ])

        NSLayoutConstraint.activate([
            userImage.heightAnchor.constraint(equalToConstant: 60),
            userImage.widthAnchor.constraint(equalToConstant: 60)
        ])

        NSLayoutConstraint.activate([
            footerButton.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 40),
            footerButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            footerButton.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -40)
        ])
    }
}
