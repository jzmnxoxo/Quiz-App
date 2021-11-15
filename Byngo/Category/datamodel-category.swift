//
//  datamodel.swift
//  CategoryApp
//
//  Created by iosuser on 12/11/2021.
//

import Foundation

class ModelDataCat: ObservableObject {
    
    @Published var categories:[Category] = []
    
    init() {
        let df = DateFormatter()
        df.dateFormat="d-MMM-yyyy"

        categories.append(Category(id:0, title:"Biology", desc:""))
        categories.append(Category(id:1, title:"Programming", desc:""))
        categories.append(Category(id:2, title:"Math", desc:""))

    }
}
