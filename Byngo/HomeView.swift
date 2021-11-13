//
//  HomeView.swift
//  TabBar
//
//  Created by Jzmn on 13/11/2021.
//

import SwiftUI

struct HomeView: View {
    
    var body: some View {
        VStack{
            HStack{
                Text("Hi user!")
                    .font(.largeTitle)
                    .fontWeight(.semibold)
                    .multilineTextAlignment(.leading)
                    .padding([.top, .leading])
                Spacer()
            }
            Avatar()
            Spacer()
            Text("HOMEPAGE")
            Spacer()
            
        }

    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}

struct Avatar: View{
    var body: some View{
        Image("avatar2")
            .resizable()
            .frame(width: 60, height: 60)
            .offset(y: -30)
        

            
    }
    
}
