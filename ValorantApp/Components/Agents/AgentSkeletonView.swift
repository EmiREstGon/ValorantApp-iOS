//
//  AgentSkeletonView.swift
//  ValorantApp
//
//  Created by Emilio Rafael Estévez González on 5/7/24.
//

import SwiftUI

struct AgentSkeletonView: View {
    @State private var isAnimating = false
    @State private var animationOffset: CGFloat = -UIScreen.main.bounds.width
    var imageName: String
    
    var body: some View {
        VStack {
            HStack {
                Spacer()
                
                VStack {
                    ZStack {
                        VStack {
                            Spacer()
                            
                            HStack {
                                Spacer()
                                
                                HStack {
                                    RoundedRectangle(cornerRadius: 10)
                                        .fill(Color.gray.opacity(0.3))
                                        .frame(width: 30, height: 30)
                                        .padding(.trailing, -5)
                                        .padding(.bottom, 5)
                                }
                            }
                            
                            HStack {
                                Spacer()
                                
                                RoundedRectangle(cornerRadius: 7.5)
                                    .fill(Color.gray.opacity(0.3))
                                    .frame(width: 125, height: 25)
                                    .padding(.trailing, -5)
                                    .padding(.bottom, -15)
                            }
                        }
                        .frame(height: 115)
                    }
                    
                    Spacer()
                }
            }
        }
        .padding(25)
        .background(
            ZStack {
                Color("darkBlue")
                RoundedRectangle(cornerRadius: 10)
                    .fill(Color.gray.opacity(0.3))
                
                HStack {
                    Image(imageName)
                        .resizable()
                        .scaledToFit()
                        .opacity(0.3)
                    
                    Spacer()
                }
            }
        )
        .fixedSize(horizontal: false, vertical: true)
        .frame(maxWidth: .infinity, minHeight: 150)
        .cornerRadius(20)
        .padding()
        .shadow(radius: 5)
        .opacity(isAnimating ? 0.8 : 1)
        .onAppear {
            withAnimation(Animation.linear(duration: 0.5).repeatForever(autoreverses: true)) {
                isAnimating.toggle()
            }
        }
    }
}

struct AgentSkeletonView_Previews: PreviewProvider {
    static var previews: some View {
        AgentSkeletonView(imageName: "skeletonGekkoIcon")
    }
}
