//
//  AgentAbilities.swift
//  ValorantApp
//
//  Created by Emilio Rafael Estévez González on 9/6/23.
//

import SwiftUI

struct AgentAbilities: View {
    // MARK: Variable
    @Binding var agent: Agent

    @State var showingSheet = false
    @State var selectedAbility: Ability = .init(displayName: "", description: "")
    @State var abilities: [Ability] = []

    
    var body: some View {
        HStack {
            ForEach($abilities, id: \.displayName) { ability in
                Button {
                    selectedAbility = ability.wrappedValue
                    showingSheet = true
                } label: {
                    AsyncImage(url: URL(string: ability.displayIcon.wrappedValue ?? "")) { image in
                        image
                            .resizable()
                            .scaledToFit()
                            .frame(height: 40)
                            .padding(.vertical, 12.5)
                            .padding(.horizontal, 2.5)
                    } placeholder: {
                        if ability.displayIcon.wrappedValue != nil {
                            ProgressView()
                                .tint(.white)
                                .padding()
                                .scaleEffect(x: 1.5, y: 1.5)
                        } else {
                            Text(ability.displayName.wrappedValue)
                                .font(.title3)
                                .bold()
                                .foregroundColor(.white)
                                .multilineTextAlignment(.center)
                        }
                    }
                }
                .padding(.horizontal, 10)
                .sheet(isPresented: $showingSheet) {
                        AbilityDetailView(ability: $selectedAbility)
                }
                .background(Color("red"))
                .cornerRadius(15)
                .padding(.leading, 5)
                .padding(.trailing, 2.5)
                .shadow(color: Color("red"), radius: 5)
            }
        }
        .onAppear{
            abilities = $agent.wrappedValue.abilities ?? []
        }
        .frame(minWidth: 200)
        .padding(.vertical)
        .padding(.horizontal, 50)
    }
}

struct AbilityDetailView: View {
    @Binding var ability: Ability
    
    var body: some View {
        ZStack {
            VStack {
                AsyncImage(url: URL(string: ability.displayIcon ?? "")) { image in
                    image
                        .resizable()
                        .scaledToFit()
                        .frame(height: 65)
                        .padding(.top, 25)
                        .padding(.horizontal, 2.5)
                        .colorMultiply(.white)
                } placeholder: {
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

//struct AgentAbilities_Previews: PreviewProvider {
//    static var previews: some View {
//        
//        let role = Role(uuid: "1", displayName: "Initiator", description: "Initiators challenge angles by setting up their team to enter contested ground and push defenders away.", displayIcon: "https://media.valorant-api.com/agents/roles/1b47567f-8f7b-444b-aae3-b0c634622d10/displayicon.png")
//        
//        let abilities = [
//            Ability(displayName: "Wingman", description: "EQUIP Wingman. FIRE to send Wingman forward seeking enemies. Wingman unleashes a concussive blast toward the first enemy he sees. ALT FIRE when targeting a Spike site or planted Spike to have Wingman defuse or plant the Spike. To plant, Gekko must have the Spike in his inventory. When Wingman expires he reverts into a dormant globule. INTERACT to reclaim the globule and gain another Wingman charge after a short cooldown.", displayIcon: "https://media.valorant-api.com/agents/e370fa57-4757-3604-3648-499e1f642d3f/abilities/ability1/displayicon.png"),
//            Ability(displayName: "Dizzy", description: "EQUIP Dizzy. FIRE to send Dizzy soaring forward through the air. Dizzy charges then unleashes plasma blasts at enemies in line of sight. Enemies hit by her plasma are Blinded. When Dizzy expires she reverts into a dormant globule. INTERACT to reclaim the globule and gain another Dizzy charge after a short cooldown.", displayIcon: "https://media.valorant-api.com/agents/e370fa57-4757-3604-3648-499e1f642d3f/abilities/ability2/displayicon.png"),
//            Ability(displayName: "Mosh Pit", description: "EQUIP Mosh. FIRE to throw Mosh like a grenade. ALT FIRE to throw underhand. Upon landing Mosh duplicates across a large area then after a short delay explodes.", displayIcon: "https://media.valorant-api.com/agents/e370fa57-4757-3604-3648-499e1f642d3f/abilities/grenade/displayicon.png"),
//            Ability(displayName: "Thrash", description: "EQUIP Thrash. FIRE to link with Thrash’s mind and steer her through enemy territory. ACTIVATE to lunge forward and explode, Detaining any players in a small radius. When Thrash expires she reverts into a dormant globule. INTERACT to reclaim the globule and gain another Thrash charge after a short cooldown. Thrash can be reclaimed once.", displayIcon: "https://media.valorant-api.com/agents/e370fa57-4757-3604-3648-499e1f642d3f/abilities/ultimate/displayicon.png")]
//        
//        let agent = Agent(uuid: "1", displayName: "Gekko", description: "Gekko the Angeleno leads a tight-knit crew of calamitous creatures. His buddies bound forward, scattering enemies out of the way, with Gekko chasing them down to regroup and go again.", displayIcon: "https://media.valorant-api.com/agents/e370fa57-4757-3604-3648-499e1f642d3f/displayicon.png", fullPortrait: "https://media.valorant-api.com/agents/e370fa57-4757-3604-3648-499e1f642d3f/fullportrait.png", killfeedPortrait: "https://media.valorant-api.com/agents/e370fa57-4757-3604-3648-499e1f642d3f/killfeedportrait.png", background: "https://media.valorant-api.com/agents/e370fa57-4757-3604-3648-499e1f642d3f/background.png", role: role, abilities: abilities)
//        
//        AgentAbilities(agent: agent)
//    }
//}
