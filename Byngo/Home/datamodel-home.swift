//
//  datamodel-home.swift
//  Byngo
//
//  Created by felix on 15/11/2021.
//

import Foundation

class ModelDataHome: ObservableObject {
    
    @Published var homes:[Home] = []
    
    init() {
        let df = DateFormatter()
        df.dateFormat="d-MMM-yyyy"

        homes.append(Home(id:0, title:"Daily Mission", desc:""))
        homes.append(Home(id:1, title:"Swift Basic", desc:""))
        homes.append(Home(id:2, title:"Hamlet", desc:""))
        homes.append(Home(id:3, title:"Ancient Greek", desc:""))

    }
}
