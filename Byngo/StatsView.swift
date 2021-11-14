import SwiftUI


struct StatsView: View {
    @StateObject var statRouter:StatRouter
    var body: some View {
        NavigationView{
            GeometryReader{ geometry in
                VStack{
                    HStack{
                        StatIcon(statRouter: statRouter, assignedStat: .overall, width: geometry.size.width/5, height: geometry.size.height/28, systemIconName: "globe.americas", tabName: "Overall")
                        StatIcon(statRouter: statRouter, assignedStat: .category, width: geometry.size.width/5, height: geometry.size.height/28, systemIconName: "books.vertical", tabName: "By Category")
                    }
                    .frame(width: geometry.size.width, height: geometry.size.height/8)
                    .background(Color.clear.shadow(radius: 2))
                    Spacer()
                    switch statRouter.currentStat{
                    case .overall:
                        OverallView()
                    case .category:
                        ByCategoryView()
                    }
                    Spacer()
                }
                .edgesIgnoringSafeArea(.bottom)
            }
            .navigationTitle("Statistics")
        }
                


            
    }
    
}

struct StatIcon: View {
    @StateObject var statRouter: StatRouter
    let assignedStat: Stat
    
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
            statRouter.currentStat = assignedStat
        }
        .foregroundColor(statRouter.currentStat == assignedStat ? Color ("TabBarHighlight"): .gray)
    }
}
//        NavigationView {
//            GeometryReader { geo in
//                VStack(spacing: 0) {
//                    // Tabs
//                    StatsTab(tabs: tabs, geoWidth: geo.size.width, selectedTab: $selectedTab)
//
//                    // Views
//                    TabView(selection: $selectedTab,
//                            content: {
//                                OverallView()
//                                    .tag(0)
//                                ByCategoryView()
//                                    .tag(1)
//                            })
//                        .tabViewStyle(PageTabViewStyle(indexDisplayMode: .never))
//                }
//                .foregroundColor(Color(#colorLiteral(red: 0.737254902, green: 0.1294117647, blue: 0.2941176471, alpha: 1)))
//                .navigationBarTitleDisplayMode(.inline)
//                .navigationTitle("TabsSwiftUIExample")
//                .ignoresSafeArea()
//            }
//        }
//    }
//}
//
struct StatsView_Previews: PreviewProvider {
    static var previews: some View {
        StatsView(statRouter: StatRouter())
    }
}
