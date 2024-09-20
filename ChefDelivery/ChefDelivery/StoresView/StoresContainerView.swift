//
//  StoresContainerView.swift
//  ChefDelivery
//
//  Created by Gilberto Silva on 20/09/24.
//

import SwiftUI

struct StoresContainerView: View {
    var body: some View {
        VStack(alignment: .leading) {
            Text("Lojas")
                .font(.headline)
            
            VStack(alignment: .leading, spacing: 30) {
                ForEach(storesMock) { storeItem in
                    NavigationLink {
                        StoreDetailView(order: storeItem)
                    } label: {
                        StoreItemView(orderType: storeItem)
                    }
                }
            }
            .foregroundStyle(.black)
        }
        .padding(20)
    }
}

#Preview(traits: .sizeThatFitsLayout) {
    StoresContainerView()
}
