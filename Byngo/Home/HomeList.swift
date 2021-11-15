//
//  HomeList.swift
//  Byngo
//
//  Created by felix on 15/11/2021.
//

import SwiftUI

struct HomeList: View {
    
    @StateObject private var homeData = ModelDataHome()
    
    var body: some View {
        NavigationView {
            List(homeData.homes) {home in
                NavigationLink(destination: HomeDetail(home: home)) {
                    HomeRow(home: home)
                }
            }
            .navigationTitle("Special Pick")
        }
    }
}

struct HomeList_Previews: PreviewProvider {
    static var previews: some View {
        HomeList()
            .environmentObject(ModelDataHome())
    }
}
