import UIKit

// MARK: - Collection Layout
extension MainViewController {
    static let sectionHeaderElementKind = "section-header"

    enum SectionLayoutKind: Int, CaseIterable {
        case  address, search, option, banner, promotion, catalogueHeader, catalogue
        var columnCount: Int {
            switch self {
            case .address, .search, .catalogueHeader: return 1
            case .option, .banner, .promotion: return 4
            case .catalogue: return 3
            }
        }
    }

    func createLayout() -> UICollectionViewLayout {
        let layout = UICollectionViewCompositionalLayout {
            (sectionIndex: Int, _: NSCollectionLayoutEnvironment)
            -> NSCollectionLayoutSection? in

            guard let sectionLayoutKind = SectionLayoutKind(rawValue: sectionIndex) else { return nil }

            // Columns
            let columns = sectionLayoutKind.columnCount

            // Item
            let itemSize = NSCollectionLayoutSize(
                widthDimension: .fractionalWidth(1),
                heightDimension: .fractionalHeight(1)
            )
            let item = NSCollectionLayoutItem(layoutSize: itemSize)
            item.contentInsets = NSDirectionalEdgeInsets(top: 2, leading: 3, bottom: 2, trailing: 3)

            // Group
            var groupHeight = NSCollectionLayoutDimension.absolute(40)
            switch sectionLayoutKind {
            case .address: groupHeight = .absolute(0)
            case .search: groupHeight = groupHeight
            case .catalogueHeader: groupHeight = .estimated(30)
            case .option: groupHeight = .estimated(100)
            case .banner: groupHeight = .estimated(115)
            case .promotion: groupHeight = .estimated(208)
            case .catalogue: groupHeight = .estimated(145)
            }

            let groupSize = NSCollectionLayoutSize(
                widthDimension: sectionLayoutKind == .banner
                    ? .estimated(1250)
                    : sectionLayoutKind == .promotion
                        ? .estimated(490)
                        : sectionLayoutKind == .option
                            ? .estimated(375)
                            : .fractionalWidth(1),
                heightDimension: groupHeight
            )

            let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitem: item, count: columns)
            group.interItemSpacing = .fixed(4)

            // Sections
            let section = NSCollectionLayoutSection(group: group)
            if sectionLayoutKind == .option || sectionLayoutKind == .banner || sectionLayoutKind == .promotion {
                section.orthogonalScrollingBehavior = .continuous
            }
            section.interGroupSpacing = 8
            section.contentInsets = NSDirectionalEdgeInsets(top: 8, leading: 8, bottom: 8, trailing: 8)

            let headerSize = NSCollectionLayoutSize(
                widthDimension: .fractionalWidth(1),
                heightDimension: .estimated(48)
            )
            let sectionHeader = NSCollectionLayoutBoundarySupplementaryItem(
                layoutSize: headerSize,
                elementKind: MainViewController.sectionHeaderElementKind,
                alignment: .top
            )

            if sectionLayoutKind == .promotion {
                section.boundarySupplementaryItems = [sectionHeader]
            }

            return section
        }
        return layout
    }
}
