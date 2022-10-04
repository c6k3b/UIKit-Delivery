import UIKit

class CatalogueHeaderCell: UICollectionViewCell {
    private let label: UILabel = {
        $0.text = "Каталог"
        $0.font = UIFont.preferredFont(forTextStyle: .title2)
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
        activateConstraints()
    }
}

private extension CatalogueHeaderCell {
    func activateConstraints() {
        let inset = CGFloat(10)
        NSLayoutConstraint.activate([
            label.leadingAnchor.constraint(equalTo: leadingAnchor, constant: inset),
            label.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -inset),
            label.topAnchor.constraint(equalTo: topAnchor, constant: inset),
            label.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -inset)
        ])
    }
}
