//
//  HeartButtonComponent.swift
//  ValorantApp
//
//  Created by Emilio Rafael Estévez González on 8/7/24.
//

import SwiftUI

func heartButton(agentId: String, isFavorite: Bool, onFavoritePressed: @escaping (String, Bool) -> Void) -> some View {
    Button {
        onFavoritePressed(agentId, isFavorite)
    } label: {
        Image(systemName: isFavorite ? "heart.fill" : "heart")
            .foregroundColor(isFavorite ? Color("lightRed") : .white)
            .font(.system(size: 35))
    }
    .padding()
}
