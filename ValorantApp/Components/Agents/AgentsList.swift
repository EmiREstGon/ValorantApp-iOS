//
//  AgentsList.swift
//  ValorantApp
//
//  Created by Emilio Rafael Estévez González on 8/6/23.
//

import SwiftUI

struct AgentsList: View {
    
    // MARK: Variables
    @State private var agents: [Agent] = []
    @State private var isLoading = false
    @State private var hasError = false
    private let valorantService = ValorantService()
    private let skeletonImages = ["skeletonGekkoIcon", "skeletonFadeIcon", "skeletonBreachIcon", "skeletonDeadlockIcon"]
    private var totalAgents: Int {
        agents.count
    }
    
    // MARK: Get all Agents info to agents: [Agent]
    func getAllAgents() {
        isLoading = true
        
        valorantService.getAllAgents() { result in
            DispatchQueue.main.async {
                isLoading = false
                
                switch result {
                    case .success(let agents):
                        self.agents = agents
                    case .failure(let error):
                    hasError = true
                    print(error.localizedDescription)
                }
            }
        }
    }
    
    var body: some View {
        ScrollView {
            LazyVStack(spacing: -12) {
                SectionTitleView(title: "AgentsTitle")
                
                if isLoading {
                    ForEach(0..<skeletonImages.count, id: \.self) { index in
                        AgentSkeletonView(imageName: skeletonImages[index])
                    }
                } else {
                    ForEach($agents, id: \.uuid) { agent in
                        AgentCardComponentView(agent: agent)
                    }
                }
                
                SectionTotalView(title: "TotalAgentsSubtitle", total: totalAgents)
                
                SectionLogoView()
            }
        }
        .scrollIndicators(.hidden)
        .onAppear() {
            if agents.isEmpty {
                getAllAgents()
            }
        }
    }
}

//struct AgentsList_Previews: PreviewProvider {
//    static var previews: some View {
//        AgentsList()
//    }
//}
