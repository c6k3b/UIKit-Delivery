import UIKit

final class SearchRouter: SearchRoutingLogic, SearchDataPassing {
    weak var viewController: UIViewController?

    var dataStore: SearchDataStore

    init(dataStore: SearchDataStore) {
        self.dataStore = dataStore
    }

    func routeToMain() {
        if let navigationController = viewController?.navigationController {
            let index = navigationController.viewControllers.count - 2
            let destinationVC = navigationController.viewControllers[index] as? MainViewController
            var destinationDS = destinationVC?.router.dataStore
            passData(source: dataStore, destination: &destinationDS!)
            navigate()
        }
//        let destinationVC = viewController?.presentingViewController as? MainViewController
//        print(destinationVC)
//        var destinationDS = destinationVC?.router.dataStore
//        passData(source: dataStore, destination: &destinationDS!)
//        navigate()
    }
}

private extension SearchRouter {
    func navigate() {
        viewController?.navigationController?.popViewController(animated: true)
//        viewController?.dismiss(animated: true)
//        let navigationController = viewController?.navigationController
//        DispatchQueue.main.async {
//            navigationController?.view.layer.add(CATransition().segueFromTop(), forKey: nil)
//            navigationController?.popViewController(animated: false)
//        }
    }

    func passData(source: SearchDataStore, destination: inout MainDataStore) {
        destination.address = source.address
    }
}
