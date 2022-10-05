import Foundation

final class SearchInteractor: SearchBusinessLogic, SearchDataStore {
    private let presenter: SearchPresentationLogic
    private let worker: SearchWorkerLogic

    var addressList: [Address] = []
    var address: Address = Address()

    init(presenter: SearchPresentationLogic, worker: SearchWorkerLogic) {
        self.presenter = presenter
        self.worker = worker
    }

    func requestAddressList(query: String, request: SearchModel.Item.Request) {
        self.worker.getAddressList(query: query) {
            self.addressList = $0

            DispatchQueue.main.async { [weak self] in
                let response = SearchModel.Item.Response(addressList: self?.addressList ?? [])
                self?.presenter.presentAddress(response)
                print(response)
            }
        }
    }

    func setAddress(_ index: Int) {
        self.address = addressList[index]
    }
}

private extension SearchInteractor {
    func setMockData() {
        let mocks = Mocks()
        addressList = mocks.addressList
    }
}
