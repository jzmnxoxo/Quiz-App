//
//  ContentView.swift
//  TabBar
//
//  Created by Jzmn on 13/11/2021.
//

import SwiftUI


struct ContentView: View {
    
    @StateObject var viewRouter: ViewRouter
    
    var body: some View {
        GeometryReader{ geometry in
            VStack{
                Spacer()
                switch viewRouter.currentPage{
                case .home:
                    HomeView()
                case .user:
                    UserView()
                case .category:
                    CategoryList()
                case .history:
                    Text("History")
                case .settings:
                    SettingsView()
                }
                Spacer()
                HStack{
                    TabBarIcon(viewRouter: viewRouter, assignedPage: .user, width: geometry.size.width/5, height: geometry.size.height/28, systemIconName: "person.crop.circle", tabName: "Account")
                    TabBarIcon(viewRouter: viewRouter, assignedPage: .category, width: geometry.size.width/5, height: geometry.size.height/28, systemIconName: "books.vertical", tabName: "Categories")
                    
                    ZStack{
                        Circle()
                            .foregroundColor(.white)
                            .frame(width: geometry.size.width/7, height: geometry.size.width/7)
                            .shadow(radius: 4)
                        Image(systemName: "house.circle.fill")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: geometry.size.width/5, height: geometry.size.width/5)
                            .foregroundColor(Color("DarkPurple"))
                    }
                    .onTapGesture {
                        viewRouter.currentPage = .home
                    }
                    .offset(y: -geometry.size.height/8/3)
//                    TabBarIcon(width: geometry.size.width/5, height: geometry.size.height/28, systemIconName: "plus", tabName: "Add")
                    TabBarIcon(viewRouter: viewRouter, assignedPage: .history, width: geometry.size.width/5, height: geometry.size.height/28, systemIconName: "clock.arrow.circlepath", tabName: "History")
                    TabBarIcon(viewRouter: viewRouter, assignedPage: .settings,width: geometry.size.width/5, height: geometry.size.height/28, systemIconName: "gearshape", tabName: "Settings")
                    

                }
                .frame(width: geometry.size.width, height: geometry.size.height/8)
                .background(Color("TabBarBackground").shadow(radius: 2))
            }
            .edgesIgnoringSafeArea(.bottom)
        }

            
    }
}

struct TabBarIcon: View {
    @StateObject var viewRouter: ViewRouter
    let assignedPage: Page
    
    let width,height: CGFloat
    let systemIconName, tabName: String
    
    var body: some View {
        VStack{
            Image(systemName: systemIconName)
                .resizable()
                .aspectRatio( contentMode: .fit)
                .frame(width: width, height: height)
                .padding(.top,10)
            Text(tabName)
                .font(.footnote)
            Spacer()
        }
        .padding(.horizontal,-4)
        .onTapGesture {
            viewRouter.currentPage = assignedPage
        }
        .foregroundColor(viewRouter.currentPage == assignedPage ? Color ("TabBarHighlight"): .gray)
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(viewRouter: ViewRouter())
    }
}

