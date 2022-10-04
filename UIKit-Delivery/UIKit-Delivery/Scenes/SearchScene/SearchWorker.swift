import Foundation

final class SearchWorker: SearchWorkerLogic {
    func getAddresses(completion: ([Address]?) -> Void) {
        var store: [Address]?
//        fetchData { addresData in
//            store = addresData.map {_ in
//                Address(
//                    city: "",
//                    street: "",
//                    house: ""
//                )
//            }
//        }
        completion(store)
    }

    func get() {
        guard let url = URL(
            string: "https://suggestions.dadata.ru/suggestions/api/4_1/rs/suggest/address"
        ) else { return }
        let headers = [
            "Content-Type": "application/json",
            "Accept": "application/json",
            "Authorization": "Token e3c37f5cee0dd3832f6eeef73a43dc4a1052a9af"
        ]
        let body = ["query": "ижевск ленина"]

        var request = URLRequest(url: url)
        for (key, value) in headers { request.setValue(value, forHTTPHeaderField: key) }
        let bodyData = try? JSONSerialization.data(withJSONObject: body)

        request.httpMethod = "POST"
        request.httpBody = bodyData

        URLSession.shared.dataTask(with: request) { data, _, error in
            if let error = error {
                print(error.localizedDescription)
                return
            }
            guard let data = data else { return }
            let decodedData = try? JSONDecoder().decode(AddressData.self, from: data)
            decodedData?.suggestions?.forEach { suggestion in
                let data = suggestion.data
                print(
                    """
                    \(data.streetType ?? ""). \(data.street ?? ""), \(data.house ?? "")
                    \(data.city ?? ""), \(data.region ?? "") \(data.regionTypeFull ?? ""), \(data.country ?? "")
                    """
                )
            }
        }.resume()
    }
}

private extension SearchWorker {
    func fetchData(completion: ([AddressData]) -> Void) {
        guard let url = createURLComponents() else { return }

        var decodedData = [AddressData]()
        do {
            let data = try Data(contentsOf: url)
            decodedData = try JSONDecoder().decode([AddressData].self, from: data)
        } catch {
            print(error.localizedDescription)
        }
        completion(decodedData)
    }

    func createURLComponents() -> URL? {
        var urlComponents = URLComponents()
        urlComponents.scheme = "https"
        urlComponents.host = "suggestions.dadata.ru"
        urlComponents.path = "/suggestions/api/4_1/rs/suggest/address"
        return urlComponents.url
    }
}
