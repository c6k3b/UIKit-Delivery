import UIKit

class PromoView: UICollectionView {
    private lazy var contentView: UIView = {
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.addSubview(stack)
        return $0
    }(UIView())

    private lazy var stack: UIStackView = {
        $0.axis = .horizontal
        $0.spacing = 16
        $0.tintColor = Styles.Colors.grey
        $0.translatesAutoresizingMaskIntoConstraints = false
        for index in 0 ..< 16 {
            let label: UILabel = {
                $0.text = "Option \(index + 1)"
                return $0
            }(UILabel())
            let stack: UIStackView = {
                $0.axis = .vertical
                $0.addArrangedSubview(UIImageView(image: Styles.Images.circle))
                $0.addArrangedSubview(label)
                return $0
            }(UIStackView())
            $0.addArrangedSubview(stack)
        }
        return $0
    }(UIStackView())

    override init(frame: CGRect, collectionViewLayout layout: UICollectionViewLayout) {
        super.init(frame: frame, collectionViewLayout: layout)
        setUp()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func layoutSubviews() {
        super.layoutSubviews()
    }
}

private extension PromoView {
    func setUp() {
        backgroundColor = .orange
        translatesAutoresizingMaskIntoConstraints = false
        addSubview(contentView)
    }
}
