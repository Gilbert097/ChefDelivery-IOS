//
//  OrderTypegridView.swift
//  ChefDelivery
//
//  Created by Gilberto Silva on 19/09/24.
//

import SwiftUI

struct OrderTypeGridView: View {
    
    var gridLayout: [GridItem] {
        return Array(repeating:  GridItem(.flexible()), count: 2)
    }
    
    var body: some View {
        LazyHGrid(rows: gridLayout, spacing: 15) {
            ForEach(ordersMock) { orderItem in
                OrderTypeView(orderType: orderItem)
            }
        }
        .frame(height: 200)
        .padding(.horizontal, 15)
        .padding(.top, 15)
    }
}

#Preview(traits: .sizeThatFitsLayout) {
    OrderTypeGridView()
}
