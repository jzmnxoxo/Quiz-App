//
//  CategoryRow.swift
//  Byngo
//
//  Created by felix on 12/11/2021.
//

import SwiftUI

struct ByCategoryRow: View {
    var byCategory: ByCategory
    
    var body: some View {
        HStack {
            Text(byCategory.title)
                .font(.headline)
            Spacer()
            Text(String(byCategory.percent)+"%")
                .font(.headline)

        }
    }
}

struct ByCategoryRow_Previews: PreviewProvider {
    static let byCategoryData = ModelDataByCat()
    static var previews: some View {
        Group {
            ByCategoryRow(byCategory: byCategoryData.byCategories[0])
            ByCategoryRow(byCategory: byCategoryData.byCategories[1])
        }
        .previewLayout(.fixed(width: 300, height: 70))
    }
}
