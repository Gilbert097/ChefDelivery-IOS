//
//  StoresContainerView.swift
//  ChefDelivery
//
//  Created by Gilberto Silva on 20/09/24.
//

import SwiftUI

struct StoresContainerView: View {
    
    @State private var starFilter: Int = 0
    @State private var distanceFilter: (min: Int, max: Int)? = nil
    
    var storesType: [StoreType]
    
    private var storesFilter: [StoreType] {
        let starsResult = storesType.filter { $0.stars >= starFilter }
        
        if let (min, max) = distanceFilter {
            return starsResult.filter{($0.distance >= min && $0.distance <= max)}
        }
        return starsResult
    }
    
    var body: some View {
        VStack(alignment: .leading) {
            
            HStack {
                Text("Lojas")
                    .font(.headline)
                
                Spacer()
                
                Menu("Estrelas") {
                    
                    Button {
                        self.starFilter = 0
                    } label: {
                        Text("Limpar filtro")
                    }
                    
                    Divider()
                    
                    ForEach(1...5, id: \.self) { index in
                        Button {
                            self.starFilter = index
                        } label: {
                            if index > 1 {
                                Text("\(index) estrelas ou mais")
                            } else {
                                Text("\(index) estrela ou mais")
                            }
                        }
                        
                    }
                }
                .foregroundStyle(LinearGradient(colors: [.black], startPoint: .top, endPoint: .bottom))
                
                Menu("Distância") {
                    
                    Button {
                        self.distanceFilter = nil
                    } label: {
                        Text("Limpar filtro")
                    }
                    
                    Divider()
                    
                    ForEach(Array(stride(from: 0, through: 20, by: 5)), id: \.self) { index in
                        let min = index
                        let max = index + 5
                        Button {
                            self.distanceFilter = (min: min, max: max)
                        } label: {
                            Text("De \(min) até \(max) km")
                        }
                    }
                }
                .foregroundStyle(LinearGradient(colors: [.black], startPoint: .top, endPoint: .bottom))
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
    StoresContainerView(storesType: storesMock)
}
