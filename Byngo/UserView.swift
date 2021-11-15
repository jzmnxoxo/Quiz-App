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
                HStack {
                    Spacer()
                    Image("avatar3")
                        .resizable()
                        .frame(width: 120, height: 120)
                        .shadow(radius: 5)
                    Spacer()
                }
                Form {
                    Section(header: Text("Username")) {
                        TextField("Royal Educated Octopus", text: $userSettings.username)
                    }
                    Section{
                        NavigationLink(destination: StatsView(statRouter: StatRouter())){
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
