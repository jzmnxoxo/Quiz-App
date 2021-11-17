//
//  SwiftUIView.swift
//  Byngo
//
//  Created by iosuser on 16/11/2021.
//

import SwiftUI
import SceneKit

struct LocTriviaView:View{
    @State var models = [
        Model(id: 0, name:"Ferry", modelName: "ferry.usdz",details:"This is the Star Ferry, one of Hong Kong's most iconic transports")]
    
    @State var index = 0
    
    var body: some View{
        
        VStack{
            SceneView(scene: SCNScene(named: models[index].modelName), options: [.autoenablesDefaultLighting,.allowsCameraControl])
            
                .frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height/2)
            
            VStack(alignment: .leading, spacing: 15, content:{
                Text("About")
                    .font(.title2)
                    .fontWeight(.bold)
                Text(models[index].details)
            })
                .padding(.horizontal)
            
            Spacer(minLength: 0)
            
        }
        
    }
    struct Model:Identifiable{
        var id: Int
        var name: String
        var modelName: String
        var details: String
    }
    
}


