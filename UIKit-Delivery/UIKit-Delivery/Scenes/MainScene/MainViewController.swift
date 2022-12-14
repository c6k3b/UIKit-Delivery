import UIKit

final class MainViewController: UIViewController, MainDisplayLogic {
    // MARK: - Properties
    private let interactor: MainBusinessLogic
    let router: (MainRoutingLogic & MainDataPassing)

    private var options: [MainModel.Item.ViewModel.Option] = []
    private var banners: [MainModel.Item.ViewModel.Banner] = []
    private var promotions: [MainModel.Item.ViewModel.Promotion] = []
    private var catalogue: [MainModel.Item.ViewModel.CatalogueItem] = []

    private var searchResults: [AddressCell] = []

    private var dataSource: UICollectionViewDiffableDataSource<SectionLayoutKind, Int>! = nil

    // MARK: - UI Elements
    private let addressButton = UIButton()

    private lazy var navigationLeftBarButton: UIBarButtonItem = {
        $0.image = Styles.Images.menu
        $0.target = self
        $0.action = #selector(didMenuButtonTapped)
        return $0
    }(UIBarButtonItem())

    private lazy var navigationTitleView: UIStackView = {
        let backSpacer = UIView()
        let constraint = backSpacer.widthAnchor.constraint(equalToConstant: UIScreen.main.bounds.width)
        constraint.isActive = true
        constraint.priority = .defaultLow

        lazy var deliveryStack: UIStackView = {
            let label: UILabel = {
                $0.text = "Доставка"
                $0.textColor = Styles.Colors.grey
                $0.font = UIFont.systemFont(ofSize: 12)
                return $0
            }(UILabel())

            addressButton.setTitleColor(.label, for: .normal)
            addressButton.titleLabel?.font = UIFont.systemFont(ofSize: 16, weight: .regular)
            addressButton.addTarget(self, action: #selector(self.didAddressButtonTapped), for: .touchUpInside)

            $0.axis = .vertical
            $0.spacing = -4
            $0.addArrangedSubview(label)
            $0.addArrangedSubview(addressButton)
            return $0
        }(UIStackView())

        $0.axis = .horizontal
        $0.addArrangedSubview(deliveryStack)
        $0.addArrangedSubview(backSpacer)
        return $0
    }(UIStackView())

    private lazy var collectionView: UICollectionView = {
        $0.showsVerticalScrollIndicator = false
        $0.translatesAutoresizingMaskIntoConstraints = false
        return $0
    }(UICollectionView(frame: view.bounds, collectionViewLayout: createLayout()))

    // MARK: - Initializers && View Configurators
    init(interactor: MainBusinessLogic, router: MainRoutingLogic & MainDataPassing) {
        self.interactor = interactor
        self.router = router
        super.init(nibName: nil, bundle: nil)
        UINavigationBar.appearance().tintColor = Styles.Colors.grey
        setUp()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        showItems()
    }

    func displayMain(_ viewModel: MainModel.Item.ViewModel) {
        options = viewModel.options
        banners = viewModel.banners
        promotions = viewModel.promotions
        catalogue = viewModel.catalogue
        addressButton.setTitle(viewModel.deliveryAddress + " ›", for: .normal)

        configureDataSource()
    }
}

// MARK: - Private Methods
private extension MainViewController {
    func setUp() {
        navigationItem.leftBarButtonItem = navigationLeftBarButton
        navigationItem.titleView = navigationTitleView

        view.backgroundColor = .systemBackground
        view.addSubview(collectionView)
        activateConstraints()
    }

    func showItems() {
        interactor.fetchMain(MainModel.Item.Request())
    }

    @objc func didMenuButtonTapped() {
        router.routeToMenu()
    }

    @objc func didAddressButtonTapped() {
        router.routeToSearch()
    }
}

// MARK: - Data Source
private extension MainViewController {
    func configureDataSource() {
        let headerRegistration = UICollectionView.SupplementaryRegistration
        <TitleSupplementaryView>(elementKind: MainViewController.sectionHeaderElementKind) {
            (_, _, _) in
        }

        let addressCellRegistration = UICollectionView.CellRegistration<AddressCell, Int> {
            [unowned self]  (cell, _, _) in
            cell.menuButton.addTarget(self, action: #selector(self.didMenuButtonTapped), for: .touchUpInside)
            cell.addressButton.addTarget(self, action: #selector(self.didAddressButtonTapped), for: .touchUpInside)
        }

        let searchCellRegistration = UICollectionView.CellRegistration<SearchCell, Int> { (_, _, _) in }

        let optionCellRegistration = UICollectionView.CellRegistration<OptionCell, Int> {
            [unowned self] (cell, indexPath, _) in
            cell.configure(with: self.options[indexPath.item])
        }

        let bannerCellRegistration = UICollectionView.CellRegistration<BannerCell, Int> {
            [unowned self] (cell, indexPath, _) in
            cell.configure(with: self.banners[indexPath.item])
        }

        let promotionCellRegistration = UICollectionView.CellRegistration<PromotionCell, Int> {
            [unowned self] (cell, indexPath, _) in
            cell.configure(with: self.promotions[indexPath.item])
        }

        let catalogueHeaderCellRegistration = UICollectionView.CellRegistration<CatalogueHeaderCell, Int> {
            (_, _, _) in
        }

        let catalogueCellRegistration = UICollectionView.CellRegistration<CatalogueCell, Int> {
            [unowned self] (cell, indexPath, _) in
            cell.configure(with: self.catalogue[indexPath.item])
        }

        // Datasource
        dataSource = UICollectionViewDiffableDataSource<SectionLayoutKind, Int>(collectionView: collectionView) {
            (collectionView: UICollectionView, indexPath: IndexPath, identifier: Int) -> UICollectionViewCell? in
            switch SectionLayoutKind(rawValue: indexPath.section)! {
            case .address:
                return collectionView.dequeueConfiguredReusableCell(
                    using: addressCellRegistration, for: indexPath, item: identifier
                )
            case .search:
                return collectionView.dequeueConfiguredReusableCell(
                    using: searchCellRegistration, for: indexPath, item: identifier
                )
            case .option:
                return collectionView.dequeueConfiguredReusableCell(
                    using: optionCellRegistration, for: indexPath, item: identifier
                )
            case .banner:
                return collectionView.dequeueConfiguredReusableCell(
                    using: bannerCellRegistration, for: indexPath, item: identifier
                )
            case .promotion:
                return collectionView.dequeueConfiguredReusableCell(
                    using: promotionCellRegistration, for: indexPath, item: identifier
                )
            case .catalogueHeader:
                return collectionView.dequeueConfiguredReusableCell(
                    using: catalogueHeaderCellRegistration, for: indexPath, item: identifier
                )
            case .catalogue:
                return collectionView.dequeueConfiguredReusableCell(
                    using: catalogueCellRegistration, for: indexPath, item: identifier
                )
            }
        }

        dataSource.supplementaryViewProvider = {
            [unowned self] (_, _, indexPath) in
                return self.collectionView.dequeueConfiguredReusableSupplementary(
                    using: headerRegistration,
                    for: indexPath
                )
        }

        // Initial Data
        var snapshot = NSDiffableDataSourceSnapshot<SectionLayoutKind, Int>()
        var itemsPerSection = 1
        SectionLayoutKind.allCases.forEach {
            snapshot.appendSections([$0])
            switch $0 {
            case .option: itemsPerSection = options.count
            case .banner: itemsPerSection = banners.count
            case .promotion: itemsPerSection = promotions.count
            case .catalogue: itemsPerSection = catalogue.count
            default: itemsPerSection = 1
            }
            let itemOffset = $0.rawValue * itemsPerSection
            let itemUpperbound = itemOffset + itemsPerSection

            snapshot.appendItems(Array(itemOffset ..< itemUpperbound))
        }
        dataSource.apply(snapshot, animatingDifferences: false)
    }
}

// MARK: - Constraints
private extension MainViewController {
    func activateConstraints() {
        NSLayoutConstraint.activate([
            collectionView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            collectionView.leftAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leftAnchor),
            collectionView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            collectionView.rightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.rightAnchor)
        ])
    }
}
