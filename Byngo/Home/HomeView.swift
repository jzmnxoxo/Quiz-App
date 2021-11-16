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
    
    @State var showAlert: Bool = false
    @State var showLocTrivia: Bool = false
    @State var venueLocation = CLLocation(latitude: 22.283, longitude: 114.1371)
    
    func checkLocation() {
        let radius: Double = 10
        let distance = locationManager.userLocation.distance(from: venueLocation)
        if (distance < radius ) {
            showAlert = true
        }
    }
    
    
    var body: some View {
        
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
        NavigationLink(destination: LocTriviaView(), isActive: $showLocTrivia) {
            EmptyView()
        }
        .alert(isPresented: $showAlert) {
            Alert(title: Text("Surprise!"),
                  message: Text("You reached a LocaTrivia Spot! Wanna know more about this place?"),
                  primaryButton: .default(Text("Sure!"), action: {self.showLocTrivia = true}),
                  secondaryButton: .cancel()
            )
        }
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


