import UIKit

class SearchViewCell: UITableViewCell, SearchViewConfigurableCell {
    static var identifier: String { String(describing: SearchViewCell.self) }

    private let streetLabel = UILabel()
    private let cityLabel = UILabel()

    private lazy var stack: UIStackView = {
        let image = UIImageView(image: Styles.Images.pin)
        lazy var addressStack: UIStackView = {
            streetLabel.font = UIFont.systemFont(ofSize: 16, weight: .medium)
            cityLabel.font = UIFont.systemFont(ofSize: 14, weight: .medium)
            cityLabel.textColor = Styles.Colors.grey

            $0.axis = .vertical
            $0.spacing = 0
            $0.alignment = .leading
            $0.distribution = .fillEqually
            $0.addArrangedSubview(streetLabel)
            $0.addArrangedSubview(cityLabel)
            return $0
        }(UIStackView())

        image.contentMode = .scaleAspectFit

        $0.axis = .horizontal
        $0.spacing = 16
        $0.alignment = .center
        $0.distribution = .equalSpacing
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.addArrangedSubview(image)
        $0.addArrangedSubview(addressStack)
        return $0
    }(UIStackView())

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setUp()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func configure(with model: SearchModel.Item.ViewModel.AddressListCell) {
        streetLabel.text = model.street
        cityLabel.text = model.city
    }
}

private extension SearchViewCell {
    func setUp() {
        contentView.addSubview(stack)
    }
}
