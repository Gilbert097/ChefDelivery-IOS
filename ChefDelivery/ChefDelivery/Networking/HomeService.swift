//
//  HomeService.swift
//  ChefDelivery
//
//  Created by Gilberto Silva on 01/10/24.
//

import Foundation

enum RequestError: Error {
    case invalidURL
    case errorRequest(error: String)
}

struct HomeService {
    
    func fetchData() async throws -> Result<[StoreType],RequestError>{
        let link = "https://private-b73e8-gilbertosilva.apiary-mock.com/stores"
        guard let url = URL(string: link) else { return .failure(.invalidURL)}
        
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        
        let (data, _) = try await URLSession.shared.data(for: request)
        let stores = try JSONDecoder().decode([StoreType].self, from: data)
        
        return .success(stores)
    }
}
