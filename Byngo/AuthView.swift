//
//  LoginView.swift
//  Byngo
//
//  Created by Jzmn on 15/11/2021.
//

import SwiftUI
import FirebaseAuth

class AppViewModel: ObservableObject {
    
    let auth = Auth.auth()
    
    @Published var loggedIn = false
    
    var isLoggedin: Bool {
        return auth.currentUser != nil
    }
    
    func login(email: String, password: String) {
        auth.signIn(withEmail: email, password: password) { [weak self] result, error in
            guard result != nil, error == nil else {
                return
            }
            
            DispatchQueue.main.async {
                //Success
                self?.loggedIn = true
            }
            
        }
    }
    
    func signUp (email: String, password: String) {
        auth.createUser(withEmail: email, password: password) { [weak self] result, error in
            guard result != nil, error == nil else {
                return
            }
            DispatchQueue.main.async {
                //Success
                self?.loggedIn = true
            }
        }
    }
    
    func logout() {
        try? auth.signOut()
        
        self.loggedIn = false
    }
}

struct AuthView: View {
    @EnvironmentObject var viewModel: AppViewModel
    
    var body: some View {
        NavigationView {
            if viewModel.loggedIn {
                ContentView(viewRouter: ViewRouter())
                
                
            } else {
                LoginView()
            }
        }
        .onAppear {
            viewModel.loggedIn = viewModel.isLoggedin
        }
    }
}


struct LoginView: View {
    
    @State private var isHidden: Bool = true
    @EnvironmentObject var viewModel: AppViewModel
    
    @ObservedObject var userSettings = UserSettings()
    
    
    var body: some View {
        
        VStack {
            Image("avatar2")
                .resizable()
                .scaledToFit()
                .frame(width: 160, height: 160)
            
            VStack {
                TextField("Email Address", text: $userSettings.email)
                    .disableAutocorrection(true)
                    .autocapitalization(.none)
                    .padding()
                    .background(Color(.secondarySystemBackground))
                
                ZStack(alignment: .trailing) {
                    if isHidden {
                        SecureField("Password", text: $userSettings.password)
                            .disableAutocorrection(true)
                            .autocapitalization(.none)
                            .padding()
                            .background(Color(.secondarySystemBackground))
                    } else {
                        TextField("Password", text: $userSettings.password)
                            .disableAutocorrection(true)
                            .autocapitalization(.none)
                            .padding()
                            .background(Color(.secondarySystemBackground))
                    }
                    Button(action: {
                        isHidden.toggle()
                    }) {
                        Image(systemName: isHidden ? "eye.slash" : "eye")
                            .accentColor(.gray)
                    }
                }
                Text("Password contains at least 6 characters")
                    .font(.footnote)
                    .foregroundColor(.gray)
                    .padding(.bottom)
                
                Button(action: {
                    guard !userSettings.email.isEmpty, !userSettings.password.isEmpty else {
                        return
                    }
                    viewModel.login(email: userSettings.email, password: userSettings.password)
                }, label: {
                    Text("Log in")
                        .foregroundColor(Color.white)
                        .frame(width: 200, height: 50)
                        .background(Color.blue)
                    .cornerRadius(15)
                })
                
                NavigationLink("Create Account", destination: SignUpView())
                    .padding()
            }
            .padding()
            
            Spacer()
        }
        .navigationTitle("Log in")
    }
}

struct SignUpView: View {
    
    @EnvironmentObject var viewModel: AppViewModel
    @State private var isHidden: Bool = true
    
    @ObservedObject var userSettings = UserSettings()
    
    var body: some View {
        
        VStack {
            Image("avatar2")
                .resizable()
                .scaledToFit()
                .frame(width: 160, height: 160)
            
            VStack {
                TextField("Email Address", text: $userSettings.email)
                    .disableAutocorrection(true)
                    .autocapitalization(.none)
                    .padding()
                    .background(Color(.secondarySystemBackground))
                
                ZStack(alignment: .trailing) {
                    if isHidden {
                        SecureField("Password", text: $userSettings.password)
                            .disableAutocorrection(true)
                            .autocapitalization(.none)
                            .padding()
                            .background(Color(.secondarySystemBackground))
                    } else {
                        TextField("Password", text: $userSettings.password)
                            .disableAutocorrection(true)
                            .autocapitalization(.none)
                            .padding()
                            .background(Color(.secondarySystemBackground))
                    }
                    Button(action: {
                        isHidden.toggle()
                    }) {
                        Image(systemName: isHidden ? "eye.slash" : "eye")
                            .accentColor(.gray)
                    }
                }
                Text("Password contains at least 6 characters")
                    .font(.footnote)
                    .foregroundColor(.gray)
                    .padding(.bottom)
                
                Button(action: {
                    
                    guard !userSettings.email.isEmpty, !userSettings.password.isEmpty else {
                        return
                    }
                    
                    viewModel.signUp(email: userSettings.email, password: userSettings.password)
                    
                }, label:{
                    Text("Create Account")
                        .foregroundColor(Color.white)
                        .frame(width: 200, height: 50)
                        .background(Color.blue)
                    .cornerRadius(15)
                    
                })
            }
            .padding()
            
            Spacer()
        }
        .navigationTitle("Create Account")
    }
}

struct AuthView_Previews: PreviewProvider {
    static var previews: some View {
        AuthView()
    }
}
