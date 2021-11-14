//
//  SettingsView.swift
//  TabBar
//
//  Created by Jzmn on 13/11/2021.
//

import SwiftUI
import Combine

struct SettingsView: View {
    @ObservedObject var defaults = Defaults()
    
    var body: some View {
        NavigationView {
            Form {
                Section(header: Text("Profile")) {
                    TextField("Username", text: $defaults.username)
                }
            }
            .navigationBarTitle("Settings")
        }
    }
}

struct SettingsView_Previews: PreviewProvider {
    static var previews: some View {
        SettingsView()
    }
}
