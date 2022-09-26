import UIKit

enum MenuAssembly {
    static func build() -> UIViewController {
        let presenter = MenuPresenter()
        let worker = MenuWorker()
        let interactor = MenuInteractor(presenter: presenter, worker: worker)
        let router = MenuRouter()
        let viewController = MenuViewController(interactor: interactor, router: router)

        presenter.viewController = viewController
        router.viewController = viewController

        return viewController
    }
}
