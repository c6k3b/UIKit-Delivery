import UIKit

final class MainRouter: MainRoutingLogic {
    weak var viewController: UIViewController?

    func routeToMenu() {
        let destinationVC = MenuAssembly.build()
        if let viewController = viewController {
            navigate(source: viewController, destination: destinationVC)
        }
    }

    func routeToSearch() {
        let destinationVC = SearchAssembly.build()
        if let viewController = viewController {
            navigate(source: viewController, destination: destinationVC)
        }
    }
}

private extension MainRouter {
    func navigate(source: UIViewController, destination: UIViewController) {
        source.show(destination, sender: self)
    }
}
