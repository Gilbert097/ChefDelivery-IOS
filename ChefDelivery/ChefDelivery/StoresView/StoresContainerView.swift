//
//  StoresContainerView.swift
//  ChefDelivery
//
//  Created by Gilberto Silva on 20/09/24.
//

import SwiftUI

struct StoresContainerView: View {
    
    @State private var indexFilterSelected: Int = 0
    
    private var storesFilter: [StoreType] {
        storesMock.filter { $0.stars >= indexFilterSelected }
    }
    
    var body: some View {
        VStack(alignment: .leading) {
            
            HStack {
                Text("Lojas")
                    .font(.headline)
                
                Spacer()
                
                Menu("Filtrar") {
                    
                    ForEach(1...5, id: \.self) { index in
                        Button {
                            self.indexFilterSelected = index
                        } label: {
                            if index > 1 {
                                Text("\(index) estrelas ou mais")
                            } else {
                                Text("\(index) estrela ou mais")
                            }
                        }

                    }
                }
            }
            
            VStack(alignment: .leading, spacing: 30) {
                
                if self.storesFilter.isEmpty {
                    Text("Nenhum resultado encontrado.")
                        .font(.title2)
                        .bold()
                        .foregroundStyle(LinearGradient(colors: [Color("ColorRed")], startPoint: .top, endPoint: .bottom))
                        .padding(.vertical, 32)
                        .frame(maxWidth: .infinity)
                    
                } else {
                    ForEach(storesFilter) { storeItem in
                        NavigationLink {
                            StoreDetailView(store: storeItem)
                        } label: {
                            StoreItemView(store: storeItem)
                        }
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
