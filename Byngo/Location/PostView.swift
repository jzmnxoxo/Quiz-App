//
//  PostView.swift
//  Byngo
//
//  Created by jzmn on 17/11/2021.
//

import SwiftUI
import RealityKit

struct PostView : View {
    var body: some View {
        Text("Post Office")
            .font(.title)
            .fontWeight(.bold)
            .multilineTextAlignment(.leading)
        return ARPostViewContainer().edgesIgnoringSafeArea(.all)
    }
}

struct ARPostViewContainer: UIViewRepresentable {
    
    func makeUIView(context: Context) -> ARView {
        
        let arView = ARView(frame: .zero)
        
        // Load the "Box" scene from the "Experience" Reality File
        let boxAnchor = try! Experience.loadPost()
        boxAnchor.actions.rollingPostID.onAction = {
            entity in
            boxAnchor.notifications.randomPost.post()
        }
        
        // Add the box anchor to the scene
        arView.scene.anchors.append(boxAnchor)
        
        return arView
        
    }
    
    func updateUIView(_ uiView: ARView, context: Context) {}
    
}

#if DEBUG
struct PostView_Previews : PreviewProvider {
    static var previews: some View {
        ShipView()
    }
}
#endif
