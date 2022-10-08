import UIKit

final class SearchViewController: UIViewController, SearchDisplayLogic {
    // MARK: - Properties
    private let interactor: SearchBusinessLogic
    private let router: (SearchRoutingLogic & SearchDataPassing)

    typealias AddressCell = SearchModel.Item.ViewModel.AddressListCell

    private var addressList: [AddressCell] = []

    // MARK: - UI Elements
    private lazy var stack: UIStackView = {
        $0.axis = .vertical
        $0.spacing = 20
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.tintColor = Styles.Colors.grey
        $0.addArrangedSubview(searchTextField)
        $0.addArrangedSubview(SeparatorView())
        $0.addArrangedSubview(currentLocationStack)
        $0.addArrangedSubview(table)
        $0.setCustomSpacing(14, after: searchTextField)
        $0.setCustomSpacing(24, after: currentLocationStack)
        return $0
    }(UIStackView())

    private lazy var searchTextField: UITextField = {
        let leftContainer = UIView(frame: CGRect(x: 0, y: 0, width: 35, height: 35))
        let rightContainer = UIView(frame: CGRect(x: 0, y: 0, width: 35, height: 35))
        let leftImage = UIImageView(frame: CGRect(x: 0, y: 0, width: 20, height: 20))
        let rightImage = UIImageView(frame: CGRect(x: 0, y: 0, width: 15, height: 15))

        leftImage.image = Styles.Images.search
        rightImage.image = Styles.Images.xmark
        leftImage.center = leftContainer.center
        rightImage.center = rightContainer.center

        leftContainer.addSubview(leftImage)
        rightContainer.addSubview(rightImage)

        $0.placeholder = "Поиск адреса"
        $0.leftView = leftContainer
        $0.leftViewMode = .always
        $0.rightView = rightContainer
        $0.rightViewMode = .whileEditing
        $0.delegate = self
        $0.addTarget(self, action: #selector(textFieldDidChange), for: .editingChanged)
        return $0
    }(UITextField())

    private lazy var currentLocationStack: UIStackView = {
        let locationImage = UIImageView(image: Styles.Images.location)
        let locationLabel = UILabel()

        locationImage.contentMode = .scaleAspectFit
        locationLabel.font = UIFont.systemFont(ofSize: 16, weight: .medium)
        locationLabel.textAlignment = .left
        locationLabel.text = "Текущее местоположение"

        $0.axis = .horizontal
        $0.spacing = 8
        $0.alignment = .center
        $0.distribution = .fillProportionally
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.addArrangedSubview(locationImage)
        $0.addArrangedSubview(locationLabel)
        return $0
    }(UIStackView())

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
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func displayAddress(_ viewModel: SearchModel.Item.ViewModel) {
        addressList = viewModel.addressList
        table.reloadData()
    }
}

// MARK: - Private Methods
private extension SearchViewController {
    func setUp() {
        view.backgroundColor = Styles.Colors.background
        view.addSubview(stack)
        activateConstraints()
    }

    func showItems(query: String) {
        interactor.requestAddressList(query: query, request: SearchModel.Item.Request())
    }

    @objc func textFieldDidChange() {
        if let text = searchTextField.text {
            if text.count > 1 {
                showItems(query: text)
            }
        }
    }
}

// MARK: - Table Delegates
extension SearchViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat { 64 }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
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

// MARK: - TextField Delegate
extension SearchViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
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
