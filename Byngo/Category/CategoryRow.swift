//
//  CategoryRow.swift
//  CategoryApp
//
//  Created by iosuser on 12/11/2021.
//

import SwiftUI

struct CategoryRow: View {
    var category: Category
    
    var body: some View {
        HStack {
            Text(category.title)
                .font(.headline)
            
            
            
        }
    }
}

struct CategoryRow_Previews: PreviewProvider {
    static let categoryData = ModelDataCat()
    static var previews: some View {
        Group {
            CategoryRow(category: categoryData.categories[0])
            CategoryRow(category: categoryData.categories[1])
        }
        .previewLayout(.fixed(width: 300, height: 70))
    }
}
