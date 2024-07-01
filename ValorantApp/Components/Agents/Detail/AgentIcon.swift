//
//  AgentIcon.swift
//  ValorantApp
//
//  Created by Emilio Rafael Estévez González on 9/6/23.
//

import SwiftUI

struct AgentIcon: View {
    
    // MARK: Variable
    var agent: Agent
    
    var body: some View {
        AsyncImage(url: URL(string: agent.displayIcon)) { image in
            image.resizable().scaledToFill().opacity(0.95)
                .padding(.trailing, 185)
                .shadow(radius: 5)
        } placeholder: {
            CustomProgressView(color: Color("lightRed"))
                .padding(.trailing, 185)
        }
    }
}

struct AgentIcon_Previews: PreviewProvider {
    static var previews: some View {
        
        let role = Role(uuid: "1", displayName: "Initiator", description: "Initiators challenge angles by setting up their team to enter contested ground and push defenders away.", displayIcon: "https://media.valorant-api.com/agents/roles/1b47567f-8f7b-444b-aae3-b0c634622d10/displayicon.png")
        
        let abilities = [
            Ability(displayName: "Wingman", description: "EQUIP Wingman. FIRE to send Wingman forward seeking enemies. Wingman unleashes a concussive blast toward the first enemy he sees. ALT FIRE when targeting a Spike site or planted Spike to have Wingman defuse or plant the Spike. To plant, Gekko must have the Spike in his inventory. When Wingman expires he reverts into a dormant globule. INTERACT to reclaim the globule and gain another Wingman charge after a short cooldown.", displayIcon: "https://media.valorant-api.com/agents/e370fa57-4757-3604-3648-499e1f642d3f/abilities/ability1/displayicon.png"),
            Ability(displayName: "Dizzy", description: "EQUIP Dizzy. FIRE to send Dizzy soaring forward through the air. Dizzy charges then unleashes plasma blasts at enemies in line of sight. Enemies hit by her plasma are Blinded. When Dizzy expires she reverts into a dormant globule. INTERACT to reclaim the globule and gain another Dizzy charge after a short cooldown.", displayIcon: "https://media.valorant-api.com/agents/e370fa57-4757-3604-3648-499e1f642d3f/abilities/ability2/displayicon.png"),
            Ability(displayName: "Mosh Pit", description: "EQUIP Mosh. FIRE to throw Mosh like a grenade. ALT FIRE to throw underhand. Upon landing Mosh duplicates across a large area then after a short delay explodes.", displayIcon: "https://media.valorant-api.com/agents/e370fa57-4757-3604-3648-499e1f642d3f/abilities/grenade/displayicon.png"),
            Ability(displayName: "Thrash", description: "EQUIP Thrash. FIRE to link with Thrash’s mind and steer her through enemy territory. ACTIVATE to lunge forward and explode, Detaining any players in a small radius. When Thrash expires she reverts into a dormant globule. INTERACT to reclaim the globule and gain another Thrash charge after a short cooldown. Thrash can be reclaimed once.", displayIcon: "https://media.valorant-api.com/agents/e370fa57-4757-3604-3648-499e1f642d3f/abilities/ultimate/displayicon.png")]
        
        let agent = Agent(uuid: "1", displayName: "Gekko", description: "Gekko the Angeleno leads a tight-knit crew of calamitous creatures. His buddies bound forward, scattering enemies out of the way, with Gekko chasing them down to regroup and go again.", displayIcon: "https://media.valorant-api.com/agents/e370fa57-4757-3604-3648-499e1f642d3f/displayicon.png", fullPortrait: "https://media.valorant-api.com/agents/e370fa57-4757-3604-3648-499e1f642d3f/fullportrait.png", killfeedPortrait: "https://media.valorant-api.com/agents/e370fa57-4757-3604-3648-499e1f642d3f/killfeedportrait.png", background: "https://media.valorant-api.com/agents/e370fa57-4757-3604-3648-499e1f642d3f/background.png", role: role, abilities: abilities)
        
        AgentIcon(agent: agent)
    }
}
