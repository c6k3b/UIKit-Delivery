import UIKit

struct Mocks {
    let user = User(
        image: "circle",
        name: "Иван Иванов",
        phone: "+7 912 011-11-33"
    )

    let menuOptions = [
        MenuOption(label: "Оплата", subLabal: "Карта *4567"),
        MenuOption(label: "Мои адреса", subLabal: ""),
        MenuOption(label: "Мои заказы", subLabal: ""),
        MenuOption(label: "Избранное", subLabal: ""),
        MenuOption(label: "Новости", subLabal: ""),
        MenuOption(label: "Купоны", subLabal: ""),
        MenuOption(label: "О нас", subLabal: ""),
        MenuOption(label: "Пригласить друзей", subLabal: ""),
        MenuOption(label: "Настройки", subLabal: "")
    ]
}
