protocol MainDataPassing: AnyObject {
    var dataStore: MainDataStore { get }
}

protocol MainDataStore: AnyObject {
    var address: Address { get set }
}

protocol MainBusinessLogic: AnyObject {
    func fetchMain(_ request: MainModel.Item.Request)
    func storeAddress()
}

protocol MainWorkerLogic: AnyObject {
}

protocol MainPresentationLogic: AnyObject {
    func presentMain(_ response: MainModel.Item.Response)
}

protocol MainDisplayLogic: AnyObject {
    func displayMain(_ viewModel: MainModel.Item.ViewModel)
}

protocol MainRoutingLogic: AnyObject {
    func routeToMenu()
    func routeToSearch()
}

// Cells
protocol MainConfigurableOptionCell {
    func configure(with model: MainModel.Item.ViewModel.Option)
}

protocol MainConfigurableBannerCell {
    func configure(with model: MainModel.Item.ViewModel.Banner)
}

protocol MainConfigurablePromotionCell {
    func configure(with model: MainModel.Item.ViewModel.Promotion)
}

protocol MainConfigurableCatalogueItemCell {
    func configure(with model: MainModel.Item.ViewModel.CatalogueItem)
}
