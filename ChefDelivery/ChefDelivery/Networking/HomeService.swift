//
//  HomeService.swift
//  ChefDelivery
//
//  Created by Gilberto Silva on 01/10/24.
//

import Foundation

struct HomeService {
    
    func fetchData() {
        let link = "https://private-b73e8-gilbertosilva.apiary-mock.com/stores"
        guard let url = URL(string: link) else { return }
        
        URLSession.shared.dataTask(with: url) { data, _, error in
            if let error = error {
                print(error.localizedDescription)
            } else if let data = data {
                do {
                    let json = try JSONDecoder().decode([StoreType].self, from: data)
                    print(json)
                } catch let errorCath {
                    print(errorCath.localizedDescription)
                }
            }
        }.resume()
    }
}
