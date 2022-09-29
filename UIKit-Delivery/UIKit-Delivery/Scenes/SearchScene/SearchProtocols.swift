protocol SearchBusinessLogic: AnyObject {
}

protocol SearchWorkerLogic: AnyObject {
}

protocol SearchPresentationLogic: AnyObject {
}

protocol SearchDisplayLogic: AnyObject {
}

protocol SearchRoutingLogic: AnyObject {
}

protocol SearchViewConfigurableCell: AnyObject {
    func configure(with model: SearchModel.Item.ViewModel.SearchViewCell)
}
