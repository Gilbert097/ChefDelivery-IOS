//
//  ProductDetailView.swift
//  ChefDelivery
//
//  Created by Gilberto Silva on 25/09/24.
//

import SwiftUI

struct ProductDetailView: View {
    
    let product: ProductType
    
    var body: some View {
        Text(product.name)
    }
}

#Preview {
    ProductDetailView(product: storesMock.first!.products.first!)
}
