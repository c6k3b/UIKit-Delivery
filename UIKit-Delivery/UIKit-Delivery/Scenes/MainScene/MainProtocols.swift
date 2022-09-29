protocol MainBusinessLogic: AnyObject {
}

protocol MainWorkerLogic: AnyObject {
}

protocol MainPresentationLogic: AnyObject {
}

protocol MainDisplayLogic: AnyObject {
}

protocol MainRoutingLogic: AnyObject {
    func routeToMenu()
    func routeToSearch()
}
