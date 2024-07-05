//
//  LoadingState.swift
//  ValorantApp
//
//  Created by Emilio Rafael Estévez González on 4/7/24.
//

import Foundation

class AgentImagesLoadingState: ObservableObject {
    @Published var agentIconLoading: Bool = true
    @Published var agentBackgroundLoading: Bool = true

    var allLoaded: Bool {
        !agentIconLoading && !agentBackgroundLoading
    }
}
