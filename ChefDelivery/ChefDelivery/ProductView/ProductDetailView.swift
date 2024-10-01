//
//  ProductDetailView.swift
//  ChefDelivery
//
//  Created by Gilberto Silva on 25/09/24.
//

import SwiftUI

struct ProductDetailView: View {
    
    let product: ProductType
    
    private let homeService = HomeService()
    
    @State private var productQuantity: Int = 1
    @State private var showAlert = false
    
    var body: some View {
        VStack {
            VStack {
                
                ProductDetailHeaderView(product: product)
                
                Spacer()
                
                ProductDetailQuantityView(productQuantity: $productQuantity)
                
                Spacer()
                
                ProductDetailButtonView {
                    Task {
                        await confirmOrder()
                    }
                }
                .alert(isPresented: $showAlert) {
                    Alert(title: Text("Sucesso"), message: Text("Seu pedido foi enviado com sucesso!"), dismissButton: .default(Text("ok")))
                }
                
            }
        }
    }
    
    private func confirmOrder() async {
        do {
            let result = try await homeService.sendOrder(product: product)
            switch result {
            case .success(let success):
                guard let success = success else { return }
                self.showAlert = true
                print(success)
            case .failure(let error):
                print(error.localizedDescription)
            }
        } catch {
            print(error.localizedDescription)
        }
    }
}

#Preview {
    ProductDetailView(product: storesMock.first!.products.first!)
}

struct ProductDetailButtonView: View {
    
    var onButtonPress: () -> Void
    
    var body: some View {
        HStack {
            Spacer()
            Button {
                onButtonPress()
            } label: {
                HStack {
                    Image(systemName: "cart")
                    
                    Text("Enviar pedido")
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
