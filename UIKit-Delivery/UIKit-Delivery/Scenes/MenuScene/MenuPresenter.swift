import UIKit

final class MenuPresenter: MenuPresentationLogic {
    weak var viewController: MenuDisplayLogic?

    private var presentedMenuItems: [MenuModel.Item.ViewModel.MenuCell] = []
    private var presentedUserInfo: MenuModel.Item.ViewModel.User?

    func presentMenu(_ response: MenuModel.Item.Response) {
        for option in response.menuCells {
            let presentedOption = MenuModel.Item.ViewModel.MenuCell(
                label: option.label ?? "",
                subLabel: option.subLabel ?? ""
            )
            presentedMenuItems.append(presentedOption)
        }

        presentedUserInfo = MenuModel.Item.ViewModel.User(
            image: UIImage(systemName: response.userInfo.image ?? "")?
                .withTintColor(Styles.Colors.grey, renderingMode: .alwaysOriginal),
            name: response.userInfo.name,
            phone: response.userInfo.phone
        )

        let viewModel = MenuModel.Item.ViewModel(
            menuCells: presentedMenuItems,
            userInfo: presentedUserInfo ?? MenuModel.Item.ViewModel.User(
                image: UIImage(), name: "", phone: ""
            )
        )

        viewController?.displayMenu(viewModel)
    }
}
