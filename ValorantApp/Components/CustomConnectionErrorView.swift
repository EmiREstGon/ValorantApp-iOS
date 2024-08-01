//
//  CustomConnectionErrorView.swift
//  ValorantApp
//
//  Created by Emilio Rafael Estévez González on 25/7/24.
//

import SwiftUI

struct CustomConnectionErrorView: View {
    @Binding var isPresented: Bool
    var retryAction: () -> Void
    var totalAgents: Int
    @State private var isVisible = false

    var wifiIcon: some View {
        Image(systemName: "wifi.exclamationmark")
            .symbolRenderingMode(.palette)
            .resizable()
            .scaledToFit()
            .frame(width: 50, height: 50)
            .foregroundStyle(Color("lightRed"), Color("darkBlue"))
            .padding(.top, 12)
    }

    var body: some View {
        ZStack {
            Color.black.opacity(0.5).edgesIgnoringSafeArea(.all)
            
            VStack {
                Spacer()

                VStack {
                    if #available(iOS 17.0, *) {
                        wifiIcon
                            .symbolEffect(.pulse.byLayer)
                    } else {
                        wifiIcon
                    }

                    Text(LocalizedStringKey("ConnectionErrorTitle"))
                        .font(.title3)
                        .fontWeight(.bold)
                        .padding(.bottom, 4)

                    Text(LocalizedStringKey("ConnectionErrorDescriptionLine1"))
                        .font(.body)
                        .multilineTextAlignment(.center)
                        .padding(.horizontal)
                        .padding(.bottom, 4)

                    Text(LocalizedStringKey("ConnectionErrorDescriptionLine2"))
                        .font(.body)
                        .multilineTextAlignment(.center)
                        .padding(.horizontal)
                        .padding(.bottom, 10)

                    Button(action: {
                        withAnimation(.easeOut(duration: 0.3)) {
                            isVisible = false
                        }
                        DispatchQueue.main.asyncAfter(deadline: .now() + 0.3) {
                            isPresented = false
                            retryAction()
                        }
                    }) {
                        Text(LocalizedStringKey("RetryButton"))
                            .font(.headline)
                            .padding()
                            .frame(maxWidth: .infinity)
                            .background(Color("red"))
                            .foregroundColor(.white)
                    }
                }
                .frame(width: 300)
                .background(Color.white.opacity(0.75))
                .cornerRadius(20)
                .shadow(radius: 20)
                .opacity(isVisible ? 1 : 0)
                .onAppear {
                    withAnimation(.easeIn(duration: 0.3)) {
                        isVisible = true
                    }
                }

                Spacer()
            }
        }
        .opacity(isVisible ? 1 : 0)
        .animation(.easeInOut(duration: 0.3), value: isVisible)
    }
}
