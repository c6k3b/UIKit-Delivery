import UIKit

final class MainRouter: MainRoutingLogic, MainDataPassing {
    weak var viewController: UIViewController?
    var dataStore: MainDataStore

    init(dataStore: MainDataStore) {
        self.dataStore = dataStore
    }

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
