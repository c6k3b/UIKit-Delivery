import Foundation

final class MenuInteractor: MenuBusinessLogic {
    private let presenter: MenuPresentationLogic
    private let worker: MenuWorkerLogic

    typealias User = MenuModel.Item.Response.User
    typealias MenuOption = MenuModel.Item.Response.MenuCell

    private var userInfo: User?
    private var menuOptions: [MenuOption]?

    init(presenter: MenuPresentationLogic, worker: MenuWorkerLogic) {
        self.presenter = presenter
        self.worker = worker
    }

    func fetchMenu(_ request: MenuModel.Item.Request) {
        setMockData()

        DispatchQueue.main.async { [weak self] in
            let response = MenuModel.Item.Response(
                menuCells: self?.menuOptions ?? [],
                userInfo: self?.userInfo ?? User(image: "", name: "", phone: "")
            )
            self?.presenter.presentMenu(response)
        }
    }
}

private extension MenuInteractor {
    func setMockData() {
        let mocks = Mocks()
        userInfo = mocks.user
        menuOptions = mocks.menuCells
    }
}
