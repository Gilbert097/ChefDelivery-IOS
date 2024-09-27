//
//  StoreDetailProductsView.swift
//  ChefDelivery
//
//  Created by Gilberto Silva on 27/09/24.
//

import SwiftUI

struct StoreDetailProductsView: View {
    @State private var productSelected: ProductType?
    
    let products: [ProductType]
    
    var body: some View {
        VStack(alignment: .leading) {
            
            Text("Produtos")
                .font(.title2)
                .bold()
                .padding()
            
            ForEach(products) { product in
                
                Button {
                    self.productSelected = product
                } label: {
                    StoreDetailProductItemView(product: product)
                }
            }
            .sheet(item: $productSelected) { product in
                ProductDetailView(product: product)
            }
        }
    }
}

#Preview(traits: .sizeThatFitsLayout) {
    StoreDetailProductsView(products: storesMock.first!.products)
}
