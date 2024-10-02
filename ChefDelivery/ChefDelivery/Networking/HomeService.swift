//
//  HomeService.swift
//  ChefDelivery
//
//  Created by Gilberto Silva on 01/10/24.
//

import Foundation
import Alamofire

enum RequestError: Error {
    case invalidURL
    case errorRequest(error: String)
}

struct HomeService {
    
    func fetchData() async throws -> Result<[StoreType],RequestError> {
        let link = "https://private-b73e8-gilbertosilva.apiary-mock.com/stores"
        guard let url = URL(string: link) else { return .failure(.invalidURL)}
        
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        
        let (data, _) = try await URLSession.shared.data(for: request)
        let stores = try JSONDecoder().decode([StoreType].self, from: data)
        
        return .success(stores)
    }
    
    func sendOrder(product: ProductType) async throws -> Result<[String: Any]?,RequestError> {
        let link = "https://private-b73e8-gilbertosilva.apiary-mock.com/stores"
        guard let url = URL(string: link) else { return .failure(.invalidURL)}
        
        let encodedObject = try JSONEncoder().encode(product)
        
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.httpBody = encodedObject
        
        let (data, _) = try await URLSession.shared.data(for: request)
        let message = try JSONSerialization.jsonObject(with: data) as? [String: Any]
        
        return .success(message)
    }
    
    func fetchDataWithAlamofire(completion: @escaping (Result<[StoreType],RequestError>) -> Void) {
        AF.request("https://private-b73e8-gilbertosilva.apiary-mock.com/stores")
            .responseDecodable(of: [StoreType].self) { response in
                switch response.result {
                case .success(let stores):
                    completion(.success(stores))
                case .failure(let error):
                    completion(.failure(.errorRequest(error: error.localizedDescription)))
                }
        }
        
    }
}
