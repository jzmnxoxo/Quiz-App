//
//  ByCategoryDetail.swift
//  Byngo
//
//  Created by felix on 16/11/2021.
//

import SwiftUI

struct ByCategoryDetail: View {
    
    @EnvironmentObject var byCategoryData: ModelDataByCat
    @Environment(\.presentationMode) var presentationMode
    @State var byCategory: ByCategory
    
    var byCategoryIndex: Int {
        byCategoryData.byCategories.firstIndex(where:{ $0.id == byCategory.id}) ?? 0
    }
    
    var body: some View {
        
        VStack(alignment: .leading, spacing: 0.0) {
            Text(byCategory.title)
                .font(.headline)
                .bold()
            
            Text("Percentage: ")

        }
        .padding()
        .navigationBarBackButtonHidden(true)
        .navigationBarItems(
            leading: Button("< Return") {
                self.presentationMode.wrappedValue.dismiss()
        })
        
    }
}


struct ByCategoryDetail_Previews: PreviewProvider {
    static let byCategoryData = ModelDataByCat()
    
    static var previews: some View {
        ByCategoryDetail(byCategory: byCategoryData.byCategories[0])
            .environmentObject(ModelDataByCat())
    }
}
