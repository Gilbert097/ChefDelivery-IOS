//
//  ProductDetailView.swift
//  ChefDelivery
//
//  Created by Gilberto Silva on 25/09/24.
//

import SwiftUI

struct ProductDetailView: View {
    
    let product: ProductType
    @State private var productQuantity = 1
    
    var body: some View {
        VStack {
            VStack(alignment: .leading, spacing: 16) {
                Image(product.image)
                    .resizable()
                    .scaledToFit()
                    .shadow(radius: 20)
                
                Text(product.name)
                    .font(.title)
                    .bold()
                    .padding(.horizontal)
                    .padding(.top)
                    .foregroundStyle(LinearGradient(colors: [.black], startPoint: .top, endPoint: .bottom))
                
                Text(product.description)
                    .padding(.horizontal)
                    .foregroundStyle(LinearGradient(colors: [.black], startPoint: .top, endPoint: .bottom))
                    .multilineTextAlignment(.leading)
                
                Text(product.formattedPrice)
                    .font(.title3)
                    .bold()
                    .padding(.horizontal)
                    .foregroundStyle(LinearGradient(colors: [.black], startPoint: .top, endPoint: .bottom))
                
                Spacer()
                
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
                
                Spacer()
                
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
    }
}

#Preview {
    ProductDetailView(product: storesMock.first!.products.first!)
}
