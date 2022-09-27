import UIKit

class PromoViewCell: UIStackView {
    private let imageName: String
    private let labelText: String

    private lazy var image: UIImageView = {
        $0.image = UIImage(systemName: imageName)
        $0.contentMode = .scaleAspectFit
        $0.widthAnchor.constraint(equalToConstant: 70).isActive = true
        $0.heightAnchor.constraint(equalToConstant: 70).isActive = true
        return $0
    }(UIImageView())

    private lazy var label: UILabel = {
        $0.text = labelText
        return $0
    }(UILabel())

    init(imageName: String, labelText: String) {
        self.imageName = imageName
        self.labelText = labelText
        super.init(frame: .zero)
        setUp()
    }

    required init(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func layoutSubviews() {
        super.layoutSubviews()
    }
}

private extension PromoViewCell {
    func setUp() {
        axis = .vertical
        alignment = .center
        addArrangedSubview(image)
        addArrangedSubview(label)
    }
}
