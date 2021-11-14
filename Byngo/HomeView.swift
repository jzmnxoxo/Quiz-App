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
            HStack(spacing: 17.0){
                Text("Hi user!")
                    .font(.largeTitle)
                    .fontWeight(.semibold)
                    .multilineTextAlignment(.leading)
                    .padding([.top, .leading])
                //Spacer()
                Avatar()
                Spacer()
            }
            
            
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
        Image("avatar3")
            .resizable()
            .frame(width: 100, height: 100)
            .shadow(radius: 5)
            //.offset(y: -65)
        

            
    }
    
}
