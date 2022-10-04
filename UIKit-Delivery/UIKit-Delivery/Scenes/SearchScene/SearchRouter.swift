import UIKit

final class SearchRouter: SearchRoutingLogic, SearchDataPassing {
    weak var viewController: UIViewController?
    var dataStore: SearchDataStore

    init(dataStore: SearchDataStore) {
        self.dataStore = dataStore
    }

    func routeToMain() {
        let destinationVC = MainAssembly.build() as? MainViewController
        if let destinationVC = destinationVC {
            var destinationDS = destinationVC.router.dataStore
            passData(source: dataStore, destination: &destinationDS)
            navigate()
        }
    }
}

private extension SearchRouter {
    func navigate() {
        viewController?.dismiss(animated: true)
    }

    func passData(source: SearchDataStore, destination: inout MainDataStore) {
        destination.address = source.address
    }
}
