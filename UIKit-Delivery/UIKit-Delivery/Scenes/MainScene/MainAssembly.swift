import UIKit

enum MainAssembly {
    static func build() -> UIViewController {
        let presenter = MainPresenter()
        let worker = MainWorker()
        let interactor = MainInteractor(presenter: presenter, worker: worker)
        let router = MainRouter()
        let viewController = MainViewController(interactor: interactor, router: router)

        presenter.viewController = viewController
        router.viewController = viewController

        return viewController
    }
}
