import Foundation

final class SearchWorker: SearchWorkerLogic {
    func getAddressList(query: String, completion: @escaping ([Address]) -> Void) {
        var store: [Address] = []

        fetchData(query: query) {
            $0?.suggestions?.forEach {
                store.append(Address(
                    streetType: $0.data.streetType,
                    street: $0.data.street,
                    house: $0.data.house,
                    city: $0.data.city,
                    region: $0.data.region,
                    regionType: $0.data.regionTypeFull,
                    country: $0.data.country
                ))
            }
            completion(store)
        }
    }
}

private extension SearchWorker {
    func fetchData(query: String, completion: @escaping (AddressData?) -> Void) {
        guard let url = createURL() else { return }

        let headers = [
            "Content-Type": "application/json",
            "Accept": "application/json",
            "Authorization": "Token e3c37f5cee0dd3832f6eeef73a43dc4a1052a9af"
        ]

        let body = ["query": query]
        let bodyData = try? JSONSerialization.data(withJSONObject: body)

        var request = URLRequest(url: url)
        for (key, value) in headers { request.setValue(value, forHTTPHeaderField: key) }

        request.httpMethod = "POST"
        request.httpBody = bodyData

        URLSession.shared.dataTask(with: request) { data, _, error in
            if let data = data {
                let decodedData = try? JSONDecoder().decode(AddressData.self, from: data)
                completion(decodedData)
            } else { print(error!.localizedDescription) }
        }.resume()
    }

    func createURL() -> URL? {
        var urlComponents = URLComponents()
        urlComponents.scheme = "https"
        urlComponents.host = "suggestions.dadata.ru"
        urlComponents.path = "/suggestions/api/4_1/rs/suggest/address"
        return urlComponents.url
    }
}
