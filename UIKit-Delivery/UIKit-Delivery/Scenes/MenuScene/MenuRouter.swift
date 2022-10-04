import UIKit

final class MenuRouter: MenuRoutingLogic {
    weak var viewController: UIViewController?

    func routeToPayment() {
        print("navigating to Payment Controller..")
    }

    func routeToDirections() {
        print("navigating to Directions Controller..")
    }

    func routeToOrders() {
        print("navigating to Orders Controller..")
    }

    func routeToFavorites() {
        print("navigating to Favourites Controller..")
    }

    func routeToNews() {
        print("navigating to News Controller..")
    }

    func routeToCoupons() {
        print("navigating to Coupons Controller..")
    }

    func routeToAbout() {
        print("navigating to About Controller..")
    }

    func routeToInviteFriends() {
        print("navigating to InviteFriends Controller..")
    }

    func routeToSettings() {
        print("navigating to Settings Controller..")
    }

    func routeToContacts() {
        print("calling Contacts Controller..")
    }
}
