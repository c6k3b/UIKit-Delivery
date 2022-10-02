import UIKit

struct Mocks {
    typealias Option = MainModel.Item.Response.Option
    typealias Banner = MainModel.Item.Response.Banner
    typealias Promotion = MainModel.Item.Response.Promotion
    typealias CatalogueItem = MainModel.Item.Response.CatalogueItem

    typealias User = MenuModel.Item.Response.User
    typealias MenuCell = MenuModel.Item.Response.MenuCell

    // Main
    let options = [
        Option(image: "picnic", description: "Летний пикник"),
        Option(image: "lunch", description: "Летний обед"),
        Option(image: "breakfast", description: "На завтрак"),
        Option(image: "dinner", description: "На ужин"),
        Option(image: "meal", description: "На обед")
    ]

    let banners = [
        Banner(image: "openingDiscount", description1: "В честь открытия", description2: "Скидки  20%"),
        Banner(image: "discount", description1: "По понедельникам", description2: "Скидки  10%")
    ]

    let promotions = [
        Promotion(
            isNew: true,
            image: "spagetti",
            description: "Черные спагетти с морепродуктам (большая порция)",
            discount: 35,
            weight: 230,
            price: 360,
            discountPrice: 200
        ),
        Promotion(
            isNew: false,
            image: "kazareche",
            description: "Казаречче с индейкой и томатами",
            discount: 25,
            weight: 230,
            price: 360,
            discountPrice: 200
        ),
        Promotion(
            isNew: false,
            image: "ravioli",
            description: "Равиоли с грибами",
            discount: 35,
            weight: 230,
            price: 1360,
            discountPrice: 1200
        ),
        Promotion(
            isNew: false,
            image: "ravioli",
            description: "Равиоли с грибами",
            discount: 35,
            weight: 230,
            price: 1360,
            discountPrice: 1200
        )
    ]

    let catalogue = [
        CatalogueItem(image: "sets", description: "Наборы", backgroundColor: 0xffc1b6),
        CatalogueItem(image: "pizza", description: "Пицца", backgroundColor: 0xffe1ad),
        CatalogueItem(image: "pasta", description: "Паста", backgroundColor: 0xbab892),
        CatalogueItem(image: "risotto", description: "Ризотто", backgroundColor: 0xc4d3ce),
        CatalogueItem(image: "salads", description: "Салаты", backgroundColor: 0xb9c4c8),
        CatalogueItem(image: "semifinished", description: "Полу фабрикаты", backgroundColor: 0xa3ae9d),
        CatalogueItem(image: "deserts", description: "Десерты", backgroundColor: 0xffe6b6),
        CatalogueItem(image: "seasonings", description: "Добавки к блюдам", backgroundColor: 0xd3c4c4),
        CatalogueItem(image: "drinks", description: "Напитки", backgroundColor: 0xffd4ad)
    ]

    // Menu
    let user = User(
        image: "user",
        name: "Иван Иванов",
        phone: "+7 912 011-11-33"
    )

    let menuCells = [
        MenuCell(label: "Оплата", subLabel: "Карта *4567"),
        MenuCell(label: "Мои адреса", subLabel: ""),
        MenuCell(label: "Мои заказы", subLabel: ""),
        MenuCell(label: "Избранное", subLabel: ""),
        MenuCell(label: "Новости", subLabel: ""),
        MenuCell(label: "Купоны", subLabel: ""),
        MenuCell(label: "О нас", subLabel: ""),
        MenuCell(label: "Пригласить друзей", subLabel: ""),
        MenuCell(label: "Настройки", subLabel: "")
    ]
}
