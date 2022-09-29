import UIKit

enum SearchAssembly {
    static func build() -> UIViewController {
        let presenter = SearchPresenter()
        let worker = SearchWorker()
        let interactor = SearchInteractor(presenter: presenter, worker: worker)
        let router = SearchRouter()
        let viewController = SearchViewController(interactor: interactor, router: router)

        presenter.viewController = viewController
        router.viewController = viewController

        return viewController
    }
}
