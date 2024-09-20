//
//  OrderTypegridView.swift
//  ChefDelivery
//
//  Created by Gilberto Silva on 19/09/24.
//

import SwiftUI

struct OrderTypeGridView: View {
    
    var body: some View {
        LazyHGrid(rows: [
            GridItem(.fixed(100)),
            GridItem(.fixed(100))
        ], content: {
            ForEach(ordersMock) { orderItem in
                Text(orderItem.name)
            }
        })
    }
}

#Preview(traits: .sizeThatFitsLayout) {
    OrderTypeGridView()
}
