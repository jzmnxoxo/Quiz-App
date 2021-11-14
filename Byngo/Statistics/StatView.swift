import SwiftUI


struct StatsView: View {
    @State private var selectedTab: Int = 0

    let tabs: [Tab] = [
        .init(title: "Overall"),
        .init( title: "By Category")
    ]

    init() {
        UINavigationBar.appearance().barTintColor = UIColor(#colorLiteral(red: 0.737254902, green: 0.1294117647, blue: 0.2941176471, alpha: 1))
        UINavigationBar.appearance().titleTextAttributes = [.foregroundColor: UIColor.white]
        UINavigationBar.appearance().isTranslucent = false
    }

    var body: some View {
        NavigationView {
            GeometryReader { geo in
                VStack(spacing: 0) {
                    // Tabs
                    StatsTab(tabs: tabs, geoWidth: geo.size.width, selectedTab: $selectedTab)

                    // Views
                    TabView(selection: $selectedTab,
                            content: {
                                OverallView()
                                    .tag(0)
                                ByCategoryView()
                                    .tag(1)
                            })
                        .tabViewStyle(PageTabViewStyle(indexDisplayMode: .never))
                }
                .foregroundColor(Color(#colorLiteral(red: 0.737254902, green: 0.1294117647, blue: 0.2941176471, alpha: 1)))
                .navigationBarTitleDisplayMode(.inline)
                .navigationTitle("TabsSwiftUIExample")
                .ignoresSafeArea()
            }
        }
    }
}

struct StatsView_Previews: PreviewProvider {
    static var previews: some View {
        StatsView()
    }
}