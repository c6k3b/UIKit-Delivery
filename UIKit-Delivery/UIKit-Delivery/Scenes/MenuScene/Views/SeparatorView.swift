import UIKit

class SeparatorView: UIView {
    override init(frame: CGRect) {
        super.init(frame: frame)
        setUp()
    }

    required init?(coder: NSCoder) { nil }

    override var intrinsicContentSize: CGSize {
        return CGSize(width: UIView.noIntrinsicMetric, height: 1 / UIScreen.main.scale)
    }
}

private extension SeparatorView {
    func setUp() {
        backgroundColor = Styles.Colors.grey.withAlphaComponent(0.2)
    }
}
