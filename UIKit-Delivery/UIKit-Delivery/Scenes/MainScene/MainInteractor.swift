import Foundation

final class MainInteractor: MainBusinessLogic {
    private let presenter: MainPresentationLogic
    private let worker: MainWorkerLogic

    typealias Option = MainModel.Item.Response.Option
    typealias Banner = MainModel.Item.Response.Banner
    typealias Promotion = MainModel.Item.Response.Promotion
    typealias CatalogueItem = MainModel.Item.Response.CatalogueItem

    private var options: [Option]?
    private var banners: [Banner]?
    private var promotions: [Promotion]?
    private var catalogue: [CatalogueItem]?

    init(presenter: MainPresentationLogic, worker: MainWorkerLogic) {
        self.presenter = presenter
        self.worker = worker
    }

    func fetchMain(_ request: MainModel.Item.Request) {
        setMockData()

        DispatchQueue.main.async { [weak self] in
            let response = MainModel.Item.Response(
                options: self?.options ?? [],
                banners: self?.banners ?? [],
                promotions: self?.promotions ?? [],
                catalogue: self?.catalogue ?? []
            )
            self?.presenter.presentMain(response)
        }
    }

    func storeAddress() {
    }
}

private extension MainInteractor {
    func setMockData() {
        let mocks = Mocks()
        options = mocks.options
        banners = mocks.banners
        promotions = mocks.promotions
        catalogue = mocks.catalogue
    }
}
