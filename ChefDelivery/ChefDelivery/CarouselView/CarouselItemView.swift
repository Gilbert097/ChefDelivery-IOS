//
//  CarouselItemView.swift
//  ChefDelivery
//
//  Created by Gilberto Silva on 20/09/24.
//

import SwiftUI

struct CarouselItemView: View {
    
    let orderType: OrderType
    
    var body: some View {
        Image(orderType.image)
            .resizable()
            .scaledToFit()
    }
}

#Preview(traits: .sizeThatFitsLayout) {
    CarouselItemView(orderType: carouselItens.first!)
        .padding()
}
