import UIKit

class CatalogViewCell: UICollectionViewCell {
    static var identifier: String { String(describing: CatalogViewCell.self) }

    var textLabel: UILabel!

    override init(frame: CGRect) {
        super.init(frame: frame)
        let textLabel = UILabel(frame: .zero)
        contentView.addSubview(textLabel)
        NSLayoutConstraint.activate([
            contentView.centerXAnchor.constraint(equalTo: textLabel.centerXAnchor),
            contentView.centerYAnchor.constraint(equalTo: textLabel.centerYAnchor)
        ])
        self.textLabel = textLabel
        reset()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func prepareForReuse() {
        super.prepareForReuse()
        reset()
    }
}

private extension CatalogViewCell {
    func reset() {
        textLabel.textAlignment = .center
    }
}
