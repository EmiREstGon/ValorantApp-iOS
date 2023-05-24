//
//  ContentView.swift
//  ValorantApp
//
//  Created by Emilio Rafael Estévez González on 24/5/23.
//

/*
    BINDING <- STATE
 
    OBSERVEDOBJECT <- OBSERVABLEOBJECT, STATEOBJECT
*/

import SwiftUI

struct ContentView: View {
    var body: some View {
        
        // MARK: Variables
        let data = UserData()
        
        TabView {
            // MARK: TAB 1 - Agents
            AgentsMainView()
                .tabItem {
                    Image(systemName: "person.3.fill")
                    Text(LocalizedStringKey("AgentsTitle"))
                }
            
            // MARK: TAB 2 - Weapons
            WeaponsMainView()
                .tabItem {
                    Image(systemName: "flame.fill")
                    Text(LocalizedStringKey("WeaponsTitle"))
                }
            
            // MARK: TAB 3 - Maps
            Text ("Maps")
                .tabItem {
                    Image(systemName: "map.fill")
                    Text(LocalizedStringKey("MapsTitle"))
                }
        }
        .environmentObject(data)
        .accentColor(Color("lightRed"))
        .onAppear {
            UITabBar.appearance().barTintColor = UIColor(Color("darkBlue"))
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
