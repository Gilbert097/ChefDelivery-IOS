//
//  HomeView.swift
//  ChefDelivery
//
//  Created by Gilberto Silva on 28/09/24.
//

import SwiftUI

struct HomeView: View {
    
    @State private var isAnimating = false
    
    var body: some View {
        GeometryReader { geometry in
            ZStack {
                
                Circle()
                    .foregroundStyle(LinearGradient(colors: [Color("ColorRed")], startPoint: .top, endPoint: .bottom))
                    .frame(width: 200)
                    .position(x: 50, y: 100)
                    .blur(radius: 60)
                    .opacity(0.5)
                
                Circle()
                    .foregroundStyle(LinearGradient(colors: [Color("ColorRedDark")], startPoint: .top, endPoint: .bottom))
                    .frame(width: 200)
                    .position(x: geometry.size.width - 50, y: geometry.size.height - 50)
                    .blur(radius: 60)
                    .opacity(0.5)
                
                VStack {
                    
                    Text("Chef Delivery")
                        .font(.system(size: 40))
                        .fontWeight(.heavy)
                        .foregroundStyle(LinearGradient(colors: [Color("ColorRed")], startPoint: .top, endPoint: .bottom))
                        .opacity(isAnimating ? 1 : 0)
                        .offset(y: isAnimating ? 0 : -40)
                    
                    Text("Peça as suas comidas no conforto da sua casa")
                        .font(.title2)
                        .padding()
                        .multilineTextAlignment(.center)
                        .foregroundStyle(LinearGradient(colors: [.black.opacity(0.7)], startPoint: .top, endPoint: .bottom))
                        .opacity(isAnimating ? 1 : 0)
                        .offset(y: isAnimating ? 0 : -40)
                        Spacer()
                }
                .onAppear {
                    withAnimation(.easeInOut(duration: 1.5)) {
                        isAnimating = true
                    }
            }
            }
        }
    }
}

#Preview {
    HomeView()
}
