import UIKit

class OptionCell: UICollectionViewCell, MainConfigurableOptionCell {
    static var identifier: String { String(describing: OptionCell.self) }

    private lazy var stack: UIStackView = {
        $0.axis = .vertical
        $0.spacing = 6
        $0.alignment = .center
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
        $0.font = UIFont.preferredFont(forTextStyle: .caption2)
        $0.adjustsFontForContentSizeCategory = true
        $0.textAlignment = .center
        $0.translatesAutoresizingMaskIntoConstraints = false
        return $0
    }(UILabel())

    override init(frame: CGRect) {
        super.init(frame: frame)
        setUp()
    }

    required init(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func configure(with model: MainModel.Item.ViewModel.Option) {
        imageView.image = model.image
        descriptionLabel.text = model.description
    }
}

private extension OptionCell {
    func setUp() {
        contentView.addSubview(stack)
        activateConstraints()
    }
}

private extension OptionCell {
    func activateConstraints() {
        NSLayoutConstraint.activate([
            imageView.heightAnchor.constraint(equalToConstant: 70),
            imageView.widthAnchor.constraint(equalToConstant: 70)
        ])

        NSLayoutConstraint.activate([
            descriptionLabel.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: 2),
            descriptionLabel.rightAnchor.constraint(equalTo: contentView.rightAnchor, constant: -2)
        ])
    }
}
