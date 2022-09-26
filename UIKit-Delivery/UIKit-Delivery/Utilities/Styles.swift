import Foundation

import UIKit

enum Styles {
    enum Colors {
        static let background = UIColor.systemBackground
        static let grey = UIColor.gray
        static let darkGrey = UIColor.darkGray
        static let lightGrey = UIColor.lightGray.withAlphaComponent(0.3)
        static let red = UIColor(hex: 0xFF423)
        static let yellow = UIColor(hex: 0xFFD334)
    }

    enum Images {
        static let menu = UIImage(
            systemName: "list.bullet",
            withConfiguration: UIImage.SymbolConfiguration(pointSize: 24)
        )?.withTintColor(Colors.grey, renderingMode: .alwaysOriginal)
        static let heart = UIImage(systemName: "heart.fill")
        static let magnifying = UIImage(systemName: "magnifyingglass")
        static let plus = UIImage(systemName: "plus")
        static let minus = UIImage(systemName: "minus")
        static let square = UIImage(systemName: "square")
        static let rectangle = UIImage(systemName: "rectangle")
        static let circle = UIImage(systemName: "circle")?
            .withTintColor(Colors.grey, renderingMode: .alwaysOriginal)
        static let textBuble = UIImage(
            systemName: "text.bubble",
            withConfiguration: UIImage.SymbolConfiguration(pointSize: 40)
        )?.withTintColor(Colors.grey, renderingMode: .alwaysOriginal)
    }
}
