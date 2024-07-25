//
//  AgentsList.swift
//  ValorantApp
//
//  Created by Emilio Rafael Estévez González on 8/6/23.
//

import SwiftUI
import Network

struct AgentsListView: View {
    @State private var agents: [Agent] = []
    @State private var isLoading = false
    @State private var hasError = false
    private let valorantService = ValorantService()
    private var totalAgents: Int {
        agents.count
    }
    
    private let skeletonImages = ["skeletonGekkoIcon", "skeletonFadeIcon", "skeletonBreachIcon", "skeletonDeadlockIcon"]
    
    func getAllAgents() {
        checkInternetConnection { isConnected in
            DispatchQueue.main.async {
                if isConnected {
                    self.isLoading = true
                    
                    self.valorantService.getAllAgents() { result in
                        DispatchQueue.main.async {
                            switch result {
                            case .success(let agents):
                                self.isLoading = false
                                self.agents = agents
                            case .failure(let error):
                                self.isLoading = false
                                self.hasError = true
                                print(error.localizedDescription)
                            }
                        }
                    }
                } else {
                    self.hasError = true
                }
            }
        }
    }
    
    func checkInternetConnection(completion: @escaping (Bool) -> Void) {
        let monitor = NWPathMonitor()
        let queue = DispatchQueue(label: "InternetConnectionMonitor")
        
        monitor.pathUpdateHandler = { path in
            if path.status == .satisfied {
                completion(true)
            } else {
                completion(false)
            }
            monitor.cancel()
        }
        
        monitor.start(queue: queue)
    }
    
    var body: some View {
        ZStack {
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
                        
                        SectionEndListView(totalAgents: totalAgents)
                    }
                }
                .padding(.bottom, 100)
                .scrollIndicators(.hidden)
                .onAppear() {
                    if agents.isEmpty {
                        getAllAgents()
                    }
                }
            }
            
            if hasError {
                CustomConnectionErrorView(isPresented: $hasError, retryAction: getAllAgents, totalAgents: totalAgents)
                    .zIndex(1)
            }
        }
    }
}

struct AgentsListView_Previews: PreviewProvider {
    static var previews: some View {
        AgentsListView()
    }
}
