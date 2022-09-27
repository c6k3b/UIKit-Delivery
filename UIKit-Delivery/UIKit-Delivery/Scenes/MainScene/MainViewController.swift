import UIKit

final class MainViewController: UIViewController, MainDisplayLogic {
    private let interactor: MainBusinessLogic
    private let router: MainRoutingLogic

    private let mainView = MainView()

    private lazy var menuButton: UIButton = {
        $0.addTarget(self, action: #selector(didMenuButtonTapped), for: .touchUpInside)
        return $0
    }(mainView.addressView.addressButton)

    init(interactor: MainBusinessLogic, router: MainRoutingLogic) {
        self.interactor = interactor
        self.router = router
        super.init(nibName: nil, bundle: nil)
        setUp()
        showItems()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

private extension MainViewController {
    func setUp() {
        view = mainView
    }

    func showItems() {
    }

    @objc func didMenuButtonTapped() {
    }
}
