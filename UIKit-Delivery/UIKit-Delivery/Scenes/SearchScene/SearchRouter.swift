import UIKit

final class SearchRouter: SearchRoutingLogic, SearchDataPassing {
    weak var viewController: UIViewController?
    var dataStore: SearchDataStore

    init(dataStore: SearchDataStore) {
        self.dataStore = dataStore
    }

    func routeToMain() {
    }
}
