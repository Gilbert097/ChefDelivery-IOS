//
//  ContentView.swift
//  ChefDelivery
//
//  Created by Gilberto Silva on 19/09/24.
//

import SwiftUI

struct ContentView: View {
    
    @State private var storesType: [StoreType] = []
    @State private var isLoading = true
    
    private let homeService = HomeService()
    
    var body: some View {
        NavigationView {
            VStack {
                if isLoading {
                    ProgressView()
                } else {
                    NavigationBar()
                        .padding(.horizontal, 15)
                    
                    ScrollView(.vertical) {
                        VStack(spacing: 20) {
                            OrderTypeGridView()
                            CarouselTabView()
                            StoresContainerView(storesType: storesType)
                        }
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
            self.isLoading = false
        } catch {
            self.isLoading = false
            print(error.localizedDescription)
        }
    }
}

#Preview {
    ContentView()
}
