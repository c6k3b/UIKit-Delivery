import UIKit

// MARK: - Collection Layout
extension MainViewController {
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
                widthDimension: .fractionalWidth(2),
                heightDimension: .fractionalHeight(1)
            )
            let item = NSCollectionLayoutItem(layoutSize: itemSize)
            item.contentInsets = NSDirectionalEdgeInsets(top: 2, leading: 4, bottom: 2, trailing: 4)

            // Group
            var groupHeight = NSCollectionLayoutDimension.absolute(44)
            switch sectionLayoutKind {
            case .address, .search, .catalogueHeader: groupHeight = .absolute(44)
            case .option: groupHeight = .fractionalWidth(0.25)
            case .banner: groupHeight = .fractionalWidth(0.32)
            case .promotion: groupHeight = .fractionalWidth(0.6)
            case .catalogue: groupHeight = .fractionalWidth(0.42)
            }

            let groupSize = NSCollectionLayoutSize(
                widthDimension: sectionLayoutKind == .banner
                    ? .estimated(1300)
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
            section.interGroupSpacing = 16
            section.contentInsets = NSDirectionalEdgeInsets(top: 8, leading: 16, bottom: 8, trailing: 16)

            return section
        }
        return layout
    }
}
