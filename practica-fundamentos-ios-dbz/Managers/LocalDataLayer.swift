//
//  LocalDataLayer.swift
//  practica-fundamentos-ios-dbz
//
//  Created by Pablo Gómez on 9/1/23.
//

import Foundation

enum keyType: String {
    case token
    case email
    case heroes
}


final class LocalDataLayer {
    
    static let shared = LocalDataLayer()
    
    func save(value: String, key: keyType){
        UserDefaults.standard.set(value, forKey: key.rawValue)
    }
    
    func getValue(key: keyType) -> String{
        return UserDefaults.standard.string(forKey: key.rawValue) ?? ""
    }
    
    func isUserLogged() -> Bool {
        return !getValue(key: .token).isEmpty
    }
    
    func save(heroes: [Heroe]){
        if let encodedHeroes = try? JSONEncoder().encode(heroes){
            UserDefaults.standard.set(encodedHeroes, forKey: keyType.heroes.rawValue)
        }
    }
    
    func deleteAll(){
        let defaults = UserDefaults.standard
        let dictionary = defaults.dictionaryRepresentation()
        dictionary.keys.forEach {defaults.removeObject(forKey: $0)}
    }
    
    func getHeroes() -> [Heroe]{
        if let savedHeroesData = UserDefaults.standard.object(forKey: keyType.heroes.rawValue) as? Data{
            do{
                let savedHeroes = try JSONDecoder().decode([Heroe].self, from: savedHeroesData)
                return savedHeroes
            } catch{
                print("Something went wrong !!")
                return []
            }
        }else{
            return []
        }
    }
}
