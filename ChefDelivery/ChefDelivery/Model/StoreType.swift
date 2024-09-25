//
//  StoreType.swift
//  ChefDelivery
//
//  Created by Gilberto Silva on 23/09/24.
//

import Foundation

struct StoreType: Identifiable {
    let id: Int
    let name: String
    let logoImage: String
    let headerImage: String
    let location: String
    let stars: Int
    let products: [ProductType]
}

struct ProductType: Identifiable {
    let id: Int
    let name: String
    let description: String
    let image: String
    let price: Double
    
    var formattedPrice: String {
        "R$ \(price.fomartPrice())"
    }
}
