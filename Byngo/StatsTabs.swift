////
////  ContentView.swift
////  TabBar
////
////  Created by Jzmn on 13/11/2021.
////
//
//import SwiftUI
//
//
//struct StatsTab {
//    var title: String
//}
//
//struct StatsTabs: View {
//    var fixed = true
//    var tabs: [StatsTab]
//    var geoWidth: CGFloat
//    @Binding var selectedTab: Int
//
//    var body: some View {
//        ScrollView(.horizontal, showsIndicators: false) {
//            ScrollViewReader { proxy in
//                VStack(spacing: 0) {
//                    HStack(spacing: 0) {
//                        ForEach(0 ..< tabs.count, id: \.self) { row in
//                            Button(action: {
//                                withAnimation {
//                                    selectedTab = row
//                                }
//                            }, label: {
//                                VStack(spacing: 0) {
//
//                                    Text(tabs[row].title)
//                                        .font(Font.system(size: 18, weight: .semibold))
//                                        .foregroundColor(Color.white)
//                                        .padding(EdgeInsets(top: 10, leading: 3, bottom: 10, trailing: 15))
//                                    
//                                    // Bar Indicator
//                                    Rectangle().fill(selectedTab == row ? Color.white : Color.clear)
//                                        .frame(height: 3)
//                                }.fixedSize()
//                            })
//                                .accentColor(Color.white)
//                                .buttonStyle(PlainButtonStyle())
//                        }
//                    }
//                    .onChange(of: selectedTab) { target in
//                        withAnimation {
//                            proxy.scrollTo(target)
//                        }
//                    }
//                }
//            }
//        }
//        .frame(height: 55)
//        .onAppear(perform: {
//            UIScrollView.appearance().backgroundColor = UIColor(#colorLiteral(red: 0.6196078431, green: 0.1098039216, blue: 0.2509803922, alpha: 1))
//            UIScrollView.appearance().bounces = fixed ? false : true
//        })
//        .onDisappear(perform: {
//            UIScrollView.appearance().bounces = true
//        })
//    }
//}
//
//struct StatsTabs_Previews: PreviewProvider {
//    static var previews: some View {
//        StatsTabs(fixed: true,
//             tabs: [.init(title: "Overall"),
//                    .init(title: "By Category")],
//             geoWidth: 375,
//             selectedTab: .constant(0))
//    }
//}
