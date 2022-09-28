import UIKit

class PromoCell: UICollectionViewCell {
    private lazy var stack: UIStackView = {
        $0.axis = .vertical
        $0.alignment = .center
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.addArrangedSubview(imageView)
        $0.addArrangedSubview(label)
        return $0
    }(UIStackView())

    let imageView: UIImageView = {
        $0.contentMode = .scaleAspectFit
        return $0
    }(UIImageView())

    let label: UILabel = {
        $0.font = UIFont.preferredFont(forTextStyle: .caption1)
        $0.adjustsFontForContentSizeCategory = true
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
}

private extension PromoCell {
    func setUp() {
//        contentView.backgroundColor = .gray
        contentView.addSubview(stack)
        activateConstraints()
    }
}

private extension PromoCell {
    func activateConstraints() {
        NSLayoutConstraint.activate([
            imageView.widthAnchor.constraint(equalToConstant: 70),
            imageView.heightAnchor.constraint(equalToConstant: 70)
        ])

        NSLayoutConstraint.activate([
            label.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: 2),
            label.rightAnchor.constraint(equalTo: contentView.rightAnchor, constant: -2)
        ])
    }
}
