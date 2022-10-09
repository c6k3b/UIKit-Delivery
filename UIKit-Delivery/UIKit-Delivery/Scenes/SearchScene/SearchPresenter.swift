import UIKit

final class SearchPresenter: SearchPresentationLogic {
    weak var viewController: SearchDisplayLogic?

    typealias Address = SearchModel.Item.ViewModel.AddressListCell

    func presentAddress(_ response: SearchModel.Item.Response) {
        var addressList: [Address] = []

        for address in response.addressList {
            let presentedAddress = Address(
                street: "\(address.street ?? "") "
                    .appending("\(address.streetType ?? ""). ")
                    .appending("\(address.house ?? "")"),
                city: "\(address.city ?? ""), "
                    .appending("\(address.region ?? "") ")
                    .appending("\(address.regionType ?? ""), ")
                    .appending("\(address.country ?? "")")
            )
            addressList.append(presentedAddress)
        }

        let viewModel = SearchModel.Item.ViewModel(addressList: addressList)
        viewController?.displayAddress(viewModel)
    }
}
