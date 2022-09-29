import UIKit

class CatalogueCell: UICollectionViewCell {
    lazy var imageView: UIImageView = {
        $0.contentMode = .scaleAspectFit
        $0.frame = contentView.frame
        return $0
    }(UIImageView())

    lazy var label: UILabel = {
        $0.frame = contentView.frame
        return $0
    }(UILabel())

    override init(frame: CGRect) {
        super.init(frame: frame)
        setUp()
    }

    required init(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

private extension CatalogueCell {
    func setUp() {
        contentView.backgroundColor = .gray
        contentView.addSubview(label)
        contentView.addSubview(imageView)
    }
}
