//
//  CarouselTabView.swift
//  ChefDelivery
//
//  Created by Gilberto Silva on 20/09/24.
//

import SwiftUI

struct CarouselTabView: View {
    
    @State private var selectionIndex = 1
    
    var body: some View {
        TabView(selection: $selectionIndex) {
            ForEach(carouselItens) {
                CarouselItemView(orderType: $0)
                    .tag($0.id)
            }
        }
        .frame(height: 180)
        .tabViewStyle(.page(indexDisplayMode: .always))
        .onAppear {
            Timer.scheduledTimer(withTimeInterval: 3, repeats: true) { _ in
                if selectionIndex > carouselItens.count {
                    selectionIndex = 1
                }
                selectionIndex += 1
            }
        }
    }
}

#Preview(traits: .sizeThatFitsLayout) {
    CarouselTabView()
}
