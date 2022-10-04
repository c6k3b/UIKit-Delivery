import UIKit

final class SearchPresenter: SearchPresentationLogic {
    weak var viewController: SearchDisplayLogic?

    typealias Address = SearchModel.Item.ViewModel.AddressListCell

    private var addressList: [Address] = []

    func presentAddress(_ response: SearchModel.Item.Response) {
        for address in response.addressList {
            let presentedAddress = Address(
                street: "\(address.street ?? "") "
                      + "\(address.streetType ?? "")., "
                      + "\(address.house ?? "")",
                city: "\(address.city ?? ""), "
                      + "\(address.regionType ?? "") "
                      + "\(address.region ?? ""), "
                      + "\(address.country ?? "")"
            )
            addressList.append(presentedAddress)
        }

        let viewModel = SearchModel.Item.ViewModel(addressList: addressList)
        viewController?.displayAddress(viewModel)
    }
}
