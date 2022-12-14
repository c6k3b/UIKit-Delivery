import UIKit

final class MainPresenter: MainPresentationLogic {
    weak var viewController: MainDisplayLogic?

    typealias Option = MainModel.Item.ViewModel.Option
    typealias Banner = MainModel.Item.ViewModel.Banner
    typealias Promotion = MainModel.Item.ViewModel.Promotion
    typealias CatalogueItem = MainModel.Item.ViewModel.CatalogueItem

    func presentMain(_ response: MainModel.Item.Response) {
        var options: [Option] = []
        var banners: [Banner] = []
        var promotions: [Promotion] = []
        var catalogue: [CatalogueItem] = []

        for option in response.options {
            let presentedOption = Option(
                image: UIImage(named: option.image ?? "") ?? UIImage(),
                description: option.description ?? ""
            )
            options.append(presentedOption)
        }

        for banner in response.banners {
            let presentedBanner = Banner(
                image: UIImage(named: banner.image ?? "") ?? UIImage(),
                description1: banner.description1 ?? "",
                description2: banner.description2 ?? ""
            )
            banners.append(presentedBanner)
        }

        for promotion in response.promotions {
            let presentedPromotion = Promotion(
                isNew: promotion.isNew ?? false,
                image: UIImage(named: promotion.image ?? "") ?? UIImage(),
                description: promotion.description ?? "",
                discount: "-\(promotion.discount ?? 0)%",
                weight: "\(promotion.weight ?? 0) г",
                price: "\(promotion.price ?? 0) ₽",
                discountPrice: "\(promotion.discountPrice ?? 0) ₽"
            )
            promotions.append(presentedPromotion)
        }

        for catalogueItem in response.catalogue {
            let presentedItem = CatalogueItem(
                image: UIImage(named: catalogueItem.image ?? "") ?? UIImage(),
                description: catalogueItem.description ?? "",
                backgroundColor: UIColor(hex: catalogueItem.backgroundColor ?? 0x000000)
            )
            catalogue.append(presentedItem)
        }

        let presentedDeliveryAddress =
            "\(response.deliveryAddress.street ?? "---------")"
            .appending(response.deliveryAddress.house != nil ? ", " : "")
            .appending(response.deliveryAddress.house ?? "")

        let viewModel = MainModel.Item.ViewModel(
            options: options,
            banners: banners,
            promotions: promotions,
            catalogue: catalogue,
            deliveryAddress: presentedDeliveryAddress
        )

        viewController?.displayMain(viewModel)
    }
}
