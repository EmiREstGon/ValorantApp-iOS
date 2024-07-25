//
//  SectionEndList.swift
//  ValorantApp
//
//  Created by Emilio Rafael Estévez González on 24/7/24.
//

import SwiftUI

struct SectionEndListView: View {
    var totalAgents: Int
    
    var body: some View {
        VStack {
            SectionTotalView(title: "TotalAgentsSubtitle", total: totalAgents)
            
            SectionLogoView()
        }
    }
}

struct SectionEndListView_Previews: PreviewProvider {
    static var previews: some View {
        SectionEndListView(totalAgents: 24)
            .preferredColorScheme(.dark)
    }
}
