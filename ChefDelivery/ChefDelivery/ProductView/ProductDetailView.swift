//
//  ProductDetailView.swift
//  ChefDelivery
//
//  Created by Gilberto Silva on 25/09/24.
//

import SwiftUI

struct ProductDetailView: View {
    
    let product: ProductType

    
    var body: some View {
        VStack {
            VStack {
                
                ProductDetailHeaderView(product: product)
                
                Spacer()
                
                ProductDetailQuantityView()
                
                Spacer()
                
                ProductDetailButtonView()
                
            }
        }
    }
}

#Preview {
    ProductDetailView(product: storesMock.first!.products.first!)
}

struct ProductDetailButtonView: View {
    var body: some View {
        HStack {
            Spacer()
            Button {
                print("O botão foi pressionado")
            } label: {
                HStack {
                    Image(systemName: "cart")
                    
                    Text("Adicionar ao carrinho")
                }
                .padding(.horizontal, 32)
                .padding(.vertical, 16)
                .font(.title3)
                .bold()
                .background(Color("ColorRed"))
                .foregroundStyle(LinearGradient(colors: [.white], startPoint: .top, endPoint: .bottom))
                .clipShape(RoundedRectangle(cornerRadius: 32))
                .overlay(RoundedRectangle(cornerRadius: 32)
                    .stroke(Color.black, lineWidth: 0)
                )
                .shadow(color: Color("ColorRedDark").opacity(0.5), radius: 10, x: 6, y: 8)
            }
            Spacer()
        }
    }
}
