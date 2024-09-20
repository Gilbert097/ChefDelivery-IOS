//
//  StoreDetailView.swift
//  ChefDelivery
//
//  Created by Gilberto Silva on 20/09/24.
//

import SwiftUI

struct StoreDetailView: View {
    let order:  OrderType
    
    var body: some View {
        Text(order.name)
    }
}

#Preview {
    StoreDetailView(order: storesMock.first!)
}
