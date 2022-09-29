import Foundation

final class SearchInteractor: SearchBusinessLogic {
    private let presenter: SearchPresentationLogic
    private let worker: SearchWorkerLogic

    init(presenter: SearchPresentationLogic, worker: SearchWorkerLogic) {
        self.presenter = presenter
        self.worker = worker
    }
}
