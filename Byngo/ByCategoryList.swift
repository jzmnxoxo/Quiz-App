//
//  ByCategoryList.swift
//  Byngo
//
//  Created by felix on 12/11/2021.
//

import SwiftUI

struct ByCategoryList: View {
    
    @EnvironmentObject var byCategoryData: ModelDataByCat
    
    var body: some View {
        VStack {
            List(byCategoryData.byCategories) {byCategory in
//                NavigationLink(destination: ByCategoryDetail(byCategory: byCategory)){
                    ByCategoryRow(byCategory: byCategory)
//                }
//                Section(header: Text("")) {
//                    ByCategoryRow(byCategory: byCategory)
//                }
            }
            
            .navigationBarTitle("ByCategory")
        }

    }
}


struct ByCategoryList_Previews: PreviewProvider {
    static var previews: some View {
        ByCategoryList()
            .environmentObject(ModelDataByCat())
    }
}
    
