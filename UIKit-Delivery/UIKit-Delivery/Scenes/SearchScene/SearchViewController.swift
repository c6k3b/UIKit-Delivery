import UIKit

final class SearchViewController: UIViewController, SearchDisplayLogic {
    // MARK: - Properties
    private let interactor: SearchBusinessLogic
    private let router: SearchRoutingLogic

    private var addressItems: [SearchModel.Item.ViewModel.SearchViewCell] = [
        SearchModel.Item.ViewModel.SearchViewCell(street: "aaa", city: "aaa"),
        SearchModel.Item.ViewModel.SearchViewCell(street: "bbb", city: "bbb"),
        SearchModel.Item.ViewModel.SearchViewCell(street: "ccc", city: "ccc")
    ]

    // MARK: - UI Elements
    private lazy var stack: UIStackView = {
        $0.axis = .vertical
        $0.spacing = 16
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.tintColor = Styles.Colors.grey
        $0.addArrangedSubview(searchField)
        $0.addArrangedSubview(SeparatorView())
        $0.addArrangedSubview(button)
        $0.addArrangedSubview(table)
        $0.setCustomSpacing(0, after: searchField)
        return $0
    }(UIStackView())

    private let searchField: UISearchTextField = {
        $0.placeholder = "Поиск адреса"
        return $0
    }(UISearchTextField())

    private lazy var searchController: UISearchController = {
        $0.searchResultsUpdater = self
        return $0
    }(UISearchController())

    private let button: UIButton = {
        $0.setTitle(" Текущее местоположение", for: .normal)
        $0.setImage( Styles.Images.location, for: .normal)
        $0.setTitleColor(.black, for: .normal)
        $0.titleLabel?.font = UIFont.systemFont(ofSize: 16)
        return $0
    }(UIButton())

    private lazy var table: UITableView = {
        $0.showsVerticalScrollIndicator = false
        $0.separatorStyle = .none
        $0.register(SearchViewCell.self, forCellReuseIdentifier: SearchViewCell.identifier)
        $0.delegate = self
        $0.dataSource = self
        return $0
    }(UITableView())

    // MARK: - Initializers && View Configurators
    init(interactor: SearchBusinessLogic, router: SearchRoutingLogic) {
        self.interactor = interactor
        self.router = router
        super.init(nibName: nil, bundle: nil)
        setUp()
        showItems()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

// MARK: - Private Methods
private extension SearchViewController {
    func setUp() {
        view.backgroundColor = Styles.Colors.background
        view.addSubview(stack)
        activateConstraints()
    }

    func showItems() {
        print(addressItems)
    }
}

// MARK: - Table Delegates
extension SearchViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat { 44 }
}

extension SearchViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        addressItems.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let addressItem = addressItems[indexPath.item]

        guard let cell = tableView.dequeueReusableCell(
            withIdentifier: SearchViewCell.identifier,
            for: indexPath
        ) as? SearchViewConfigurableCell else { return UITableViewCell() }

        cell.configure(with: addressItem)
        return cell as? UITableViewCell ?? UITableViewCell()
    }
}

// MARK: - Search
extension SearchViewController: UISearchResultsUpdating {
    func updateSearchResults(for searchController: UISearchController) {
    }
}

// MARK: - Constraints
private extension SearchViewController {
    func activateConstraints() {
        NSLayoutConstraint.activate([
            stack.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 32),
            stack.leftAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leftAnchor, constant: 16),
            stack.rightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.rightAnchor, constant: -16)
        ])
    }
}
