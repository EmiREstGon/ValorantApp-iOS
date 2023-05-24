//
//  AgentsMainView.swift
//  ValorantApp
//
//  Created by Emilio Rafael Estévez González on 25/5/23.
//

import SwiftUI

struct AgentsMainView: View {
    
    // MARK: Variables
    @State private var isLoading = false
    @State private var hasError = false

    // MARK: navBarAppearance init
    init() {
        let navBarAppearance = UINavigationBar.appearance()
        navBarAppearance.largeTitleTextAttributes = [.foregroundColor: UIColor.white]
        navBarAppearance.titleTextAttributes = [.foregroundColor: UIColor(Color("darkBlue"))]
    }
    
    var body: some View {
        NavigationView {
            VStack {
                if isLoading {      // Loading
                    CustomProgressView(color: Color("lightRed"))
                } else {
                    if hasError {   // Error
                        VStack {
                            Spacer()
                            
                            ErrorText()
                        }
                    }
                    AgentsList()    // Success
                }
            }
//            .navigationTitle(LocalizedStringKey("AgentsTitle"))  // Navigation config
            .background(Color("red"))
            .padding(.bottom, 79)
            .ignoresSafeArea(edges: .bottom)
        }
    }
}

//struct AgentsMainView_Previews: PreviewProvider {
//    static var previews: some View {
//        AgentsMainView()
//    }
//}
