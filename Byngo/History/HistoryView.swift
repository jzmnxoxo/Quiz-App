//
//  HistoryView.swift
//  TabBar
//
//  Created by Jzmn on 13/11/2021.
//

import SwiftUI


struct HistoryView: View {
    @StateObject var histRouter:HistRouter
    var body: some View {
            GeometryReader{ geometry in
                VStack {
                    HStack {
                        HistIcon(histRouter: histRouter, assignedHist: .comments, width: geometry.size.width/5, height: geometry.size.height/28, systemIconName: "text.bubble", tabName: "Comments")
                            .padding(.trailing)
                        
                        HistIcon(histRouter: histRouter, assignedHist: .saved, width: geometry.size.width/5, height: geometry.size.height/28, systemIconName: "bookmark", tabName: "Saved")
                            .padding(.leading)
                    }
                    .frame(width: geometry.size.width, height: geometry.size.height/8)
                    .background(Color.clear.shadow(radius: 2))
                    
                    switch histRouter.currentHist {
                    case .comments:
                        CommentView()
                    case .saved:
                        SavedView()
                    }
                    Spacer()
                }
                .navigationTitle("History")
                .edgesIgnoringSafeArea(.bottom)
            }

                


            
    }
    
}

struct HistIcon: View {
    @StateObject var histRouter: HistRouter
    let assignedHist: Hist
    
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
            histRouter.currentHist = assignedHist
        }
        .foregroundColor(histRouter.currentHist == assignedHist ? Color ("TabBarHighlight"): .gray)
    }
}

struct HistoryView_Previews: PreviewProvider {
    static var previews: some View {
        HistoryView(histRouter: HistRouter())
            .environmentObject(ModelDataByCat())
    }
}
