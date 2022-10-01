import UIKit

final class MainViewController: UIViewController, MainDisplayLogic {
    // MARK: - Properties
    private let interactor: MainBusinessLogic
    private let router: MainRoutingLogic

    // MARK: - UI Elements
    private static let sectionHeaderElementKind = "section-header-element-kind"
    private var dataSource: UICollectionViewDiffableDataSource<SectionLayoutKind, Int>! = nil

    private enum SectionLayoutKind: Int, CaseIterable {
        case  address, search, option, banner, promotion, catalogue
        var columnCount: Int {
            switch self {
            case .address, .search: return 1
            case .option, .banner, .promotion: return 4
            case .catalogue: return 3
            }
        }
    }

    private lazy var collectionView: UICollectionView = {
        $0.showsVerticalScrollIndicator = false
        $0.translatesAutoresizingMaskIntoConstraints = false
        return $0
    }(UICollectionView(frame: view.bounds, collectionViewLayout: createLayout()))

    // MARK: - Initializers && View Configurators
    init(interactor: MainBusinessLogic, router: MainRoutingLogic) {
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
private extension MainViewController {
    func setUp() {
        view.backgroundColor = .systemBackground
        view.addSubview(collectionView)
        activateConstraints()
        configureDataSource()
    }

    func showItems() {
    }

    @objc func didMenuButtonTapped() {
        router.routeToMenu()
    }

    @objc func didAddressButtonTapped() {
        router.routeToSearch()
    }
}

// MARK: - Collection Layout
private extension MainViewController {
    func createLayout() -> UICollectionViewLayout {
        let layout = UICollectionViewCompositionalLayout {
            (sectionIndex: Int, _: NSCollectionLayoutEnvironment)
            -> NSCollectionLayoutSection? in

            guard let sectionLayoutKind = SectionLayoutKind(rawValue: sectionIndex) else { return nil }

            // Columns
            let columns = sectionLayoutKind.columnCount

            // Item
            let itemSize = NSCollectionLayoutSize(
                widthDimension: .fractionalWidth(2),
                heightDimension: .fractionalHeight(1)
            )
            let item = NSCollectionLayoutItem(layoutSize: itemSize)
            item.contentInsets = NSDirectionalEdgeInsets(top: 2, leading: 4, bottom: 2, trailing: 4)

            // Group
            var groupHeight = NSCollectionLayoutDimension.absolute(44)
            switch sectionLayoutKind {
            case .address, .search: groupHeight = .absolute(44)
            case .option: groupHeight = .fractionalWidth(0.2)
            case .banner: groupHeight = .fractionalWidth(0.25)
            case .promotion: groupHeight = .fractionalWidth(0.4)
            case .catalogue: groupHeight = .fractionalWidth(0.35)
            }

            let groupSize = NSCollectionLayoutSize(
                widthDimension: sectionLayoutKind == .banner
                    ? .estimated(1200)
                    : sectionLayoutKind == .promotion
                        ? .estimated(600)
                        : .fractionalWidth(1),
                heightDimension: groupHeight
            )

            let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitem: item, count: columns)
            group.interItemSpacing = .fixed(8)

            // Sections
            let section = NSCollectionLayoutSection(group: group)
            if sectionLayoutKind == .option || sectionLayoutKind == .banner || sectionLayoutKind == .promotion {
                section.orthogonalScrollingBehavior = .continuous
            }
            section.interGroupSpacing = 16
            section.contentInsets = NSDirectionalEdgeInsets(top: 8, leading: 16, bottom: 8, trailing: 16)
            // Section Header
            let headerSize = NSCollectionLayoutSize(
                widthDimension: .fractionalWidth(1.0),
                heightDimension: .estimated(44)
            )
            let sectionHeader = NSCollectionLayoutBoundarySupplementaryItem(
                layoutSize: headerSize,
                elementKind: MainViewController.sectionHeaderElementKind,
                alignment: .top
            )
            if sectionLayoutKind == .catalogue {
                section.boundarySupplementaryItems = [sectionHeader]
            }

            return section
        }
        return layout
    }
}

// MARK: - Data Source
private extension MainViewController {
    func configureDataSource() {
        // Cells Registration
        let headerRegistration = UICollectionView.SupplementaryRegistration
        <TitleView>(elementKind: MainViewController.sectionHeaderElementKind) {
            (supplementaryView, _, _) in
            supplementaryView.label.text = "Каталог"
        }

        let addressCellRegistration = UICollectionView.CellRegistration<AddressCell, Int> {
            [unowned self]  (cell, _, _) in
            cell.menuButton.addTarget(self, action: #selector(self.didMenuButtonTapped), for: .touchUpInside)

            cell.addressButton.setTitle("Пискунова, 24" + " ›", for: .normal)
            cell.addressButton.addTarget(self, action: #selector(self.didAddressButtonTapped), for: .touchUpInside)
        }

        let searchCellRegistration = UICollectionView.CellRegistration<SearchCell, Int> { (_, _, _) in }

        let optionCellRegistration = UICollectionView.CellRegistration<OptionCell, Int> {
            (cell, _, identifier) in
            cell.imageView.image = Styles.Images.user
            cell.label.text = "Option \(identifier)"
        }

        let bannerCellRegistration = UICollectionView.CellRegistration<BannerCell, Int> {
            (cell, _, identifier) in
            cell.imageView.image = Styles.Images.user
            cell.label.text = "Value \(identifier)"
        }

        let promotionCellRegistration = UICollectionView.CellRegistration<PromotionCell, Int> {
            (cell, _, identifier) in
            cell.imageView.image = Styles.Images.user
            cell.label.text = "Value \(identifier)"
        }

        let catalogueCellRegistration = UICollectionView.CellRegistration<CatalogueCell, Int> {
            (cell, _, identifier) in
            cell.imageView.image = Styles.Images.user
            cell.label.text = "Value \(identifier)"
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
            case .catalogue:
                return collectionView.dequeueConfiguredReusableCell(
                    using: catalogueCellRegistration, for: indexPath, item: identifier
                )
            }
        }

        dataSource.supplementaryViewProvider = { (_, _, index) in
            return self.collectionView.dequeueConfiguredReusableSupplementary(
                using: headerRegistration, for: index
            )
        }

        // Initial Data
        var snapshot = NSDiffableDataSourceSnapshot<SectionLayoutKind, Int>()
        var itemsPerSection = 1
        SectionLayoutKind.allCases.forEach {
            snapshot.appendSections([$0])
            switch $0.columnCount {
            case 3: itemsPerSection = 9
            case 4: itemsPerSection = 6
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
