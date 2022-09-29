import UIKit

enum SearchModel {
    enum Item {
        struct Request {}
        struct Response {}
        struct ViewModel {
            let addressItems: [SearchViewCell]
        }
    }
}

extension SearchModel.Item.ViewModel {
    struct SearchViewCell {
        let street: String
        let city: String
    }
}
