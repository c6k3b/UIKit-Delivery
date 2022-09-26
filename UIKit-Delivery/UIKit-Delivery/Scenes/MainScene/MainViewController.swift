import UIKit

final class MainViewController: UIViewController, MainDisplayLogic {
    private let interactor: MainBusinessLogic
    private let router: MainRoutingLogic

    init(interactor: MainBusinessLogic, router: MainRoutingLogic) {
        self.interactor = interactor
        self.router = router
        super.init(nibName: nil, bundle: nil)
        view.backgroundColor = .blue
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
