protocol SearchDataPassing: AnyObject {
    var dataStore: SearchDataStore { get }
}

protocol SearchDataStore: AnyObject {
    var address: Address? { get set }
}

protocol SearchBusinessLogic: AnyObject {
    func requestAddress(_ request: SearchModel.Item.Request)
    func setAddress(_ request: SearchModel.Item.Request)
}

protocol SearchWorkerLogic: AnyObject {
    func getAddresses(completion: ([Address]?) -> Void)
}

protocol SearchPresentationLogic: AnyObject {
    func presentAddress(_ response: SearchModel.Item.Response)
}

protocol SearchDisplayLogic: AnyObject {
    func displayAddress(_ viewModel: SearchModel.Item.ViewModel)
}

protocol SearchRoutingLogic: AnyObject {
    func routeToMain()
}

protocol SearchViewConfigurableCell: AnyObject {
    func configure(with model: SearchModel.Item.ViewModel.SearchViewCell)
}
