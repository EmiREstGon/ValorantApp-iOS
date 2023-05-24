//
//  HeartButton.swift
//  ValorantApp
//
//  Created by Emilio Rafael Estévez González on 9/6/23.
//

import SwiftUI

struct HeartButton: View {
    
    // MARK: Variables
    @EnvironmentObject var data: UserData
    @State var isFavorite: Bool = false
    var agent: Agent
    
    var body: some View {
        Button {
//            withAnimation(.easeIn) {
                data.onFavoritePressed(agentId: agent.uuid, isFavorite: isFavorite)
                isFavorite.toggle()
//            }
        } label: {
            Image(systemName: isFavorite ? "heart.fill" : "heart")
                .foregroundColor(isFavorite ? Color("lightRed") : .white)
                .font(.system(size: 35))
        }
            .padding()
    }
}
