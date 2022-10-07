import UIKit

class PromotionCell: UICollectionViewCell, MainConfigurablePromotionCell {
    private var isNew = false

    private lazy var stack: UIStackView = {
        $0.axis = .vertical
        $0.distribution = .equalSpacing
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.addArrangedSubview(imageView)
        $0.addArrangedSubview(descriptionStack)
        $0.addArrangedSubview(bottomStack)
        return $0
    }(UIStackView())

    private let imageView: UIImageView = {
        $0.contentMode = .scaleAspectFit
        return $0
    }(UIImageView())

    private lazy var descriptionStack: UIStackView = {
        $0.axis = .vertical
        $0.addArrangedSubview(descriptionLabel)
        $0.addArrangedSubview(weightLabel)
        return $0
    }(UIStackView())

    private let descriptionLabel: UILabel = {
        $0.numberOfLines = 0
        $0.lineBreakMode = .byWordWrapping
        $0.font = UIFont.preferredFont(forTextStyle: .caption1)
        $0.adjustsFontForContentSizeCategory = true
        return $0
    }(UILabel())

    private let weightLabel: UILabel = {
        $0.font = UIFont.preferredFont(forTextStyle: .caption1)
        $0.textColor = Styles.Colors.grey
        return $0
    }(UILabel())

    private lazy var bottomStack: UIStackView = {
        $0.axis = .horizontal
        $0.spacing = 12
        $0.addArrangedSubview(pricesStack)
        $0.addArrangedSubview(addToCartButton)
        return $0
    }(UIStackView())

    private lazy var pricesStack: UIStackView = {
        $0.axis = .vertical
        $0.addArrangedSubview(priceLabel)
        $0.addArrangedSubview(discountPriceLabel)
        return $0
    }(UIStackView())

    private let priceLabel: UILabel = {
        $0.font = UIFont.preferredFont(forTextStyle: .caption1)
        $0.adjustsFontForContentSizeCategory = true
        $0.textColor = Styles.Colors.red
        return $0
    }(UILabel())

    private let discountPriceLabel = UILabel()

    private let addToCartButton: UIButton = {
        $0.backgroundColor = Styles.Colors.yellow
        $0.setImage(Styles.Images.plus, for: .normal)
        $0.tintColor = .label
        $0.layer.cornerRadius = 15
        return $0
    }(UIButton())

    private let discountBadgeButton: UIButton = {
        $0.backgroundColor = Styles.Colors.red
        $0.titleLabel?.font = UIFont.preferredFont(forTextStyle: .caption2, compatibleWith: .current)
        $0.layer.cornerRadius = 8
        $0.translatesAutoresizingMaskIntoConstraints = false
        return $0
    }(UIButton())

    private let newBadgeButton: UIButton = {
        $0.backgroundColor = Styles.Colors.orange
        $0.setTitle("Новинка", for: .normal)
        $0.titleLabel?.font = UIFont.preferredFont(forTextStyle: .caption2, compatibleWith: .current)
        $0.layer.cornerRadius = 8
        $0.translatesAutoresizingMaskIntoConstraints = false
        return $0
    }(UIButton())

    override init(frame: CGRect) {
        super.init(frame: frame)
        setUp()
    }

    required init(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func configure(with model: MainModel.Item.ViewModel.Promotion) {
        let attributedString = NSMutableAttributedString(string: model.price)
        attributedString.addAttribute(
            NSAttributedString.Key.strikethroughStyle, value: 2, range: NSRange(
                location: 0, length: attributedString.length
            )
        )

        isNew = model.isNew
        imageView.image = model.image
        descriptionLabel.text = model.description
        discountBadgeButton.setTitle(model.discount, for: .normal)
        weightLabel.text = model.weight
        priceLabel.attributedText = attributedString
        discountPriceLabel.text = model.discountPrice

        newBadgeButton.isHidden = !isNew ? true : false
    }
}

private extension PromotionCell {
    func setUp() {
        contentView.layer.cornerRadius = 12
        contentView.backgroundColor = Styles.Colors.cardBackground
        contentView.addSubview(stack)
        contentView.insertSubview(discountBadgeButton, at: 1)
        contentView.insertSubview(newBadgeButton, at: 1)
        activateConstraints()
    }
}

private extension PromotionCell {
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

        NSLayoutConstraint.activate([
            addToCartButton.heightAnchor.constraint(equalToConstant: 30),
            addToCartButton.widthAnchor.constraint(equalToConstant: 30)
        ])

        NSLayoutConstraint.activate([
            discountBadgeButton.widthAnchor.constraint(equalToConstant: 38),
            discountBadgeButton.heightAnchor.constraint(equalToConstant: 16),
            discountBadgeButton.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 4),
            discountBadgeButton.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: 4)
        ])

        NSLayoutConstraint.activate([
            newBadgeButton.widthAnchor.constraint(equalToConstant: 56),
            newBadgeButton.heightAnchor.constraint(equalToConstant: 16),
            newBadgeButton.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 4),
            newBadgeButton.rightAnchor.constraint(equalTo: contentView.rightAnchor, constant: -4)
        ])
    }
}
