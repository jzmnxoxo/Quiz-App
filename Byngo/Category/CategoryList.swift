//
//  CategoryList.swift
//  CategoryApp
//
//  Created by iosuser on 12/11/2021.
//

import SwiftUI

struct CategoryList: View {
    
    @EnvironmentObject var categoryData: ModelDataCat
    
    var body: some View {
        NavigationView {
            List(categoryData.categories) {category in
                NavigationLink(destination: CategoryDetail(category: category)) {
                    CategoryRow(category: category)
                }
            }
            .navigationTitle("Category")
        }      
    }
}


struct CategoryList_Previews: PreviewProvider {
    static var previews: some View {
        CategoryList()
            .environmentObject(ModelDataCat())
    }
}
    
