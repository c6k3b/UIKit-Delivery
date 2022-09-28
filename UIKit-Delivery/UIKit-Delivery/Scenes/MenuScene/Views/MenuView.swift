import UIKit

class MenuView: UIView, MenuConfigurableView {
    private lazy var stack: UIStackView = {
        $0.axis = .vertical
        $0.spacing = 20
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.addArrangedSubview(userStack)
        $0.addArrangedSubview(SeparatorView())
        $0.addArrangedSubview(optionsTable)
        return $0
    }(UIStackView())

    private lazy var userStack: UIStackView = {
        $0.axis = .horizontal
        $0.distribution = .fill
        $0.spacing = 30
        $0.addArrangedSubview(userImage)
        $0.addArrangedSubview(userInfoStack)
        return $0
    }(UIStackView())

    private let userImage: UIImageView = {
        $0.contentMode = .scaleAspectFill
        $0.translatesAutoresizingMaskIntoConstraints = false
        return $0
    }(UIImageView())

    private lazy var userInfoStack: UIStackView = {
        $0.axis = .vertical
        $0.spacing = -8
        $0.distribution = .fillEqually
        $0.addArrangedSubview(nameLabel)
        $0.addArrangedSubview(phoneLabel)
        return $0
    }(UIStackView())

    private let nameLabel: UILabel = {
        $0.font = UIFont.systemFont(ofSize: 20, weight: .medium)
        return $0
    }(UILabel())

    private let phoneLabel: UILabel = {
        $0.font = UIFont.systemFont(ofSize: 20, weight: .regular)
        return $0
    }(UILabel())

    let optionsTable: UITableView = {
        $0.showsVerticalScrollIndicator = false
        $0.separatorStyle = .none
        $0.register(MenuCell.self, forCellReuseIdentifier: MenuCell.identifier)
        return $0
    }(UITableView())

    private let footerButton: UIButton = {
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.contentHorizontalAlignment = .left
        $0.titleLabel?.numberOfLines = 0
        $0.setImage(Styles.Images.textBuble, for: .normal)
        $0.setTitle(" Связаться\n с нами", for: .normal)
        $0.setTitleColor(Styles.Colors.grey, for: .normal)
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
        activateConstraints()
    }

    func configure(with model: MenuModels.Items.ViewModel.UserInfo) {
        userImage.image = model.userImage
        nameLabel.text = model.name
        phoneLabel.text = model.phone
    }
}

private extension MenuView {
    func setUp() {
        backgroundColor = Styles.Colors.background
        addSubview(stack)
        addSubview(footerButton)
    }
}

private extension MenuView {
    func activateConstraints() {
        NSLayoutConstraint.activate([
            stack.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor),
            stack.leftAnchor.constraint(equalTo: safeAreaLayoutGuide.leftAnchor, constant: 16),
            stack.bottomAnchor.constraint(equalTo: footerButton.topAnchor, constant: -20),
            stack.rightAnchor.constraint(equalTo: safeAreaLayoutGuide.rightAnchor, constant: -16)
        ])

        NSLayoutConstraint.activate([
            userImage.heightAnchor.constraint(equalToConstant: 60),
            userImage.widthAnchor.constraint(equalToConstant: 60)
        ])

        NSLayoutConstraint.activate([
            footerButton.leftAnchor.constraint(equalTo: leftAnchor, constant: 40),
            footerButton.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor),
            footerButton.rightAnchor.constraint(equalTo: rightAnchor, constant: -40)
        ])
    }
}
