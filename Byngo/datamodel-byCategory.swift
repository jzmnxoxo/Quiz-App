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

        byCategories.append(ByCategory(id:0, title:"Biology", percent:87))
        byCategories.append(ByCategory(id:1, title:"Programming", percent:68))
        byCategories.append(ByCategory(id:2, title:"Math", percent:42))
        byCategories.append(ByCategory(id:3, title:"Chinese", percent:73))
        byCategories.append(ByCategory(id:4, title:"English", percent:98))

    }
}
