import UIKit

class AddressView: UIStackView {
    private let menuButton: UIButton = {
        $0.setImage(Styles.Images.menu, for: .normal)
        return $0
    }(UIButton())

    private lazy var deliveryStack: UIStackView = {
        $0.axis = .vertical
        $0.spacing = -4
        $0.alignment = .leading
        $0.addArrangedSubview(label)
        $0.addArrangedSubview(addressButton)
        return $0
    }(UIStackView())

    private let label: UILabel = {
        $0.text = "Доставка"
        $0.textColor = Styles.Colors.grey
        $0.font = UIFont.systemFont(ofSize: 14)
        return $0
    }(UILabel())

    lazy var addressButton: UIButton = {
        $0.setTitle("Пискунова, 24" + " ›", for: .normal)
        $0.setTitleColor(.label, for: .normal)
        $0.titleLabel?.font = UIFont.systemFont(ofSize: 16, weight: .regular)
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

private extension AddressView {
    func setUp() {
        axis = .horizontal
        spacing = 24

        addArrangedSubview(menuButton)
        addArrangedSubview(deliveryStack)
    }
}
