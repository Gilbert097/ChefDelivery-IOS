//
//  ContentView.swift
//  ChefDelivery
//
//  Created by Gilberto Silva on 19/09/24.
//

import SwiftUI

struct ContentView: View {
    
    @State private var storesType: [StoreType] = []
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
            Task {
                await getStores()
            }
        }
    }
    
    private func getStores() async {
        do {
            let result = try await homeService.fetchData()
            
            switch result {
            case .success(let stores):
                self.storesType = stores
            case .failure(let error):
                print(error.localizedDescription)
            }
        } catch {
            print(error.localizedDescription)
        }
    }
}

#Preview {
    ContentView()
}
