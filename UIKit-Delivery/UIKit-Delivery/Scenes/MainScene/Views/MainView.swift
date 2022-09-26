import UIKit

class MainView: UIView {
    private lazy var scrollView: UIScrollView = {
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.addSubview(contentView)
        return $0
    }(UIScrollView())

    private lazy var contentView: UIView = {
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.addSubview(stack)
        return $0
    }(UIView())

    private lazy var stack: UIStackView = {
        $0.axis = .vertical
        $0.spacing = 16
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.addArrangedSubview(addressView)
        $0.addArrangedSubview(searchView)
        $0.addArrangedSubview(promoView)
//        $0.addArrangedSubview(promoBannersView)
//        $0.addArrangedSubview(promoItemsView)
//        $0.addArrangedSubview(catalogView)
        return $0
    }(UIStackView())

    let addressView = AddressView()
    let searchView = SearchView()
    let promoView = PromoView(frame: .zero, collectionViewLayout: UICollectionViewFlowLayout())
    let promoBannersView = PromoBannersView()
    let promoItemsView = PromoActionsView()
    let catalogView = CatalogView()

    override init(frame: CGRect) {
        super.init(frame: frame)
        setUp()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func layoutSubviews() {
        super.layoutSubviews()
        activateConstraints()
    }
}

private extension MainView {
    func setUp() {
        backgroundColor = Styles.Colors.background
        addSubview(scrollView)
    }
}

private extension MainView {
    func activateConstraints() {
        NSLayoutConstraint.activate([
            scrollView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor),
            scrollView.leftAnchor.constraint(equalTo: leftAnchor),
            scrollView.bottomAnchor.constraint(equalTo: bottomAnchor),
            scrollView.rightAnchor.constraint(equalTo: rightAnchor)
        ])

        NSLayoutConstraint.activate([
            contentView.topAnchor.constraint(equalTo: scrollView.topAnchor),
            contentView.leftAnchor.constraint(equalTo: scrollView.leftAnchor, constant: 16),
            contentView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor, constant: -16),
            contentView.rightAnchor.constraint(equalTo: scrollView.rightAnchor)
        ])

        NSLayoutConstraint.activate([
            stack.topAnchor.constraint(equalTo: contentView.topAnchor),
            stack.leftAnchor.constraint(equalTo: contentView.leftAnchor),
            stack.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
            stack.rightAnchor.constraint(equalTo: contentView.rightAnchor)
        ])

        NSLayoutConstraint.activate([
//            addressView.widthAnchor.constraint(equalToConstant: bounds.width - 32),
            searchView.widthAnchor.constraint(equalToConstant: bounds.width - 32)
        ])
    }
}
