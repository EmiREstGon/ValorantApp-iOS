//
//  AgentDescription.swift
//  ValorantApp
//
//  Created by Emilio Rafael Estévez González on 8/6/23.
//

import SwiftUI

struct AgentDescription: View {
    
    // MARK: Variable
    var agent: Agent
    
    var body: some View {
        Text(agent.description)
            .font(.title2)
            .fontWeight(.semibold)
            .foregroundColor(.white)
            .padding()
            .padding(.top)
            .padding(.horizontal, 25)
    }
}
