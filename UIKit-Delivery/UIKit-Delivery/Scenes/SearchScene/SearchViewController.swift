import UIKit

final class SearchViewController: UIViewController, SearchDisplayLogic {
    // MARK: - Properties
    private let interactor: SearchBusinessLogic
    private let router: (SearchRoutingLogic & SearchDataPassing)

    typealias AddressCell = SearchModel.Item.ViewModel.AddressListCell

    private var addressList: [AddressCell] = []
    private var searchResults: [AddressCell] = []

    // MARK: - UI Elements
    private lazy var stack: UIStackView = {
        $0.axis = .vertical
        $0.spacing = 20
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.tintColor = Styles.Colors.grey
        $0.addArrangedSubview(currentLocationStack)
        $0.addArrangedSubview(table)
        return $0
    }(UIStackView())

    private lazy var searchController: UISearchController = {
        $0.searchBar.placeholder = "Поиск адреса"
        $0.hidesNavigationBarDuringPresentation = false
        $0.searchBar.sizeToFit()
        $0.searchResultsUpdater = self
        return $0
    }(UISearchController(searchResultsController: nil))

    private lazy var currentLocationStack: UIStackView = {
        $0.axis = .horizontal
        $0.spacing = 8
        $0.alignment = .center
        $0.distribution = .fillProportionally
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.addArrangedSubview(locationImage)
        $0.addArrangedSubview(locationLabel)
        return $0
    }(UIStackView())

    private let locationImage: UIImageView = {
        $0.image = Styles.Images.location
        $0.contentMode = .scaleAspectFit
        $0.translatesAutoresizingMaskIntoConstraints = false
        return $0
    }(UIImageView())

    private let locationLabel: UILabel = {
        $0.font = UIFont.systemFont(ofSize: 16, weight: .medium)
        $0.textAlignment = .left
        $0.text = "Текущее местоположение"
        return $0
    }(UILabel())

    private lazy var table: UITableView = {
        $0.showsVerticalScrollIndicator = false
        $0.separatorStyle = .none
        $0.register(SearchViewCell.self, forCellReuseIdentifier: SearchViewCell.identifier)
        $0.delegate = self
        $0.dataSource = self
        return $0
    }(UITableView())

    // MARK: - Initializers && View Configurators
    init(interactor: SearchBusinessLogic, router: SearchRoutingLogic & SearchDataPassing) {
        self.interactor = interactor
        self.router = router
        super.init(nibName: nil, bundle: nil)
        setUp()
        showItems()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func displayAddress(_ viewModel: SearchModel.Item.ViewModel) {
        addressList = viewModel.addressList
    }
}

// MARK: - Private Methods
private extension SearchViewController {
    func setUp() {
        view.backgroundColor = Styles.Colors.background

//        view.addSubview(searchController.searchBar)
//        table.tableHeaderView = searchController.searchBar
        navigationItem.searchController = searchController
//        table.tableHeaderView = searchController.searchBar
        view.addSubview(stack)
        activateConstraints()
    }

    func showItems() {
        interactor.requestAddressList(query: "ижевск ленина", request: SearchModel.Item.Request())
    }

    func updateSearchResults(for searchText: String) {
        searchResults = addressList.filter { address in
            let match = address.city.range(of: searchText, options: .caseInsensitive)
            return match != nil
        }
    }
}

// MARK: - Table Delegates
extension SearchViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat { 64 }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        interactor.setAddress(indexPath.item)
        router.routeToMain()
    }
}

extension SearchViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        addressList.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let addressItem = addressList[indexPath.item]

        guard let cell = tableView.dequeueReusableCell(
            withIdentifier: SearchViewCell.identifier,
            for: indexPath
        ) as? SearchViewConfigurableCell else { return UITableViewCell() }

        cell.configure(with: addressItem)
        return cell as? UITableViewCell ?? UITableViewCell()
    }
}

// MARK: - Search Delegate
extension SearchViewController: UISearchResultsUpdating {
    func updateSearchResults(for searchController: UISearchController) {
        if let searchText = searchController.searchBar.text {
            updateSearchResults(for: searchText)
            table.reloadData()
        }
    }
}

// MARK: - Constraints
private extension SearchViewController {
    func activateConstraints() {
        NSLayoutConstraint.activate([
            stack.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 16),
            stack.leftAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leftAnchor, constant: 16),
            stack.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -16),
            stack.rightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.rightAnchor, constant: -16)
        ])
    }
}
