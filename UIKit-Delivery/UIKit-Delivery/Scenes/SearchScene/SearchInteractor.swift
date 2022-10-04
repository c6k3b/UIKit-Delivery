import Foundation

final class SearchInteractor: SearchBusinessLogic, SearchDataStore {
    private let presenter: SearchPresentationLogic
    private let worker: SearchWorkerLogic
    var address: Address?

    init(presenter: SearchPresentationLogic, worker: SearchWorkerLogic) {
        self.presenter = presenter
        self.worker = worker
    }

    func requestAddress(_ request: SearchModel.Item.Request) {
    }

    func setAddress(_ request: SearchModel.Item.Request) {
    }
}
