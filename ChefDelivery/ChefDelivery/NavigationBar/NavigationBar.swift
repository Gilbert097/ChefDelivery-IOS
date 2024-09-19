//
//  NavigationBar.swift
//  ChefDelivery
//
//  Created by Gilberto Silva on 19/09/24.
//

import SwiftUI

struct NavigationBar: View {
    var body: some View {
        HStack {
            Spacer()
            
            Button("R. Vergueiro, 3185") {
                
            }
            .font(.subheadline)
            .fontWeight(.semibold)
            .foregroundStyle(.black)
            
            Spacer()
            
            Button(action: {}, label: {
                Image(systemName: "bell.badge")
                    .font(.title3)
                    .foregroundStyle(.red)
            })
        }
        
    }
}

#Preview(traits: .sizeThatFitsLayout) {
    NavigationBar()
        .padding()
}
