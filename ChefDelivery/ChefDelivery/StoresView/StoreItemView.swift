//
//  StoreItemView.swift
//  ChefDelivery
//
//  Created by Gilberto Silva on 20/09/24.
//

import SwiftUI

struct StoreItemView: View {
    
    let orderType: OrderType
    
    var body: some View {
        HStack {
            Image(orderType.image)
                .resizable()
                .scaledToFit()
                .clipShape(Circle())
                .frame(width: 50, height: 50)
            
            VStack {
                Text(orderType.name)
                    .font(.subheadline)
            }
        }
    }
}

#Preview(traits: .sizeThatFitsLayout) {
    StoreItemView(orderType: storesItens.first!)
}
