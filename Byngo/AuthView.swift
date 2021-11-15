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
    
    func login(email: String, password: String){
        auth.signIn(withEmail: email, password: password) {[weak self] result, error in
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
    
    func logout(){
        try? auth.signOut()
        
        self.loggedIn=false
    }
}

struct AuthView: View {
    @EnvironmentObject var viewModel: AppViewModel
    
    var body: some View {
        NavigationView{
            if viewModel.loggedIn {
                ContentView(viewRouter: ViewRouter())
                
                
            }
            else{
                LoginView()
            }
        }
        .onAppear{
            viewModel.loggedIn = viewModel.isLoggedin
        }
    }
}


struct LoginView: View {
    
    @State var email = ""
    @State var password = ""
    @State private var isHidden: Bool = true
    @EnvironmentObject var viewModel: AppViewModel
    
    var body: some View {
        
        VStack{
            Image("avatar2")
                .resizable()
                .scaledToFit()
                .frame(width: 160, height: 160)
            
            VStack{
                TextField("Email Address", text: $email)
                    .disableAutocorrection(true)
                    .autocapitalization(.none)
                    .padding()
                    .background(Color(.secondarySystemBackground))
                
                ZStack(alignment: .trailing) {
                    if isHidden {
                        SecureField("Password", text: $password)
                            .disableAutocorrection(true)
                            .autocapitalization(.none)
                            .padding()
                            .background(Color(.secondarySystemBackground))
                    } else {
                        TextField("Password", text: $password)
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
                
                Button(action: {
                    guard !email.isEmpty, !password.isEmpty else {
                        return
                    }
                    viewModel.login(email: email, password: password)
                }, label:{
                    Text("Sign in")
                        .foregroundColor(Color.white)
                        .frame(width: 200, height: 50)
                        .cornerRadius(30)
                        .background(Color.blue)
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
    
    @State var email = ""
    @State var password = ""
    @EnvironmentObject var viewModel: AppViewModel
    
    var body: some View {
        
        VStack{
            Image("avatar2")
                .resizable()
                .scaledToFit()
                .frame(width: 160, height: 160)
            
            VStack{
                TextField("Email Address", text: $email)
                    .disableAutocorrection(true)
                    .autocapitalization(.none)
                    .padding()
                    .background(Color(.secondarySystemBackground))
                
                SecureField("Password", text: $password)
                    .disableAutocorrection(true)
                    .autocapitalization(.none)
                    .padding()
                    .background(Color(.secondarySystemBackground))
                
                Button(action: {
                    
                    guard !email.isEmpty, !password.isEmpty else {
                        return
                    }
                    
                    viewModel.signUp(email: email, password: password)
                    
                }, label:{
                    Text("Create Account")
                        .foregroundColor(Color.white)
                        .frame(width: 200, height: 50)
                        .cornerRadius(30)
                        .background(Color.blue)
                    
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
