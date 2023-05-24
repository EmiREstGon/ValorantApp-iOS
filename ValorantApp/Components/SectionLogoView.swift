//
//  SectionLogoView.swift
//  ValorantApp
//
//  Created by Emilio Rafael Estévez González on 7/9/23.
//

import SwiftUI

struct SectionLogoView: View {
    private var valorantURL = NSLocalizedString("ValorantURL", comment: "")

    var body: some View {
        if let url = URL(string: valorantURL) {
            Link(destination: url) {
                Image("logoWhite")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 50, height: 50)
                    .padding(.bottom, 20)
            }
        }
    }
}

struct SectionLogoView_Previews: PreviewProvider {
    static var previews: some View {
        SectionLogoView()
    }
}
