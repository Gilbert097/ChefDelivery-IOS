//
//  ProductDetailQuantityView.swift
//  ChefDelivery
//
//  Created by Gilberto Silva on 27/09/24.
//

import SwiftUI

struct ProductDetailQuantityView: View {
    
    @Binding var productQuantity: Int
    
    var body: some View {
        HStack {
            Spacer()
            
            VStack {
                Text("Quantidade")
                    .font(.title3)
                    .bold()
                    .foregroundStyle(LinearGradient(colors: [.black], startPoint: .top, endPoint: .bottom))
                
                HStack {
                    Button {
                        if self.productQuantity > 1 {
                            self.productQuantity -= 1
                        }
                    } label: {
                        Image(systemName: "minus.circle.fill")
                            .foregroundStyle(LinearGradient(colors: [Color("ColorRed")], startPoint: .top, endPoint: .bottom))
                            .font(.title)
                            .bold()
                    }

                    Text("\(productQuantity)")
                        .font(.title2)
                        .bold()
                        .foregroundStyle(LinearGradient(colors: [.black], startPoint: .top, endPoint: .bottom))
                    
                    Button {
                        self.productQuantity += 1
                    } label: {
                        Image(systemName: "plus.circle.fill")
                            .foregroundStyle(LinearGradient(colors: [Color("ColorRed")], startPoint: .top, endPoint: .bottom))
                            .font(.title)
                            .bold()
                    }
                }
            }
            Spacer()
        }
    }
}

#Preview(traits: .sizeThatFitsLayout)  {
    ProductDetailQuantityView(productQuantity: .constant(1))
}
