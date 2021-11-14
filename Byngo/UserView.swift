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
    @State private var isSecured: Bool = true
    //@Observable
    private var title: String
    
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
                        ZStack(alignment: .trailing) {
                            if isSecured {
                                SecureField(title, text: $userSettings.password)
                            } else {
                                TextField(title, text: $userSettings.password)
                            }
                            Button(action: {
                                isSecured.toggle()
                            }) {
                                Image(systemName: self.isSecured ? "eye.slash" : "eye")
                                    .accentColor(.gray)
                            }
                        }
                    }
                    //                        TextField("Password", text: $userSettings.password)
                    
                }
            }
            
        }
        .navigationBarTitle("Account")
        
    }
    
    
}


struct UserView_Previews: PreviewProvider {
    static var previews: some View {
        UserView()
    }
}
