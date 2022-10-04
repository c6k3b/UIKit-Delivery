protocol SearchDataPassing: AnyObject {
    var dataStore: SearchDataStore { get }
}

protocol SearchDataStore: AnyObject {
    var addressList: [Address] { get set }
    var address: Address { get set }
}

protocol SearchBusinessLogic: AnyObject {
    func requestAddressList(query: String, request: SearchModel.Item.Request)
    func setAddress(_ index: Int)
}

protocol SearchWorkerLogic: AnyObject {
    func getAddressList(query: String, completion: ([Address]) -> Void)
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
    func configure(with model: SearchModel.Item.ViewModel.AddressListCell)
}
