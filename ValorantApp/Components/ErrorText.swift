//
//  ErrorMessage.swift
//  ValorantApp
//
//  Created by Emilio Rafael Estévez González on 8/6/23.
//

import SwiftUI

struct ErrorText: View {
    var body: some View {
        Text("An unexpected error occurred!")
            .font(.title2)
            .bold()
            .foregroundColor(.white)
    }
}

struct ErrorText_Previews: PreviewProvider {
    static var previews: some View {
        ErrorText()
    }
}
