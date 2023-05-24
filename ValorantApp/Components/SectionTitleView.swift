//
//  SectionTitleView.swift
//  ValorantApp
//
//  Created by Emilio Rafael Estévez González on 7/9/23.
//

import SwiftUI

struct SectionTitleView: View {
    
    // MARK: Variable
    var title: LocalizedStringKey
    
    var body: some View {
        Text(title)
            .font(.custom("VALORANT", size: 44))
            .fontWeight(.semibold)
            .foregroundColor(.white)
            .padding(.vertical, 20)
    }
}

struct SectionTitleView_Previews: PreviewProvider {
    static var previews: some View {
        SectionTitleView(title: LocalizedStringKey("AgentsTitle"))
    }
}
