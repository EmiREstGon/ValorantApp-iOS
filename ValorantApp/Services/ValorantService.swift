//
//  AgentsService.swift
//  ValorantApp
//
//  Created by Emilio Rafael Estévez González on 24/5/23.
//

import Foundation

class ValorantService{
    
    // MARK: Get all agents
    func getAllAgents(completion: @escaping (Result<[Agent], Error>) -> Void) {
        let language = Locale.current.language.languageCode?.identifier == "es" ? "es-ES" : "en-US"
        
        guard let url = URL(string: "https://valorant-api.com/v1/agents?isPlayableCharacter=true&language=\(language)") else {  // API URL
            completion(.failure(NSError(domain: "", code: 0, userInfo: nil)))
            return
        }
        
        URLSession.shared.dataTask(with: url) { (data, response, error) in  // Data error
            if let error = error {
                print(error)
                completion(.failure(error))
                return
            }
            
            if let data = data {    // Empty data
                do {
                    let agents = try JSONDecoder().decode(AgentModel.self, from: data)     // Decode JSON
                    completion(.success(agents.agents))
                } catch {
                    print(error)
                    completion(.failure(error))
                }
            }
        }.resume()   // Run the above
    }
    
    // MARK: Get all weapons
    func getAllWeapons(completion: @escaping (Result<[Weapon], Error>) -> Void) {
        let language = Locale.current.language.languageCode?.identifier == "es" ? "es-ES" : "en-US"
        
        guard let url = URL(string: "https://valorant-api.com/v1/weapons?language=\(language)") else {  // API URL
            completion(.failure(NSError(domain: "", code: 0, userInfo: nil)))
            return
        }

        URLSession.shared.dataTask(with: url) { (data, response, error) in  // Data error
            if let error = error {
                print(error)
                completion(.failure(error))
                return
            }

            if let data = data {    // Empty data
                do {
                    let weapons = try JSONDecoder().decode(WeaponModel.self, from: data)     // Decode JSON
                    completion(.success(weapons.weapons))
                } catch {
                    print(error)
                    completion(.failure(error))
                }
            }
        }.resume()   // Run the above
    }
}
