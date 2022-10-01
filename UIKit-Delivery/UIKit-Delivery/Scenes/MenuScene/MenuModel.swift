import UIKit

enum MenuModel {
    enum Item {
        struct Request {}
        struct Response {
            let menuCells: [MenuCell]
            let userInfo: User
        }
        struct ViewModel {
            let menuCells: [MenuCell]
            let userInfo: User
        }
    }
}

extension MenuModel.Item.Response {
    struct User {
        let image: String?
        let name: String?
        let phone: String?
    }

    struct MenuCell {
        let label: String?
        let subLabel: String?
    }
}

extension MenuModel.Item.ViewModel {
    struct MenuCell {
        let label: String
        let subLabel: String
    }

    struct User {
        let image: UIImage
        let name: String
        let phone: String
    }
}
