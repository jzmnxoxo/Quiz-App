//
//  QuestionView.swift
//  Byngo
//
//  Created by iosuser on 17/11/2021.
//

import SwiftUI

struct QuestionView: View {
    
    @State var QuizCat: String
    @State var correct:Bool
    @State private var showingAnswer = false

    
//    func checkCorrect(){
//        if (correct = true){
//            
//        }
//    }
    var body: some View {
        VStack{
            Text(QuizCat)
                .font(.title)
            Text("Q: Which of the following is not a part of the circulatory system?")                   .font(.title2)
            Button(action:{
            }, label: {
                Text("A. Aorta")
                    .foregroundColor(Color.white)
                    .frame(width: 200, height: 50)
                    .background(Color.purple)
                .cornerRadius(15)
            })
            Button(action:{
            }, label: {
                Text("B. Heart")
                    .foregroundColor(Color.white)
                    .frame(width: 200, height: 50)
                    .background(Color.purple)
                .cornerRadius(15)
            })
            Button(action:{
                correct.toggle()
            }, label: {
                Text("C. Kidney")
                    .foregroundColor(Color.white)
                    .frame(width: 200, height: 50)
                    .background(Color.purple)
                .cornerRadius(15)
            })
                .sheet(isPresented: $correct) {
                    AnswerView()
                }
            Button(action:{
            }, label: {
                Text("D. Venae Cavae")
                    .foregroundColor(Color.white)
                    .frame(width: 200, height: 50)
                    .background(Color.purple)
                .cornerRadius(15)
            })
        }
        
    }
}

struct QuestionView_Previews: PreviewProvider {
    static var previews: some View {
        QuestionView(QuizCat: "Math",correct:false)
    }
}
