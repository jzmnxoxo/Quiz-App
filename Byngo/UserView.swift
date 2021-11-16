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
    @EnvironmentObject var viewModel: AppViewModel
    @State private var isHidden: Bool = true
    
    var body: some View {
//        NavigationView {
            VStack {
                Spacer()
                ImageChangeView()
                
                Form {
                    Section(header: Text("Username")) {
                        TextField("Royal Educated Octopus", text: $userSettings.username)
                    }
                    Section(header: Text("Email")) {
                        Text(userSettings.email)
                    }
                    Section(header: Text("Password")) {
                        HStack {
                            if isHidden {
                                Text("**********")
                            } else {
                                Text(userSettings.password)
                            }
                            Spacer()
                            Button(action: {
                                isHidden.toggle()
                            }) {
                                Image(systemName: isHidden ? "eye.slash" : "eye")
                                    .accentColor(.gray)
                            }
                        }
                    }
                    Section {
                        NavigationLink(destination: StatsView(statRouter: StatRouter())) {
                            Text("Statistics")
                        }
                    }
                    Button(action: {
                        viewModel.logout()
                    }, label: {
                        Text("Log out ")
                            .multilineTextAlignment(.center)
      
                    })
                }
     
                
            }
//        }
        .navigationTitle("Account")
        
    }
    
    
}




struct UserView_Previews: PreviewProvider {
    static var previews: some View {
        UserView()
    }
}
