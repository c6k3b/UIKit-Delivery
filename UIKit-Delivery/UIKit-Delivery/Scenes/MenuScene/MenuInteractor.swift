import Foundation

final class MenuInteractor: MenuBusinessLogic {
    private let presenter: MenuPresentationLogic
    private let worker: MenuWorkerLogic

    private var userInfo: User?
    private var menuOptions: [MenuOption]?

    init(presenter: MenuPresentationLogic, worker: MenuWorkerLogic) {
        self.presenter = presenter
        self.worker = worker
    }

    func fetchMenu(_ request: MenuModels.Items.Request) {
        let mocks = Mocks()
        userInfo = mocks.user
        menuOptions = mocks.menuOptions

        DispatchQueue.main.async { [weak self] in
            let response = MenuModels.Items.Response(
                menuOptions: self?.menuOptions ?? [],
                userInfo: self?.userInfo ?? User(image: "", name: "", phone: "")
            )

            self?.presenter.presentMenu(response)
        }
    }
}
