protocol MenuBusinessLogic: AnyObject {
    func fetchMenu(_ request: MenuModels.Items.Request)
}

protocol MenuWorkerLogic: AnyObject {
}

protocol MenuPresentationLogic: AnyObject {
    func presentMenu(_ response: MenuModels.Items.Response)
}

protocol MenuDisplayLogic: AnyObject {
    func displayMenu(_ viewModel: MenuModels.Items.ViewModel)
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
    func configure(with model: MenuModels.Items.ViewModel.MenuCell)
}

protocol MenuConfigurableView: AnyObject {
    func configure(with model: MenuModels.Items.ViewModel.UserInfo)
}
