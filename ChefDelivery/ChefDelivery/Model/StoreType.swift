//
//  StoreType.swift
//  ChefDelivery
//
//  Created by Gilberto Silva on 23/09/24.
//

import Foundation

class StoreType: Identifiable, ObservableObject, Decodable {
    
    let id: Int
    let name: String
    let logoImage: String
    let headerImage: String
    let location: String
    let stars: Int
    let distance: Int
    let products: [ProductType]
    
    public init(id: Int,
                 name: String,
                 logoImage: String,
                 headerImage: String,
                 location: String,
                 stars: Int,
                 distance: Int, 
                 products: [ProductType]) {
        self.id = id
        self.name = name
        self.logoImage = logoImage
        self.headerImage = headerImage
        self.location = location
        self.stars = stars
        self.distance = distance
        self.products = products
    }
    
    enum CodingKeys: String, CodingKey {
        case id
        case name
        case logoImage = "logo_image"
        case headerImage = "header_image"
        case location
        case stars
        case distance
        case products
    }
}

struct ProductType: Identifiable, Codable {
    let id: Int
    let name: String
    let description: String
    let image: String
    let price: Double
    
    var formattedPrice: String {
        "R$ \(price.fomartPrice())"
    }
}
