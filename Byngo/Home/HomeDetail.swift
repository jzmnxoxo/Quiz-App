//
//  HomeDetail.swift
//  Byngo
//
//  Created by felix on 15/11/2021.
//

import SwiftUI

struct HomeDetail: View {
    
    @StateObject private var homeData = ModelDataHome()
    @Environment(\.presentationMode) var presentationMode
    @State var home: Home
    
    var HomeIndex: Int {
        homeData.homes.firstIndex(where: {$0.id==home.id}) ?? 0
    }
    
    var body: some View {
        VStack(alignment: .leading, spacing: 0.0) {
            TextField("Title", text: $homeData.homes[HomeIndex].title)
            TextField("Desc", text: $homeData.homes[HomeIndex].desc)
        }
        .padding()
    }
}

struct HomeDetail_Previews: PreviewProvider {
    static var homeData = ModelDataHome()
    
    static var previews: some View {
        HomeDetail(home: homeData.homes[0])
            .environmentObject(ModelDataHome())
    }
}
