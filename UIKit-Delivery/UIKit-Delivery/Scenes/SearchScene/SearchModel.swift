import UIKit

enum SearchModel {
    enum Item {
        struct Request {}
        struct Response {
            let addressList: [Address]
        }
        struct ViewModel {
            let addressList: [AddressListCell]
        }
    }
}

extension SearchModel.Item.ViewModel {
    struct AddressListCell {
        let street: String
        let city: String
    }
}
