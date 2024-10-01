//
//  ContentView.swift
//  ChefDelivery
//
//  Created by Gilberto Silva on 19/09/24.
//

import SwiftUI

struct ContentView: View {
    
    private let homeService = HomeService()
    
    var body: some View {
        NavigationView {
            VStack {
                NavigationBar()
                    .padding(.horizontal, 15)
                
                ScrollView(.vertical) {
                    VStack(spacing: 20) {
                        OrderTypeGridView()
                        CarouselTabView()
                        StoresContainerView()
                    }
                }
            }
        }.onAppear {
            homeService.fetchData()
        }
    }
}

#Preview {
    ContentView()
}
