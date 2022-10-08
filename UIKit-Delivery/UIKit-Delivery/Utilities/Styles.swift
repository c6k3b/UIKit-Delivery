import Foundation

import UIKit

enum Styles {
    enum Colors {
        static let background = UIColor.systemBackground
        static let black = UIColor.label
        static let grey = UIColor.gray
        static let darkGrey = UIColor.darkGray
        static let lightGrey = UIColor.lightGray.withAlphaComponent(0.3)
        static let red = UIColor(hex: 0xFF4231)
        static let yellow = UIColor(hex: 0xFFD334)
        static let cardBackground = UIColor(hex: 0xf4f4f4)
        static let orange = UIColor(hex: 0xFFA033)
    }

    enum Images {
        static let contacts = UIImage(named: "contacts")
        static let favourites = UIImage(named: "favourites")
        static let location = UIImage(named: "location")
        static let menu = UIImage(named: "menu")
        static let minus = UIImage(systemName: "minus")
        static let pin = UIImage(named: "pin")
        static let plus = UIImage(systemName: "plus")
        static let search = UIImage(systemName: "magnifyingglass")
        static let user = UIImage(named: "user")
        static let xmark = UIImage(systemName: "xmark")

        static let banner1 = UIImage(named: "openingDiscount")
        static let banner2 = UIImage(named: "discount")

        static let breakfast = UIImage(named: "breakfast")
        static let deserts = UIImage(named: "deserts")
        static let dinner = UIImage(named: "dinner")
        static let drinks = UIImage(named: "drinks")
        static let kazareche = UIImage(named: "kazareche")
        static let lunch = UIImage(named: "lunch")
        static let meal = UIImage(named: "meal")
        static let pasta = UIImage(named: "pasta")
        static let picnic = UIImage(named: "picnic")
        static let pizza = UIImage(named: "pizza")
        static let ravioli = UIImage(named: "ravioli")
        static let risotto = UIImage(named: "risotto")
        static let salads = UIImage(named: "salads")
        static let seasoning = UIImage(named: "seasoning")
        static let semifinished = UIImage(named: "semifinished")
        static let sets = UIImage(named: "sets")
        static let spagetti = UIImage(named: "spagetti")
    }
}
