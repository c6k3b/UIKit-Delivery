import UIKit

class SearchView: UIStackView {
    private let searchField: UISearchTextField = {
        $0.placeholder = "Поиск товаров"
        $0.backgroundColor = Styles.Colors.background
        $0.leftView = UIImageView(image: Styles.Images.magnifying)
        return $0
    }(UISearchTextField())

    private let searchButton: UIButton = {
        $0.backgroundColor = Styles.Colors.lightGrey
        $0.setImage(Styles.Images.heart, for: .normal)
        $0.layer.cornerRadius = 17.5
        return $0
    }(UIButton())

    override init(frame: CGRect) {
        super.init(frame: frame)
        setUp()
    }

    required init(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

private extension SearchView {
    func setUp() {
        axis = .horizontal
        spacing = 12
        tintColor = Styles.Colors.grey
        addArrangedSubview(searchField)
        addArrangedSubview(searchButton)
        activateConstraints()
    }
}

private extension SearchView {
    func activateConstraints() {
        NSLayoutConstraint.activate([
            searchButton.widthAnchor.constraint(equalToConstant: 35)
        ])
    }
}
