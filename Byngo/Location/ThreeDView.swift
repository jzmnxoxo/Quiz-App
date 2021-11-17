//
//  ThreeDView.swift
//  Byngo
//
//  Created by jzmn on 16/11/2021.
//

import SwiftUI
import SceneKit

struct ThreeDView:View{
    @ObservedObject var locationManager = LocationManager()
    @ObservedObject var choice = Choice()
    
    @State var models = [
        Model(id: 0, name:"Star Ferry", modelName: "ferry.usdz",details:"Star Ferry boats have been transporting passengers from Hong Kong Island to Kowloon and back for over a century and offer a unique vantage point on the city’s beautiful harbour."),
        Model(id: 1, name: "Hong Kong International Airport", modelName: "plane.usdz", details: "Designed by acclaimed British architect Lord Norman Foster, this awesome state-of-the-art structure completed in 1998 was voted one of the Top 10 Construction Achievements of the 20th Century by the Construction Industry Manufacturers Association. Located at Chek Lap Kok on Lantau Island, Hong Kong International Airport is linked to the city’s urban areas via an impressive chain of highways, railways and bridges. "),
        Model(id: 2, name: "Hong Kong General Post Office", modelName: "post.usdz", details: "The General Post Office is the headquarters of Hongkong Post. Built in 1976, it is located at Connaught Place, Central, Hong Kong. The office was adjacent to the former Star Ferry Pier, and it is adjacent to Jardine House and the International Finance Centre")]
    
    
    
    var body: some View{
        
        VStack{
            SceneView(scene: SCNScene(named: models[choice.choice].modelName), options: [.autoenablesDefaultLighting,.allowsCameraControl])
            
                .frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height/2)
            
            VStack(alignment: .leading, spacing: 15, content:{
                Text("About")
                    .font(.title2)
                    .fontWeight(.bold)
                ScrollView{
                    Text(models[choice.choice].details)
                }
               
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


