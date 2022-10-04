import UIKit

class CatalogueCell: UICollectionViewCell, MainConfigurableCatalogueItemCell {
    private lazy var stack: UIStackView = {
        $0.axis = .vertical
        $0.alignment = .center
        $0.spacing = 4
        $0.distribution = .equalSpacing
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.addArrangedSubview(imageView)
        $0.addArrangedSubview(descriptionLabel)
        return $0
    }(UIStackView())

    private let imageView: UIImageView = {
        $0.contentMode = .scaleAspectFit
        return $0
    }(UIImageView())

    private let descriptionLabel: UILabel = {
        $0.numberOfLines = 0
        $0.lineBreakMode = .byWordWrapping
        $0.textAlignment = .center
        $0.font = UIFont.preferredFont(forTextStyle: .subheadline)
        $0.adjustsFontForContentSizeCategory = true
        return $0
    }(UILabel())

    override init(frame: CGRect) {
        super.init(frame: frame)
        setUp()
    }

    required init(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func configure(with model: MainModel.Item.ViewModel.CatalogueItem) {
        imageView.image = model.image
        descriptionLabel.text = model.description
        contentView.backgroundColor = model.backgroundColor
    }
}

private extension CatalogueCell {
    func setUp() {
        contentView.layer.cornerRadius = 12
        contentView.addSubview(stack)
        activateConstraints()
    }
}

private extension CatalogueCell {
    func activateConstraints() {
        NSLayoutConstraint.activate([
            stack.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 4),
            stack.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: 4),
            stack.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -10),
            stack.rightAnchor.constraint(equalTo: contentView.rightAnchor, constant: -4)
        ])

        NSLayoutConstraint.activate([
            imageView.heightAnchor.constraint(equalToConstant: 90)
        ])
    }
}
