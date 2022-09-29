protocol MenuBusinessLogic: AnyObject {
    func fetchMenu(_ request: MenuModel.Item.Request)
}

protocol MenuWorkerLogic: AnyObject {
}

protocol MenuPresentationLogic: AnyObject {
    func presentMenu(_ response: MenuModel.Item.Response)
}

protocol MenuDisplayLogic: AnyObject {
    func displayMenu(_ viewModel: MenuModel.Item.ViewModel)
}

protocol MenuRoutingLogic: AnyObject {
    func routeToPayment()
    func routeToDirections()
    func routeToOrders()
    func routeToFavorites()
    func routeToNews()
    func routeToCoupons()
    func routeToAbout()
    func routeToInviteFriends()
    func routeToSettings()
    func routeToContacts()
}

protocol MenuConfigurableCell: AnyObject {
    func configure(with model: MenuModel.Item.ViewModel.MenuCell)
}

protocol MenuConfigurableView: AnyObject {
    func configure(with model: MenuModel.Item.ViewModel.User)
}
