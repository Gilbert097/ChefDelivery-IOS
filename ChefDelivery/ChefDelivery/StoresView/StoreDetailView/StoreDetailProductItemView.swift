//
//  StoreDetailProductItemView.swift
//  ChefDelivery
//
//  Created by Gilberto Silva on 27/09/24.
//

import SwiftUI

struct StoreDetailProductItemView: View {
    let product: ProductType
    
    var body: some View {
        HStack(spacing: 8) {
            VStack(alignment: .leading, spacing: 8) {
                Text(product.name)
                    .bold()
                    .multilineTextAlignment(.leading)
                
                Text(product.description)
                    .foregroundStyle(.black.opacity(0.5))
                    .multilineTextAlignment(.leading)
                
                Text(product.formattedPrice)
            }
            
            Spacer()
            
            Image(product.image)
                .resizable()
                .scaledToFit()
                .frame(width: 120, height: 90)
                .clipShape(RoundedRectangle(cornerRadius: 12))
                .overlay(RoundedRectangle(cornerRadius: 12)
                          .stroke(Color.black, lineWidth: 0)
                    )
                .shadow(color: .black.opacity(0.3), radius: 20, x: 6, y: 8)
        }
        .padding()
        .foregroundStyle(Color.black)
        
    }
}

#Preview(traits: .sizeThatFitsLayout) {
    StoreDetailProductItemView(product: storesMock.first!.products.first!)
}
