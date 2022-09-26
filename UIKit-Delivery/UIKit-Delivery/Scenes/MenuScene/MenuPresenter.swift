import UIKit

final class MenuPresenter: MenuPresentationLogic {
    weak var viewController: MenuDisplayLogic?

    private var presentedMenuItems: [MenuModels.Items.ViewModel.MenuCell] = []
    private var presentedUserInfo: MenuModels.Items.ViewModel.UserInfo?

    func presentMenu(_ response: MenuModels.Items.Response) {
        for option in response.menuOptions {
            let presentedOption = MenuModels.Items.ViewModel.MenuCell(
                label: option.label ?? "",
                subLabel: option.subLabal ?? ""
            )
            presentedMenuItems.append(presentedOption)
        }

        presentedUserInfo = MenuModels.Items.ViewModel.UserInfo(
            userImage: UIImage(systemName: response.userInfo.image ?? "")?
                .withTintColor(Styles.Colors.grey, renderingMode: .alwaysOriginal),
            name: response.userInfo.name,
            phone: response.userInfo.phone
        )

        let viewModel = MenuModels.Items.ViewModel(
            menuOptions: presentedMenuItems,
            userInfo: presentedUserInfo ?? MenuModels.Items.ViewModel.UserInfo(
                userImage: UIImage(), name: "", phone: ""
            )
        )

        viewController?.displayMenu(viewModel)
    }
}
