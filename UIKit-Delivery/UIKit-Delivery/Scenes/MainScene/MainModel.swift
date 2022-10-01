import UIKit

enum MainModel {
    enum Item {
        struct Request {}
        struct Response {
            let options: [Option]
            let banners: [Banner]
            let promotions: [Promotion]
            let catalogue: [CatalogueItem]
        }
        struct ViewModel {
            let options: [Option]
            let banners: [Banner]
            let promotions: [Promotion]
            let catalogue: [CatalogItem]
        }
    }
}

extension MainModel.Item.Response {
    struct Option {
        let image: String?
        let description: String?
    }

    struct Banner {
        let image: String?
        let description1: String?
        let description2: String?
    }

    struct Promotion {
        let isNew: Bool?
        let image: String?
        let description: String?
        let discount: Int?
        let weight: Int?
        let price: Int?
        let discountPrice: Int?
    }

    struct CatalogueItem {
        let image: String?
        let description: String?
    }
}

extension MainModel.Item.ViewModel {
    struct Option {
        let image: UIImage
        let description: String
    }

    struct Banner {
        let image: UIImage
        let description1: String
        let description2: String
    }

    struct Promotion {
        let isNew: Bool
        let image: UIImage
        let description: String
        let discount: Int
        let weight: Int
        let price: Int
        let discountPrice: Int
    }

    struct CatalogItem {
        let image: String
        let description: String
    }
}
