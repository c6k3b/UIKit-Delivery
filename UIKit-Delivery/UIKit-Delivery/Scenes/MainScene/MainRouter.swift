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
            segueFromLeft(source: viewController, destination: destinationVC)
        }
    }

    func routeToSearch() {
        let destinationVC = SearchAssembly.build()
        if let viewController = viewController {
            segueFromBottom(source: viewController, destination: destinationVC)
        }
    }
}

private extension MainRouter {
    func segueFromLeft(source: UIViewController, destination: UIViewController) {
        let navigationController = source.navigationController
        DispatchQueue.main.async {
            navigationController?.view.layer.add(CATransition().segueFromLeft(), forKey: nil)
            navigationController?.pushViewController(destination, animated: false)
        }
    }

    func segueFromBottom(source: UIViewController, destination: UIViewController) {
//        source.present(destination, animated: true)
        let navigationController = source.navigationController
        DispatchQueue.main.async {
            navigationController?.view.layer.add(CATransition().segueFromBottom(), forKey: nil)
            navigationController?.pushViewController(destination, animated: false)
        }
    }
}
