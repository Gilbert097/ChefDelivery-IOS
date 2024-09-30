//
//  HomeView.swift
//  ChefDelivery
//
//  Created by Gilberto Silva on 28/09/24.
//

import SwiftUI

struct HomeView: View {
    
    @State private var isAnimating = false
    @State private var imageOffset: CGSize = .zero
    
    var body: some View {
        GeometryReader { geometry in
            ZStack {
                
                Circle()
                    .foregroundStyle(LinearGradient(colors: [Color("ColorRed")], startPoint: .top, endPoint: .bottom))
                    .frame(width: isAnimating ? 200 : 0)
                    .position(x: isAnimating ? 50 : -50, y: isAnimating ? 100 : -100)
                    .blur(radius: 60)
                    .opacity(isAnimating ? 0.5 : 0)
                
                Circle()
                    .foregroundStyle(LinearGradient(colors: [Color("ColorRedDark")], startPoint: .top, endPoint: .bottom))
                    .frame(width: isAnimating ? 200 : 0)
                    .position(
                        x: isAnimating ? geometry.size.width - 50 : geometry.size.width + 50,
                        y: isAnimating ? geometry.size.height - 50 : geometry.size.width + 50
                    )
                    .blur(radius: 60)
                    .opacity(isAnimating ? 0.5 : 0)
                
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
                    
                    Image("image")
                        .resizable()
                        .scaledToFit()
                        .shadow(radius: 60)
                        .padding(isAnimating ? 32 : 92)
                        .opacity(isAnimating ? 1 : 0)
                        .offset(x: self.imageOffset.width, y: self.imageOffset.height)
                        .gesture(
                            DragGesture()
                                .onChanged({ value in
                                    withAnimation(.easeInOut(duration: 0.5)) {
                                        self.imageOffset = value.translation
                                    }
                                })
                                .onEnded({ _ in
                                    withAnimation(.easeInOut(duration: 0.5)) {
                                        self.imageOffset = .zero
                                    }
                                })
                        )
                    
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
