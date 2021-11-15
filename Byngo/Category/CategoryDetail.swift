//
//  CategoryDetail.swift
//  CategoryApp
//
//  Created by iosuser on 12/11/2021.
//

import SwiftUI

struct CategoryDetail: View {
    
    @EnvironmentObject var categoryData: ModelData
    @Environment(\.presentationMode) var presentationMode
    @State var category: Category
    
    var categoryIndex: Int {
        categoryData.categories.firstIndex(where: {$0.id==category.id}) ?? 0
    }
    
    var body: some View {
        VStack(alignment: .leading, spacing: 0.0) {
            TextField("Title", text: $categoryData.categories[categoryIndex].title)
            TextField("Desc", text: $categoryData.categories[categoryIndex].desc)
        }
        .padding()
        .navigationBarBackButtonHidden(true)
        .navigationBarItems(
            leading:
                Button("Back") {
                    self.presentationMode.wrappedValue.dismiss()
                },
            trailing:
                Button("Undo") {
                    categoryData.categories[categoryIndex]=category
                }
        )
    }
}

struct CategoryDetail_Previews: PreviewProvider {
    static var categoryData = ModelData()
    
    static var previews: some View {
        CategoryDetail(category: categoryData.categories[0])
            .environmentObject(ModelData())
    }
}
