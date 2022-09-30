import UIKit

class SearchViewCell: UITableViewCell, SearchViewConfigurableCell {
    static var identifier: String { String(describing: SearchViewCell.self) }

    private lazy var stack: UIStackView = {
        $0.axis = .horizontal
        $0.spacing = 16
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.addArrangedSubview(image)
        $0.addArrangedSubview(addressStack)
        return $0
    }(UIStackView())

    private let image: UIImageView = {
        $0.image = Styles.Images.user
        $0.contentMode = .scaleAspectFill
        $0.translatesAutoresizingMaskIntoConstraints = false
        return $0
    }(UIImageView())

    private lazy var addressStack: UIStackView = {
        $0.axis = .vertical
        $0.spacing = -8
        $0.distribution = .fillEqually
        $0.addArrangedSubview(streetLabel)
        $0.addArrangedSubview(cityLabel)
        return $0
    }(UIStackView())

    private let streetLabel: UILabel = {
        $0.font = UIFont.systemFont(ofSize: 20, weight: .medium)
        return $0
    }(UILabel())

    private let cityLabel: UILabel = {
        $0.font = UIFont.systemFont(ofSize: 20, weight: .medium)
        return $0
    }(UILabel())

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setUp()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func configure(with model: SearchModel.Item.ViewModel.SearchViewCell) {
        streetLabel.text = model.street
        cityLabel.text = model.city
    }
}

private extension SearchViewCell {
    func setUp() {
        contentView.addSubview(stack)
        selectionStyle = .none
        activateConstraints()
    }
}

private extension SearchViewCell {
    func activateConstraints() {
        NSLayoutConstraint.activate([
            stack.topAnchor.constraint(equalTo: contentView.topAnchor),
            stack.leftAnchor.constraint(equalTo: contentView.leftAnchor),
            stack.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
            stack.rightAnchor.constraint(equalTo: contentView.rightAnchor)
        ])
    }
}
