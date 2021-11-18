//
//  ShipView.swift
//  Byngo
//
//  Created by jazzie on 17/11/2021.
//

import SwiftUI
import RealityKit

struct ShipView : View {
    var body: some View {
        Text("Star Ferry")
            .font(.title)
            .fontWeight(.bold)
            .multilineTextAlignment(.leading)
        return ARShipViewContainer().edgesIgnoringSafeArea(.all)
    }
}

struct ARShipViewContainer: UIViewRepresentable {
    
    func makeUIView(context: Context) -> ARView {
        
        let arView = ARView(frame: .zero)
        
        // Load the "Box" scene from the "Experience" Reality File
        let boxAnchor = try! Experience.loadShip()
        boxAnchor.actions.rollingShipID.onAction = {
            entity in
            boxAnchor.notifications.randomShip.post()
        }
        
        // Add the box anchor to the scene
        arView.scene.anchors.append(boxAnchor)
        
        return arView
        
    }
    
    func updateUIView(_ uiView: ARView, context: Context) {}
    
}

#if DEBUG
struct LocARView_Previews : PreviewProvider {
    static var previews: some View {
        ShipView()
    }
}
#endif
