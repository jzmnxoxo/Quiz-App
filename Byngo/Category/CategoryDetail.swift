//
//  CategoryDetail.swift
//  CategoryApp
//
//  Created by iosuser on 12/11/2021.
//

import SwiftUI

struct CategoryDetail: View {
    
    @EnvironmentObject var categoryData: ModelDataCat
    @Environment(\.presentationMode) var presentationMode
    @State var category: Category
    
    @State var selectedDifficulty: Int = 1
    
    var categoryIndex: Int {
        categoryData.categories.firstIndex(where: {$0.id==category.id}) ?? 0
    }
    
    var body: some View {
        VStack(alignment: .leading, spacing: 0.0) {
            Button("BEGINNER") {
                selectedDifficulty = 1
            }
            
            Button("INTERMEDIATE") {
                selectedDifficulty = 2
            }
            
            Button("ADVANCED") {
                selectedDifficulty = 3
            }
            
            
//            TextField("Title", text: $categoryData.categories[categoryIndex].title)
//            TextField("Desc", text: $categoryData.categories[categoryIndex].desc)
        }
        .padding()
    }
}

struct CategoryDetail_Previews: PreviewProvider {
    static var categoryData = ModelDataCat()
    
    static var previews: some View {
        CategoryDetail(category: categoryData.categories[0])
            .environmentObject(ModelDataCat())
    }
}
