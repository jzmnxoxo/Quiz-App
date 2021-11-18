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


        categories.append(Category(id:0, title:"Biology"))
        categories.append(Category(id:1, title:"Programming"))
        categories.append(Category(id:2, title:"Math"))
        categories.append(Category(id:3, title:"Chinese"))
        categories.append(Category(id:4, title:"English"))


    }
}
