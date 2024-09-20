//
//  CarouselTabView.swift
//  ChefDelivery
//
//  Created by Gilberto Silva on 20/09/24.
//

import SwiftUI

struct CarouselTabView: View {
    var body: some View {
        TabView {
            ForEach(carouselItens) {
                CarouselItemView(orderType: $0)
            }
        }
        .frame(height: 180)
        .tabViewStyle(.page(indexDisplayMode: .always))
    }
}

#Preview(traits: .sizeThatFitsLayout) {
    CarouselTabView()
}
