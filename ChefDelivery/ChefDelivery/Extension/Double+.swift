//
//  Double+.swift
//  ChefDelivery
//
//  Created by Gilberto Silva on 25/09/24.
//

import Foundation

extension Double {
    
    func fomartPrice() -> String {
        let priceRounded = String(format: "%.2f", self)
        return priceRounded.replacingOccurrences(of: ".", with: ",")
    }
}
