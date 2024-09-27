//
//  StoreDetailHeaderView.swift
//  ChefDelivery
//
//  Created by Gilberto Silva on 27/09/24.
//

import SwiftUI

struct StoreDetailHeaderView: View {
    
    @EnvironmentObject var store: StoreType
    
    var body: some View {
        VStack {
            Image(store.headerImage)
                .resizable()
                .scaledToFit()
            
            HStack {
                Text(store.name)
                    .bold()
                    .font(.title)
                
                Spacer()
                
                Image(store.logoImage)
            }
            .padding(.vertical, 8)
            .padding(.horizontal)
            
            HStack {
                Text(store.location)
                
                Spacer()
                
                ForEach(1...store.stars, id: \.self) { _ in
                    
                    Image(systemName: "star.fill")
                        .foregroundStyle(.yellow)
                        .font(.caption2)
                }
            }
            .padding(.vertical, 8)
            .padding(.horizontal)
        }
    }
}

#Preview(traits: .sizeThatFitsLayout) {
    StoreDetailHeaderView()
        .environmentObject(storesMock.first!)
}
