//
//  datamodel-byCagetory.swift
//  Byngo
//
//  Created by felix on 12/11/2021.
//

import Foundation

class ModelDataByCat: ObservableObject {
    
    @Published var byCategories: [ByCategory] = []
    
    init() {
        let df = DateFormatter()
        df.dateFormat="d-MMM-yyyy"

        byCategories.append(ByCategory(id:0, title:"Biology"))
        byCategories.append(ByCategory(id:1, title:"Programming"))
        byCategories.append(ByCategory(id:2, title:"Math"))
        byCategories.append(ByCategory(id:3, title:"Chinese"))
        byCategories.append(ByCategory(id:4, title:"English"))

    }
}
