import UIKit

class TitleSupplementaryView: UICollectionReusableView {
    private let label: UILabel = {
        $0.text = "Акции"
        $0.font = UIFont.systemFont(ofSize: 25)
        $0.adjustsFontForContentSizeCategory = true
        $0.translatesAutoresizingMaskIntoConstraints = false
        return $0
    }(UILabel())

    private let button: UIButton = {
        $0.backgroundColor = Styles.Colors.cardBackground
        $0.setTitle("Смотреть все ›", for: .normal)
        $0.setTitleColor(Styles.Colors.black, for: .normal)
        $0.titleLabel?.font = UIFont.systemFont(ofSize: 12)
        $0.layer.cornerRadius = 15
        $0.translatesAutoresizingMaskIntoConstraints = false
        return $0
    }(UIButton())

    override init(frame: CGRect) {
        super.init(frame: frame)
        setUp()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

private extension TitleSupplementaryView {
    func setUp() {
        addSubview(label)
        addSubview(button)
        activateConstraints()
    }
}

private extension TitleSupplementaryView {
    func activateConstraints() {
        NSLayoutConstraint.activate([
            label.topAnchor.constraint(equalTo: topAnchor, constant: 16)
        ])
        NSLayoutConstraint.activate([
            button.rightAnchor.constraint(equalTo: rightAnchor),
            button.centerYAnchor.constraint(equalTo: centerYAnchor, constant: 8),
            button.heightAnchor.constraint(equalToConstant: 30),
            button.widthAnchor.constraint(equalToConstant: 110)
        ])
    }
}
