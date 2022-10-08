import UIKit

class MenuCell: UITableViewCell, MenuConfigurableCell {
    static var identifier: String { String(describing: MenuCell.self) }

    private let label = UILabel()
    private let subLabel = UILabel()

    private lazy var stack: UIStackView = {
        label.font = UIFont.systemFont(ofSize: 16, weight: .medium)
        subLabel.font = UIFont.systemFont(ofSize: 14, weight: .regular)
        subLabel.textColor = Styles.Colors.grey

        $0.axis = .vertical
        $0.alignment = .leading
        $0.spacing = 0
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.addArrangedSubview(label)
        $0.addArrangedSubview(subLabel)
        return $0
    }(UIStackView())

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setUp()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func layoutSubviews() {
        super.layoutSubviews()
        contentView.frame = contentView.frame.inset(
            by: UIEdgeInsets(top: 4, left: 0, bottom: 4, right: 0)
        )
    }

    func configure(with model: MenuModel.Item.ViewModel.MenuCell) {
        label.text = model.label
        subLabel.text = model.subLabel
    }
}

private extension MenuCell {
    func setUp() {
        contentView.addSubview(stack)
        selectionStyle = .none
        activateConstraints()
    }
}

private extension MenuCell {
    func activateConstraints() {
        NSLayoutConstraint.activate([
            stack.topAnchor.constraint(equalTo: contentView.topAnchor),
            stack.leftAnchor.constraint(equalTo: contentView.leftAnchor),
            stack.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
            stack.rightAnchor.constraint(equalTo: contentView.rightAnchor)
        ])
    }
}
