//
//  ContentView.swift
//  bleh
//
//  Created by iosuser on 17/11/2021.
//

import SwiftUI
import RealityKit

struct LocARView : View {
    var body: some View {
        Text("Star Ferry")
            .font(.title2)
            .fontWeight(.bold)
            .multilineTextAlignment(.leading)
        return ARViewContainer().edgesIgnoringSafeArea(.all)
    }
}

struct ARViewContainer: UIViewRepresentable {
    
    func makeUIView(context: Context) -> ARView {
        
        let arView = ARView(frame: .zero)
        
        // Load the "Box" scene from the "Experience" Reality File
        let boxAnchor = try! Experience.loadBox()
        boxAnchor.actions.rollingShipID.onAction = {
            entity in
            boxAnchor.notifications.randomRoll.post()
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
        LocARView()
    }
}
#endif
