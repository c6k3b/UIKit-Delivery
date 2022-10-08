import UIKit

final class SearchPresenter: SearchPresentationLogic {
    weak var viewController: SearchDisplayLogic?

    typealias Address = SearchModel.Item.ViewModel.AddressListCell

    private var addressList: [Address] = []

    func presentAddress(_ response: SearchModel.Item.Response) {
        addressList.removeAll()
        for address in response.addressList {
            let presentedAddress = Address(
                street: "\(address.street ?? "") "
                      + "\(address.streetType ?? "") "
                      + "\(address.house ?? "")",
                city: "\(address.city ?? "") "
                      + "\(address.region ?? "") "
                      + "\(address.regionType ?? "") "
                      + "\(address.country ?? "")"
            )
            addressList.append(presentedAddress)
        }

        let viewModel = SearchModel.Item.ViewModel(addressList: addressList)
        viewController?.displayAddress(viewModel)
    }
}
