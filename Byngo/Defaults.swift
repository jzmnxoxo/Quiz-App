//
//  Defaults.swift
//  Byngo
//
//  Created by Jzmn on 14/11/2021.
//

import SwiftUI
import Combine

let defaults = UserDefaults.standard
class Defaults: ObservableObject {
    @Published var username: String {
        didSet {
            defaults.set(username, forKey: "username")
        }
    }
    
    init(){
        self.username = defaults.object(forKey: "username") as? String ?? "user"
    }
}
