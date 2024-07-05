//
//  AgentCardComponent.swift
//  ValorantApp
//
//  Created by Emilio Rafael Estévez González on 25/5/23.
//

import SwiftUI
import Kingfisher

struct AgentCardComponentView: View {
    
    // MARK: Variables
    @EnvironmentObject var data: UserData
    @State var isFavorite: Bool = false
    @Binding var agent: Agent
    @StateObject private var loadingState = AgentImagesLoadingState()
    
    var body: some View {
        NavigationLink(destination: AgentDetailView(agent: $agent)) {
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
                                        KFImage(URL(string: agent.role?.displayIcon ?? ""))
                                            .placeholder {
                                                CustomProgressView(color: .white, scale: 1)
                                            }
                                            .resizable()
                                            .scaledToFit()
                                            .frame(width: 30)
                                            .padding(.horizontal, 2.5)
                                            .padding(.vertical, 7.5)
                                    }
                                    .frame(width: 35, height: 35)
                                    .background(Color("red"))
                                    .cornerRadius(10)
                                    .shadow(color: Color("red"), radius: 5)
                                    .padding(.trailing, -5)
                                    .padding(.bottom, 2.5)
                                }
                                
                                HStack {
                                    Spacer()
                                    
                                    AgentName(agent: agent)
                                        .padding(.trailing, -5)
                                        .padding(.bottom, -20)
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
                ZStack {    // CustomProgressView
                    Color("darkBlue")
                    
                    if !loadingState.allLoaded {
                        CustomProgressView(color: Color("lightRed"))
                    }
                    
                    ZStack {    // Agent icon & background
                        AgentIcon(agent: agent, loadingState: loadingState)
                            .padding(.trailing, 185)
                            .background(
                                HStack {
                                    Spacer()
                                    AgentBackground(agent: agent, loadingState: loadingState)
                                        .padding(.leading, 100)
                                }
                            )
                    }
                }
            )
            .overlay(
                heartButton()
                , alignment: .topTrailing)
            .fixedSize(horizontal: false, vertical: true)
            .frame(maxWidth: .infinity, minHeight: 150)
            .cornerRadius(20)
            .padding()
            .shadow(radius: 5)
        }
        .onReceive(data.$favoriteAgents) { favoriteAgents in
            isFavorite = favoriteAgents.contains{ id in
                agent.uuid == id
            }
        }
    }
    
    // MARK: Heart Button view
    func heartButton() -> some View {
        Button {
            data.onFavoritePressed(agentId: agent.uuid, isFavorite: isFavorite)
            isFavorite.toggle()
        } label: {
            Image(systemName: isFavorite ? "heart.fill" : "heart")
                .foregroundColor(isFavorite ? Color("lightRed") : .white)
                .font(.system(size: 35))
        }
            .padding()
    }
}

//struct AgentCardComponentView_Previews: PreviewProvider {
//    static var previews: some View {
//        let role = Role(uuid: "1", displayName: "Initiator", description: "Initiators challenge angles by setting up their team to enter contested ground and push defenders away.", displayIcon: "https://media.valorant-api.com/agents/roles/1b47567f-8f7b-444b-aae3-b0c634622d10/displayicon.png")
//
//        let abilities = [
//            Ability(displayName: "Habilidad 1", description: "Descripción de la habilidad 1", displayIcon: "https://media.valorant-api.com/agents/e370fa57-4757-3604-3648-499e1f642d3f/abilities/ability1/displayicon.png"),
//            Ability(displayName: "Habilidad 2", description: "Descripción de la habilidad 2", displayIcon: "https://media.valorant-api.com/agents/e370fa57-4757-3604-3648-499e1f642d3f/abilities/ability2/displayicon.png"),
//            Ability(displayName: "Habilidad 3", description: "Descripción de la habilidad 3", displayIcon: "https://media.valorant-api.com/agents/e370fa57-4757-3604-3648-499e1f642d3f/abilities/grenade/displayicon.png"),
//            Ability(displayName: "Habilidad 3", description: "Descripción de la habilidad 4", displayIcon: "https://media.valorant-api.com/agents/e370fa57-4757-3604-3648-499e1f642d3f/abilities/ultimate/displayicon.png")]
//
//        let agent = Agent(uuid: "1", displayName: "Gekko", description: "Gekko the Angeleno leads a tight-knit crew of calamitous creatures. His buddies bound forward, scattering enemies out of the way, with Gekko chasing them down to regroup and go again.", displayIcon: "https://media.valorant-api.com/agents/e370fa57-4757-3604-3648-499e1f642d3f/displayicon.png", fullPortrait: "https://media.valorant-api.com/agents/e370fa57-4757-3604-3648-499e1f642d3f/fullportrait.png", killfeedPortrait: "https://media.valorant-api.com/agents/e370fa57-4757-3604-3648-499e1f642d3f/killfeedportrait.png", background: "https://media.valorant-api.com/agents/e370fa57-4757-3604-3648-499e1f642d3f/background.png", role: role, abilities: abilities)
//
//        AgentCardComponentView(agent: agent)
//    }
//}
