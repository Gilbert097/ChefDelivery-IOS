//
//  StoreDetailView.swift
//  ChefDelivery
//
//  Created by Gilberto Silva on 20/09/24.
//

import SwiftUI

struct StoreDetailView: View {
    let store:  StoreType
    
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        ScrollView {
            VStack(alignment: .leading) {
                Image(store.headerImage)
                    .resizable()
                    .scaledToFit()
                
                HStack {
                    Text(store.name)
                        .bold()
                        .font(.title)
                    
                    Spacer()
                    
                    Image(store.logoImage)
                }
                .padding(.vertical, 8)
                .padding(.horizontal)
                
                HStack {
                    Text(store.location)
                    
                    Spacer()
                    
                    ForEach(1...store.stars, id: \.self) { _ in
                        
                        Image(systemName: "star.fill")
                            .foregroundStyle(.yellow)
                            .font(.caption2)
                    }
                }
                .padding(.vertical, 8)
                .padding(.horizontal)
                
                Text("Produtos")
                    .font(.title2)
                    .bold()
                    .padding()
                
                ForEach(store.products) { product in
                    
                    NavigationLink {
                        ProductDetailView(product: product)
                    } label: {
                        HStack(spacing: 8) {
                            
                            VStack(alignment: .leading, spacing: 8) {
                                Text(product.name)
                                    .bold()
                                    .multilineTextAlignment(.leading)
                                
                                Text(product.description)
                                    .foregroundStyle(.black.opacity(0.5))
                                    .multilineTextAlignment(.leading)
                                
                                Text(product.formattedPrice)
                            }
                            
                            Spacer()
                            
                            Image(product.image)
                                .resizable()
                                .scaledToFit()
                                .frame(width: 120, height: 90)
                                .clipShape(RoundedRectangle(cornerRadius: 12))
                                .overlay(RoundedRectangle(cornerRadius: 12)
                                          .stroke(Color.black, lineWidth: 0)
                                    )
                                .shadow(color: .black.opacity(0.3), radius: 20, x: 6, y: 8)
                        }
                        .padding()
                        .foregroundStyle(Color.black)
                    }
                }
            }
            .navigationTitle(store.name)
            .navigationBarTitleDisplayMode(.inline)
            .navigationBarBackButtonHidden()
            .toolbar{
                ToolbarItem(placement: .topBarLeading) {
                    Button{
                        self.dismiss()
                    } label: {
                        HStack {
                            Image(systemName: "cart")
                            Text("Lojas")
                        }
                        .foregroundStyle(.red)
                    }
                }
            }
        }
        .scrollIndicators(.hidden)
    }
}

#Preview {
    StoreDetailView(store: storesMock.first!)
}
