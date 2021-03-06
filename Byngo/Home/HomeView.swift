//
//  HomeView.swift
//  TabBar
//
//  Created by Jzmn on 13/11/2021.
//

import SwiftUI
import MapKit

struct HomeView: View {
    
    @ObservedObject var userSettings = UserSettings()
    @ObservedObject var locationManager = LocationManager()
    @StateObject private var homeData = ModelDataHome()
    
    @State var showLocTrivia: Bool = false

    //var timer:Timer?
    
    
    
    var body: some View {

        let timer = Timer.scheduledTimer(withTimeInterval: 1, repeats: false) { (timer) in
            locationManager.checkLocation()}
        
        GeometryReader{ geometry in
            VStack{
                
                Avatar()
                
                Text("Special Picks")
                    .font(.title)
                    .fontWeight(.semibold)
                    .multilineTextAlignment(.leading)

                List(homeData.homes) {home in
                    NavigationLink(destination: HomeDetail(home: home)) {
                        HomeRow(home: home)
                    }
                }
                .navigationTitle("Hi " + userSettings.username + "!")
                
                
            }
            .edgesIgnoringSafeArea(.bottom)
        }
        NavigationLink(destination: LocTriviaView(locRouter: LocRouter()), isActive: $showLocTrivia) {
            EmptyView()
        }
        .alert(isPresented: $locationManager.showAlert) {
            Alert(title: Text("Surprise!"),
                  message: Text("You reached a LocaTrivia Spot! Wanna know more about this place?"),
                  primaryButton: .default(Text("Sure!"), action: {self.showLocTrivia = true;locationManager.tmp2=false}),
                  secondaryButton: .cancel(Text("Nah"),action: {locationManager.tmp2=false})
            )
        }
        .onAppear(perform: timer.invalidate)
    }
       
}


struct Avatar: View {
    var body: some View {
        Image("avatar3")
            .resizable()
            .frame(width: 120, height: 120)
            .shadow(radius: 5)
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
            .environmentObject(ModelDataHome())
    }
}


