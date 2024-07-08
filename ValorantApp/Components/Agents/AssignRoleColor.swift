//
//  AssignRoleColor.swift
//  ValorantApp
//
//  Created by Emilio Rafael Estévez González on 8/7/24.
//

import SwiftUI

func assignRoleColor(for role: String) -> Color {
    switch role {
    case "Duelist", "Duelista":
        return Color("gold")
    case "Initiator", "Iniciador":
        return Color("blue")
    case "Sentinel", "Centinela":
        return Color("green")
    case "Controller", "Controlador":
        return Color("purple")
    default:
        return Color("red")
    }
}
