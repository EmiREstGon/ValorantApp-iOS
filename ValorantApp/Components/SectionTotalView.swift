//
//  SectionTotalView.swift
//  ValorantApp
//
//  Created by Emilio Rafael Estévez González on 7/9/23.
//

import SwiftUI

struct SectionTotalView: View {
    
    // MARK: Variable
    var title: LocalizedStringKey
    var total: Int
    
    var body: some View {
        VStack {
            Text(title) + Text(total.description)
        }
        .font(.custom("VALORANT", size: 20))
        .fontWeight(.semibold)
        .foregroundColor(Color("darkBlue"))
        .padding(.vertical, 20)
    }
}

struct SectionTotalView_Previews: PreviewProvider {
    static var previews: some View {
        SectionTotalView(title: "TotalAgentsSubtitle", total: 22)
    }
}
