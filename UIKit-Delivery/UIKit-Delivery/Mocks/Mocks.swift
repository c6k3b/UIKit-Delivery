import UIKit

struct Mocks {
    typealias Option = MainModel.Item.Response.Option
    typealias Banner = MainModel.Item.Response.Banner
    typealias Promotion = MainModel.Item.Response.Promotion
    typealias CatalogueItem = MainModel.Item.Response.CatalogueItem

    typealias User = MenuModel.Item.Response.User
    typealias MenuOption = MenuModel.Item.Response.MenuCell

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
        CatalogueItem(image: "Наборы", description: "sets"),
        CatalogueItem(image: "Пицца", description: "pizza"),
        CatalogueItem(image: "Паста", description: "pasta"),
        CatalogueItem(image: "Ризотто", description: "risotto"),
        CatalogueItem(image: "Салаты", description: "salads"),
        CatalogueItem(image: "Полуфабрикаты", description: "semifinished"),
        CatalogueItem(image: "Десерты", description: "deserts"),
        CatalogueItem(image: "Добавки к блюдам", description: "seasonings"),
        CatalogueItem(image: "Напитки", description: "drinks")
    ]

    // Menu
    let user = User(
        image: "user",
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
