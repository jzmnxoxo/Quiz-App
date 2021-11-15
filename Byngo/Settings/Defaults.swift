//
//  Defaults.swift
//  Byngo
//
//  Created by Jzmn on 14/11/2021.
//

import Foundation
import Combine



class UserSettings: ObservableObject {
    
    @Published var username: String {
        didSet {
            UserDefaults.standard.set(username, forKey: "username")
        }
    }
    
    @Published var password: String {
        didSet {
            UserDefaults.standard.set(password, forKey: "password")
        }
    }
    
//    @Published var id : Int = UserDefaults.standard.integer(forKey: "id") ?? UserSettings.ids[0]{
//        didSet {
//            UserDefaults.standard.set(id, forKey: "id")
//        }
//    }
    
    @Published var music : Bool {
        didSet{
            UserDefaults.standard.set(music, forKey: "music")
        }
    }
    
    @Published var soundEffects : Bool {
        didSet{
            UserDefaults.standard.set(soundEffects, forKey: "soundEffects")
        }
    }
    
    @Published var language: String = UserDefaults.standard.string(forKey: "language") ?? UserSettings.langs[0]{
        didSet{
            UserDefaults.standard.set(self.language,forKey: "language")
        }
    }
    
    @Published var region: String = UserDefaults.standard.string(forKey: "region") ?? UserSettings.regions[0]{
        didSet{
            UserDefaults.standard.set(self.region,forKey: "region")
        }
    }
    
    static var langs = ["English", "Chinese", "Spanish","Japanese"]
    static var ids = [123456, 543523, 984752, 234213]
    static var regions = ["Hong Kong", "Taiwan", "United States", "Japan"]
    
    init(){
        self.username = UserDefaults.standard.object(forKey: "username") as? String ?? "User"
        self.music = UserDefaults.standard.object(forKey: "music") as? Bool ?? true
        self.soundEffects = UserDefaults.standard.object(forKey: "soundEffects") as? Bool ?? true
        self.password = UserDefaults.standard.object(forKey: "password") as? String ?? ""
        self.language = UserDefaults.standard.object(forKey: "language") as? String ?? "English"
        self.region = UserDefaults.standard.object(forKey: "region") as? String ?? "Hong Kong"
        
    }
    
}
