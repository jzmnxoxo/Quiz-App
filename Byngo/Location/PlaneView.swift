//
//  PlaneView.swift
//  Byngo
//
//  Created by jzmn on 17/11/2021.
//

import SwiftUI
import RealityKit

struct PlaneView : View {
    var body: some View {
        Text("Hong Kong International Airport")
            .font(.title)
            .fontWeight(.bold)
            .multilineTextAlignment(.leading)
        return ARPlaneViewContainer().edgesIgnoringSafeArea(.all)
    }
}

struct ARPlaneViewContainer: UIViewRepresentable {
    
    func makeUIView(context: Context) -> ARView {
        
        let arView = ARView(frame: .zero)
        
        // Load the "Box" scene from the "Experience" Reality File
        let boxAnchor = try! Experience.loadPlane()
        boxAnchor.actions.rollingPlaneID.onAction = {
            entity in
            boxAnchor.notifications.randomPlane.post()
        }
        
        // Add the box anchor to the scene
        arView.scene.anchors.append(boxAnchor)
        
        return arView
        
    }
    
    func updateUIView(_ uiView: ARView, context: Context) {}
    
}

#if DEBUG
struct PlaneView_Previews : PreviewProvider {
    static var previews: some View {
        ShipView()
    }
}
#endif
