//
//  ImageView.swift
//  Byngo
//
//  Created by felix on 16/11/2021.
//

import SwiftUI

struct ImageChangeView: View {
    
    @State private var image = UIImage()
    @State private var imageSheet = false
    
    @State private var imageChanged = false
    
    
    var body: some View {
        HStack {
            Spacer()
            if imageChanged {
                Image(uiImage: self.image)
                    .resizable()
                    .cornerRadius(50)
                    .frame(width: 120, height: 120)
                    .shadow(radius: 5)
                    .aspectRatio(contentMode: .fill)
                    .clipShape(Circle())
                    .offset(x: 15)
                    
            } else {
                Image("avatar3")
                    .resizable()
                    .cornerRadius(50)
                    .frame(width: 120, height: 120)
                    .shadow(radius: 5)
                    .aspectRatio(contentMode: .fill)
                    .clipShape(Circle())
                    .offset(x: 15)
            }
            Spacer()
            Text("Change Photo")
                .font(.headline)
                .frame(width: 180, height: 50)
                .background(LinearGradient(gradient: Gradient(colors: [Color(#colorLiteral(red: 0.3607843137, green: 0.1450980392, blue: 0.5529411765, alpha: 1)), Color(#colorLiteral(red: 0.262745098, green: 0.537254902, blue: 0.6352941176, alpha: 1))]), startPoint: .leading, endPoint: .trailing))
                .cornerRadius(16)
                .foregroundColor(.white)
                .padding(.horizontal, 20)
                .onTapGesture {
                    imageSheet = true
                    imageChanged = true
                }
                .padding(.horizontal, 20)
                .sheet(isPresented: $imageSheet) { ImagePicker(sourceType: .photoLibrary, imageSelected: self.$image)
                }
        }
    }
}


struct ImageChangeView_Previews: PreviewProvider {
    static var previews: some View {
        ImageChangeView()
            .previewLayout(.fixed(width: 400, height: 150))
    }
}
