import UIKit

class SearchCell: UICollectionViewCell {
    static var identifier: String { String(describing: SearchCell.self) }

    private lazy var stack: UIStackView = {
        $0.axis = .horizontal
        $0.spacing = 12
        $0.tintColor = Styles.Colors.grey
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.addArrangedSubview(searchTextField)
        $0.addArrangedSubview(button)
        return $0
    }(UIStackView())

    private lazy var searchTextField: UITextField = {
        let leftContainer = UIView(frame: CGRect(x: 0, y: 0, width: 15, height: 35))
        let rightContainer = UIView(frame: CGRect(x: 0, y: 0, width: 35, height: 35))

        let searchImage: UIImageView = {
            $0.image = Styles.Images.search
            $0.center = rightContainer.center
            return $0
        }(UIImageView(frame: CGRect(x: 0, y: 0, width: 20, height: 20)))

        rightContainer.addSubview(searchImage)

        $0.placeholder = "Поиск товаров"
        $0.backgroundColor = Styles.Colors.cardBackground
        $0.layer.cornerRadius = 5

        $0.leftView = leftContainer
        $0.leftViewMode = .always
        $0.rightView = rightContainer
        $0.rightViewMode = .unlessEditing
        $0.clearButtonMode = .whileEditing
        return $0
    }(UITextField())

    private let button: UIButton = {
        $0.setImage(Styles.Images.favourites, for: .normal)
        return $0
    }(UIButton())

    override init(frame: CGRect) {
        super.init(frame: frame)
        setUp()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func layoutSubviews() {
        super.layoutSubviews()
        activateConstraints()
    }
}

private extension SearchCell {
    func setUp() {
        contentView.addSubview(stack)
    }
}

private extension SearchCell {
    func activateConstraints() {
        NSLayoutConstraint.activate([
            stack.topAnchor.constraint(equalTo: contentView.topAnchor),
            stack.leftAnchor.constraint(equalTo: contentView.leftAnchor),
            stack.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
            stack.rightAnchor.constraint(equalTo: contentView.rightAnchor)
        ])
    }
}
