import UIKit

enum MenuModels {
    enum Items {
        struct Request {}
        struct Response {
            let menuOptions: [MenuOption]
            let userInfo: User
        }
        struct ViewModel {
            let menuOptions: [MenuCell]
            let userInfo: UserInfo
        }
    }
}

extension MenuModels.Items.ViewModel {
    struct MenuCell {
        let label: String
        let subLabel: String?
    }
}

extension MenuModels.Items.ViewModel {
    struct UserInfo {
        let userImage: UIImage?
        let name: String?
        let phone: String?
    }
}
