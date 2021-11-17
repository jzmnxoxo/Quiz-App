//
//  QuestionView.swift
//  Byngo
//
//  Created by iosuser on 17/11/2021.
//

import SwiftUI

struct QuestionView: View {
    
    @State var QuizCat: String
    
    
    var body: some View {
        Text(QuizCat)
    }
}

struct QuestionView_Previews: PreviewProvider {
    static var previews: some View {
        QuestionView(QuizCat: "Math")
    }
}
