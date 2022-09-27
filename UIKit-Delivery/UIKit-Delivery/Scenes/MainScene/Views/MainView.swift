import UIKit

class MainView: UIView {
    private lazy var scrollView: UIScrollView = {
        $0.showsVerticalScrollIndicator = false
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
        $0.addArrangedSubview(promoBannersView)
        $0.addArrangedSubview(actionsLabel)
        $0.addArrangedSubview(promoActionsView)
        $0.addArrangedSubview(catalogueLabel)
        $0.addArrangedSubview(catalogueView)
        return $0
    }(UIStackView())

    // MARK: - Views
    let addressView = AddressView()
    let searchView = SearchView()

    // MARK: - Labels
    private let actionsLabel: UILabel = {
        $0.text = "Акции"
        $0.font = UIFont.systemFont(ofSize: 25)
        return $0
    }(UILabel())

    private let catalogueLabel: UILabel = {
        $0.text = "Каталог"
        $0.font = UIFont.systemFont(ofSize: 25)
        return $0
    }(UILabel())

    // MARK: - Collections
    lazy var promoView: UICollectionView = {
        $0.backgroundColor = .systemBackground
        $0.showsHorizontalScrollIndicator = false
        $0.register(UICollectionViewCell.self, forCellWithReuseIdentifier: "cell")
        $0.dataSource = self
        $0.delegate = self
        return $0
    }(UICollectionView(frame: .zero, collectionViewLayout: promoLayout))

    lazy var promoBannersView: UICollectionView = {
        $0.backgroundColor = .systemBackground
        $0.showsHorizontalScrollIndicator = false
        $0.register(UICollectionViewCell.self, forCellWithReuseIdentifier: "cell")
        $0.dataSource = self
        $0.delegate = self
        return $0
    }(UICollectionView(frame: .zero, collectionViewLayout: promoBannersLayout))

    lazy var promoActionsView: UICollectionView = {
        $0.backgroundColor = .systemBackground
        $0.showsHorizontalScrollIndicator = false
        $0.register(UICollectionViewCell.self, forCellWithReuseIdentifier: "cell")
        $0.dataSource = self
        $0.delegate = self
        return $0
    }(UICollectionView(frame: .zero, collectionViewLayout: promoActionsLayout))

    lazy var catalogueView: UICollectionView = {
        $0.backgroundColor = .systemBackground
        $0.showsHorizontalScrollIndicator = false
        $0.register(UICollectionViewCell.self, forCellWithReuseIdentifier: "cell")
        $0.dataSource = self
        $0.delegate = self
        return $0
    }(UICollectionView(frame: .zero, collectionViewLayout: catalogueLayout))

    // MARK: - Layouts
    private lazy var promoLayout: UICollectionViewFlowLayout = {
        $0.scrollDirection = .horizontal
        $0.itemSize = CGSize(width: 100, height: 100)
        return $0
    }(UICollectionViewFlowLayout())

    private lazy var promoBannersLayout: UICollectionViewFlowLayout = {
        $0.scrollDirection = .horizontal
        $0.itemSize = CGSize(width: 300, height: 100)
        return $0
    }(UICollectionViewFlowLayout())

    private lazy var promoActionsLayout: UICollectionViewFlowLayout = {
        $0.scrollDirection = .horizontal
        $0.itemSize = CGSize(width: 100, height: 150)
        return $0
    }(UICollectionViewFlowLayout())

    private lazy var catalogueLayout: UICollectionViewFlowLayout = {
        $0.itemSize = CGSize(width: 120, height: 150)
        return $0
    }(UICollectionViewFlowLayout())

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

extension MainView: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 9
    }

    func collectionView(
        _ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath
    ) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath)
        cell.layer.borderColor = UIColor.black.cgColor
        cell.layer.borderWidth = 2
        cell.layer.cornerRadius = 8
        return cell
    }
}

extension MainView: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print("User tapped on item \(indexPath.row)")
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
            searchView.widthAnchor.constraint(equalToConstant: bounds.width - 32),
            promoView.heightAnchor.constraint(equalToConstant: 100),
            promoBannersView.heightAnchor.constraint(equalToConstant: 100),
            actionsLabel.heightAnchor.constraint(equalToConstant: 25),
            promoActionsView.heightAnchor.constraint(equalToConstant: 150),
            catalogueLabel.heightAnchor.constraint(equalToConstant: 25),
            catalogueView.heightAnchor.constraint(equalToConstant: 550),
            catalogueView.widthAnchor.constraint(equalToConstant: bounds.width - 32)
        ])
    }
}
