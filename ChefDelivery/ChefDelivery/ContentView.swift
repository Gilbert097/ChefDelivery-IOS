//
//  ContentView.swift
//  ChefDelivery
//
//  Created by Gilberto Silva on 19/09/24.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            NavigationBar()
                .padding(.horizontal, 15)
            
            ScrollView(.vertical) {
                VStack(spacing: 20) {
                    OrderTypeGridView()
                    CarouselTabView()
                }
            }
        }
    }
}

#Preview {
    ContentView()
}
