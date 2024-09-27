//
//  StoreDetailView.swift
//  ChefDelivery
//
//  Created by Gilberto Silva on 20/09/24.
//

import SwiftUI

struct StoreDetailView: View {
    let store: StoreType
    
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        ScrollView {
            VStack(alignment: .leading) {
                StoreDetailHeaderView()
                    .environmentObject(store)
                
                StoreDetailProductsView(products: store.products)
            }
            .navigationTitle(store.name)
            .navigationBarTitleDisplayMode(.inline)
            .navigationBarBackButtonHidden()
            .toolbar{
                ToolbarItem(placement: .topBarLeading) {
                    Button{
                        self.dismiss()
                    } label: {
                        HStack {
                            Image(systemName: "cart")
                            Text("Lojas")
                        }
                        .foregroundStyle(.red)
                    }
                }
            }
        }
        .scrollIndicators(.hidden)
    }
}

#Preview {
    StoreDetailView(store: storesMock.first!)
}
