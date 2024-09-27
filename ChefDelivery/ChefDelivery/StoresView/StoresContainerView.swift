//
//  StoresContainerView.swift
//  ChefDelivery
//
//  Created by Gilberto Silva on 20/09/24.
//

import SwiftUI

struct StoresContainerView: View {
    
    @State private var indexFilterSelected: Int = 0
    
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
                ForEach(storesMock) { storeItem in
                    NavigationLink {
                        StoreDetailView(store: storeItem)
                    } label: {
                        StoreItemView(store: storeItem)
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
