import UIKit

class CatalogueHeaderCell: UICollectionViewCell {
    private let label: UILabel = {
        $0.text = "Каталог"
        $0.font = UIFont.systemFont(ofSize: 25)
        $0.adjustsFontForContentSizeCategory = true
        $0.translatesAutoresizingMaskIntoConstraints = false
        return $0
    }(UILabel())

    override init(frame: CGRect) {
        super.init(frame: frame)
        setUp()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

private extension CatalogueHeaderCell {
    func setUp() {
        contentView.addSubview(label)
    }
}
