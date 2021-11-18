//
//  AnswerView.swift
//  Byngo
//
//  Created by Jzmn on 18/11/2021.
//

import SwiftUI

struct AnswerView: View {
    var body: some View {
        VStack{
            Text("You are correct! ")
                .font(.title)
            Spacer()
            Text("Answer: C. \nKidney is not a part of the circulatory system, but it plays an important role in the urinary system!")
            Spacer()
        }
        
    }
}

struct AnswerView_Previews: PreviewProvider {
    static var previews: some View {
        AnswerView()
    }
}
