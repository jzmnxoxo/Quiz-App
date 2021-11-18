//
//  HomeRow.swift
//  Byngo
//
//  Created by felix on 15/11/2021.
//

import SwiftUI

struct HomeRow: View {
    var home: Home
    
    var body: some View {
        HStack {
            Text(home.title)
                .font(.headline)
            
            Text(home.desc)
                .font(.body)
                .foregroundColor(Color.gray)
        }
    }
}

struct HomeRow_Previews: PreviewProvider {
    static let homeData = ModelDataHome()
    static var previews: some View {
        Group {
            HomeRow(home: homeData.homes[0])
            HomeRow(home: homeData.homes[1])
        }
        .previewLayout(.fixed(width: 300, height: 70))
    }
}
