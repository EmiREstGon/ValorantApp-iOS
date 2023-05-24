//
//  UserSettings.swift
//  ValorantApp
//
//  Created by Emilio Rafael Estévez González on 29/5/23.
//

import Foundation

class UserSettings : ObservableObject {
    
    // MARK: Variables
    @Published var language: String
    
    // MARK: Language init
    init() {
        let initLanguage = UserDefaults.standard.string(forKey: "language") ?? "es-ES"
        language = initLanguage
    }
    
    // MARK: Set language
    func setLanguage(_ lang: String) {
        UserDefaults.standard.set(lang, forKey: "language")
        language = lang
    }
}
