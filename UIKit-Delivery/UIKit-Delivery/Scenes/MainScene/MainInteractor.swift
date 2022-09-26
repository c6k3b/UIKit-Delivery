import Foundation

final class MainInteractor: MainBusinessLogic {
    private let presenter: MainPresentationLogic
    private let worker: MainWorkerLogic

    init(presenter: MainPresentationLogic, worker: MainWorkerLogic) {
        self.presenter = presenter
        self.worker = worker
    }
}
