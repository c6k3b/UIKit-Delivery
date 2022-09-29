import UIKit

struct Mocks {
    typealias User = MenuModel.Item.Response.User
    typealias MenuOption = MenuModel.Item.Response.MenuCell

    let user = User(
        image: "circle",
        name: "Иван Иванов",
        phone: "+7 912 011-11-33"
    )

    let menuOptions = [
        MenuOption(label: "Оплата", subLabel: "Карта *4567"),
        MenuOption(label: "Мои адреса", subLabel: ""),
        MenuOption(label: "Мои заказы", subLabel: ""),
        MenuOption(label: "Избранное", subLabel: ""),
        MenuOption(label: "Новости", subLabel: ""),
        MenuOption(label: "Купоны", subLabel: ""),
        MenuOption(label: "О нас", subLabel: ""),
        MenuOption(label: "Пригласить друзей", subLabel: ""),
        MenuOption(label: "Настройки", subLabel: "")
    ]
}
