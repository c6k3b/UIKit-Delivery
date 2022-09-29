import UIKit

class SearchCell: UICollectionViewCell {
    static var identifier: String { String(describing: SearchCell.self) }

    private lazy var stack: UIStackView = {
        $0.axis = .horizontal
        $0.spacing = 12
        $0.tintColor = Styles.Colors.grey
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.addArrangedSubview(searchField)
        $0.addArrangedSubview(button)
        return $0
    }(UIStackView())

    private let searchField: UISearchTextField = {
        $0.placeholder = "Поиск товаров"
        $0.backgroundColor = Styles.Colors.background
        return $0
    }(UISearchTextField())

    private let button: UIButton = {
        $0.backgroundColor = Styles.Colors.lightGrey
        $0.setImage(Styles.Images.heart, for: .normal)
        $0.layer.cornerRadius = 17.5
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
        let buttonWidth = 35.0

        NSLayoutConstraint.activate([
            button.widthAnchor.constraint(equalToConstant: buttonWidth)
        ])

        if let superview = superview {
            NSLayoutConstraint.activate([
                searchField.widthAnchor.constraint(
                    equalToConstant: superview.bounds.width - 32 - stack.spacing - buttonWidth
                )
            ])
        }
    }
}
