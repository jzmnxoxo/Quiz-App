//
//  CatComfirem.swift
//  Byngo
//
//  Created by iosuser on 17/11/2021.
//

import SwiftUI

struct CatConfirm: View {
    
    @EnvironmentObject var categoryData: ModelDataCat
    @Environment(\.presentationMode) var presentationMode
    @State var category: Category
    
    let Difficulty = ["Beginner", "Intermediate", "Advanced"]
    
    @State var selected: Int
    
    @State var StartQuiz: Bool = false
    
    var body: some View {
        
        if !StartQuiz {
            VStack {
                
                Text(category.title)
                    .font(.largeTitle)
                    .bold()
                    .padding(10)
                
                Text("Difficulty: \(Difficulty[selected])")
                    .font(.title)
                    .padding(55)
                
                Text("2 Qs")
                    .font(.title)
                    .padding(50)
                Spacer()
                
                Button {
                    StartQuiz.toggle()
                } label: {
                    ZStack {
                        Rectangle()
                            .frame(width: 350, height: 70)
                            .foregroundColor(.gray)
                            .opacity(0.1)
                            .cornerRadius(10)
                        Text("START!")
                            .font(.title)
                            .foregroundColor(.black)
                            .bold()
                            .multilineTextAlignment(.center)
                    }
                }
                Spacer()
                Spacer()
            }
        } else {
            QuestionView(QuizCat: category.title)
        }
    }
}

//struct CatConfirm_Previews: PreviewProvider {
//
//    static var categoryData = ModelDataCat()
//
//    static var previews: some View {
//        CatConfirm(category: categoryData.categories[0], selected: $selected)
//            .environmentObject(ModelDataCat())
//    }
//}
