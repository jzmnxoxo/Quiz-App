//
//  HomeView.swift
//  TabBar
//
//  Created by Jzmn on 13/11/2021.
//

import SwiftUI

struct HomeView: View {
    @ObservedObject var defaults = Defaults()
    //let username = $userSettings.string("username")
    
    var body: some View {
        VStack{
            HStack(spacing: 17.0){
                Text("Hi "+defaults.username+"!")
                    .font(.largeTitle)
                    .fontWeight(.semibold)
                    .multilineTextAlignment(.leading)
                    .padding([.top, .leading])
                //Spacer()
               
                Spacer()
            }
            
            Avatar()
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
            .frame(width: 130, height: 130)
            .shadow(radius: 5)
            .offset(y: -50)
        

            
    }
    
}
