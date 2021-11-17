import SwiftUI


struct LocTriviaView: View {
    @StateObject var locRouter:LocRouter
    @ObservedObject var locationManager = LocationManager()
    @ObservedObject var choice = Choice()
    var body: some View {
            GeometryReader{ geometry in
                VStack {
                    HStack {
                        LocIcon(locRouter: locRouter, assignedLoc: .threeD, width: geometry.size.width/5, height: geometry.size.height/28, systemIconName: "scale.3d", tabName: "3D")
                        LocIcon(locRouter: locRouter, assignedLoc: .ar, width: geometry.size.width/5, height: geometry.size.height/28, systemIconName: "wand.and.stars", tabName: "AR")
                    }
                    .frame(width: geometry.size.width, height: geometry.size.height/8)
                    .background(Color.clear.shadow(radius: 2))
                    
                    switch locRouter.currentLoc {
                    case .threeD:
                        ThreeDView()
                    case .ar:
                        if(choice.choice == 0){
                            ShipView()
                        }else if (choice.choice == 1){
                            PlaneView()
                        }else if (choice.choice == 2){
                            PostView()
                        }
                    }
                    Spacer()
                }
                .navigationTitle("LocaTrivia📍")
                .edgesIgnoringSafeArea(.bottom)
            }

                


            
    }
    
}

struct LocIcon: View {
    @StateObject var locRouter: LocRouter
    let assignedLoc: Loc
    
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
            locRouter.currentLoc = assignedLoc
        }
        .foregroundColor(locRouter.currentLoc == assignedLoc ? Color ("TabBarHighlight"): .gray)
    }
}
//
struct LocView_Previews: PreviewProvider {
    static var previews: some View {
        LocTriviaView(locRouter: LocRouter())
            .environmentObject(LocationManager())
    }
}
