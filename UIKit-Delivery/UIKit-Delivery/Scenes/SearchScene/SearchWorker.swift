import Foundation

final class SearchWorker: SearchWorkerLogic {
    func getAddressList(query: String, completion: ([Address]) -> Void) {
        var store: [Address] = []

        fetchData(query: query) { addresData in
            addresData?.suggestions?.forEach {
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
        }
        completion(store)
        print(store)
    }
}

private extension SearchWorker {
    func fetchData(query: String, completion: (AddressData?) -> Void) {
        guard let url = URL(
            string: "https://suggestions.dadata.ru/suggestions/api/4_1/rs/suggest/address"
        ) else { return }
        let headers = [
            "Content-Type": "application/json",
            "Accept": "application/json",
            "Authorization": "Token e3c37f5cee0dd3832f6eeef73a43dc4a1052a9af"
        ]
        let body = ["query": query]

        var request = URLRequest(url: url)
        for (key, value) in headers { request.setValue(value, forHTTPHeaderField: key) }
        let bodyData = try? JSONSerialization.data(withJSONObject: body)

        request.httpMethod = "POST"
        request.httpBody = bodyData

        var decodedData: AddressData?

        URLSession.shared.dataTask(with: request) { data, _, error in
            if error != nil {
                print(error!.localizedDescription)
            } else {
                guard let data = data else { return }
                decodedData = try? JSONDecoder().decode(AddressData.self, from: data)
            }
        }.resume()
        completion(decodedData)
    }
}
