//
//  HomeView.swift
//  TabBar
//
//  Created by Jzmn on 13/11/2021.
//

import SwiftUI

struct HomeView: View {
    @ObservedObject var userSettings = UserSettings()
    //let username = $userSettings.string("username")
    
    @EnvironmentObject var homeData: ModelDataHome
    
    var body: some View {
        
        GeometryReader{ geometry in
            VStack{
                HStack(spacing: 17.0){
                    Text("Hi "+userSettings.username+"!")
                        .font(.largeTitle)
                        .fontWeight(.semibold)
                        .multilineTextAlignment(.leading)
                        .padding([.top, .leading])
                    //Spacer()
                   
                    Spacer()
                }
                
                Avatar()
                
                NavigationView {
                    List(homeData.homes) {home in
                        NavigationLink(destination: HomeDetail(home: home)) {
                            HomeRow(home: home)
                        }
                    }
                    .navigationTitle("Special Pick")
                }
                 
            }
            .edgesIgnoringSafeArea(.bottom)
        }
        


    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
            .environmentObject(ModelDataHome())
    }
}

struct Avatar: View {
    var body: some View {
        Image("avatar3")
            .resizable()
            .frame(width: 120, height: 120)
            .shadow(radius: 5)
            .offset(y: -30)
    }
}