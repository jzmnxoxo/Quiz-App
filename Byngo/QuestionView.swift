//
//  QuestionView.swift
//  Byngo
//
//  Created by felix on 16/11/2021.
//

import SwiftUI



struct QuestionView: View {
    
    @EnvironmentObject var categoryData: ModelDataCat
    @EnvironmentObject var homeData: ModelDataHome
    
    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
    }
}

struct QuestionView_Previews: PreviewProvider {
    static var previews: some View {
        QuestionView()
    }
}
