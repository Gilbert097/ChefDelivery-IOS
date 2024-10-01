//
//  ContentView.swift
//  ChefDelivery
//
//  Created by Gilberto Silva on 19/09/24.
//

import SwiftUI

struct ContentView: View {
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
            fetchData()
        }
    }
    
    // MARK: - Methods
    
    private func fetchData() {
        let link = "https://private-b73e8-gilbertosilva.apiary-mock.com/stores"
        guard let url = URL(string: link) else { return }
        
        URLSession.shared.dataTask(with: url) { data, _, error in
            if let error = error {
                print(error.localizedDescription)
            } else if let data = data {
                do {
                    let json = try JSONDecoder().decode([StoreType].self, from: data)
                    print(json)
                } catch let errorCath {
                    print(errorCath.localizedDescription)
                }
            }
        }.resume()
    }
}

#Preview {
    ContentView()
}
