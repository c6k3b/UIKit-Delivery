import UIKit

class BannerCell: UICollectionViewCell, MainConfigurableBannerCell {
    static var identifier: String { String(describing: BannerCell.self) }

    lazy var imageView: UIImageView = {
        $0.contentMode = .scaleAspectFill
        return $0
    }(UIImageView())

    private lazy var descriptionStack: UIStackView = {
        $0.axis = .vertical
        $0.spacing = 2
        $0.alignment = .leading
        $0.distribution = .fillProportionally
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.addArrangedSubview(descriptionLabel1)
        $0.addArrangedSubview(descriptionLabel2)
        return $0
    }(UIStackView())

    lazy var descriptionLabel1: UILabel = {
        $0.font = UIFont.preferredFont(forTextStyle: .subheadline)
        $0.adjustsFontForContentSizeCategory = true
        $0.textColor = Styles.Colors.background
        return $0
    }(UILabel())

    lazy var descriptionLabel2: UILabel = {
        $0.font = UIFont.preferredFont(forTextStyle: .title2)
        $0.adjustsFontForContentSizeCategory = true
        $0.textColor = Styles.Colors.background
        return $0
    }(UILabel())

    override init(frame: CGRect) {
        super.init(frame: frame)
        setUp()
    }

    required init(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func configure(with model: MainModel.Item.ViewModel.Banner) {
        imageView.image = model.image
        descriptionLabel1.text = model.description1
        descriptionLabel2.text = model.description2
    }
}

private extension BannerCell {
    func setUp() {
        contentView.layer.cornerRadius = 12
        backgroundView = imageView
        contentView.addSubview(descriptionStack)
        activateConstraints()
    }
}

private extension BannerCell {
    func activateConstraints() {
        NSLayoutConstraint.activate([
            descriptionStack.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: 16),
            descriptionStack.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -16),
            descriptionStack.rightAnchor.constraint(equalTo: contentView.rightAnchor, constant: -16)
        ])
    }
}
