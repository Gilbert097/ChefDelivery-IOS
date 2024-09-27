//
//  ProductDetailHeaderView.swift
//  ChefDelivery
//
//  Created by Gilberto Silva on 27/09/24.
//

import SwiftUI

struct ProductDetailHeaderView: View {
    let product: ProductType
    
    var body: some View {
        VStack(alignment: .leading, spacing: 16) {
            Image(product.image)
                .resizable()
                .scaledToFit()
                .shadow(radius: 20)
            
            Text(product.name)
                .font(.title)
                .bold()
                .padding(.horizontal)
                .padding(.top)
                .foregroundStyle(LinearGradient(colors: [.black], startPoint: .top, endPoint: .bottom))
            
            Text(product.description)
                .padding(.horizontal)
                .foregroundStyle(LinearGradient(colors: [.black], startPoint: .top, endPoint: .bottom))
                .multilineTextAlignment(.leading)
            
            Text(product.formattedPrice)
                .font(.title3)
                .bold()
                .padding(.horizontal)
                .foregroundStyle(LinearGradient(colors: [.black], startPoint: .top, endPoint: .bottom))
        }
    }
}

#Preview {
    ProductDetailHeaderView(product: storesMock.first!.products.first!)
}
