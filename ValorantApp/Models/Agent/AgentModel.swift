//
//  AgentModel.swift
//  ValorantApp
//
//  Created by Emilio Rafael Estévez González on 24/5/23.
//

import Foundation

struct AgentModel: Codable {
    let agents: [Agent]
    
    enum CodingKeys: String, CodingKey {
        case agents = "data"
    }
}
