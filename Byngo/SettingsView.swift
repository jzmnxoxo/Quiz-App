//
//  SettingsView.swift
//  TabBar
//
//  Created by Jzmn on 13/11/2021.
//

import SwiftUI
import Combine

struct SettingsView: View {
    @ObservedObject var userSettings = UserSettings()
    
    var body: some View {
        NavigationView {
            Form {
                Section(header: Text("Username")) {
                    TextField("Username", text: $userSettings.username)
                }
                Section(header: Text("Sounds")) {
                    Toggle(isOn: $userSettings.music){
                        Text("Music")
                    }
                    Toggle(isOn: $userSettings.soundEffects){
                        Text("Sound Effects")
                    }
                }
                Section(header: Text("Language & Region")) {
                    Picker(selection: $userSettings.language, label: Text("Language")){
                        ForEach(UserSettings.langs, id: \.self ) {
                            language in Text(language)
                        }
                    }
                    Picker(selection: $userSettings.region, label: Text("Region")){
                        ForEach(UserSettings.regions, id: \.self ) {
                            region in Text(region)
                        }
                    }
                }
            }
            .navigationBarTitle("Settings")
        }
        .ignoresSafeArea()
    }
}

struct SettingsView_Previews: PreviewProvider {
    static var previews: some View {
        SettingsView()
    }
}
