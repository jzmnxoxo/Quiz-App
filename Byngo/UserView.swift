//
//  UserView.swift
//  TabBar
//
//  Created by Jzmn on 13/11/2021.
//

import SwiftUI
import Combine

struct UserView: View {
    
    @ObservedObject var userSettings = UserSettings()

    var body: some View {
        NavigationView{
            VStack{
                HStack{
                    Spacer()
                    Image("avatar3")
                        .resizable()
                        .frame(width: 120, height: 120)
                        .shadow(radius: 5)
                    Spacer()
                }
                Form{
                    Section(header: Text("Username")) {
                        TextField("Royal Educated Octopus", text: $userSettings.username)
                    }
                }
            }
            .navigationBarTitle("Account")
            
        }
        
        
    }
}

struct UserView_Previews: PreviewProvider {
    static var previews: some View {
        UserView()
    }
}
