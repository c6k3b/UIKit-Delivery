import UIKit

final class MenuPresenter: MenuPresentationLogic {
    weak var viewController: MenuDisplayLogic?

    typealias User = MenuModel.Item.ViewModel.User
    typealias MenuCell = MenuModel.Item.ViewModel.MenuCell

    private var user: User?
    private var menuCells: [MenuCell] = []

    func presentMenu(_ response: MenuModel.Item.Response) {
        for option in response.menuCells {
            let presentedOption = MenuCell(
                label: option.label ?? "",
                subLabel: option.subLabel ?? ""
            )
            menuCells.append(presentedOption)
        }

        user = User(
            image: UIImage(named: response.userInfo.image ?? "") ?? UIImage(),
            name: response.userInfo.name ?? "",
            phone: response.userInfo.phone ?? ""
        )

        let viewModel = MenuModel.Item.ViewModel(
            menuCells: menuCells,
            userInfo: user ?? User(image: UIImage(), name: "", phone: "")
        )

        viewController?.displayMenu(viewModel)
    }
}
