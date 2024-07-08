//
//  AgentAbilityDetailView.swift
//  ValorantApp
//
//  Created by Emilio Rafael Estévez González on 8/7/24.
//

import SwiftUI
import Kingfisher

struct AbilityDetailView: View {
    @Binding var ability: Ability
    
    var body: some View {
        ZStack {
            VStack {
                KFImage(URL(string: ability.displayIcon ?? ""))
                    .placeholder {
                        if ability.displayIcon != nil {
                            CustomProgressView(color: .white)
                        } else {
                            Text(ability.displayName)
                                .font(.title)
                                .bold()
                                .foregroundColor(Color("lightRed"))
                                .padding(.top, 35)
                                .padding(.horizontal, 10)
                        }
                    }
                    .resizable()
                    .scaledToFit()
                    .frame(height: 65)
                    .padding(.top, 25)
                    .padding(.horizontal, 2.5)
                    .colorMultiply(.white)
                
                if ability.displayIcon != nil {
                    Text(ability.displayName)
                        .font(.title)
                        .bold()
                        .foregroundColor(Color("lightRed"))
                        .padding(.horizontal, 10)
                }
                
                Text(ability.description)
                    .font(.title2)
                    .padding(.horizontal, 25)
                    .padding(.top, 10)
                    .padding(.bottom, 25)
            }
            .foregroundColor(.white)
            .frame(maxWidth: .infinity)
            .background(Color("darkBlue"))
            .cornerRadius(20)
            .shadow(radius: 5)
            .overlay {
                RoundedRectangle(cornerRadius: 20)
                    .stroke(.white, lineWidth: 3)
            }
        .padding()
        }
        .frame(maxHeight: .infinity)
        .background(Color("red"))
    }
}
