//
//  CategoryDetail.swift
//  CategoryApp
//
//  Created by iosuser on 12/11/2021.
//

import SwiftUI
import MapKit

struct CategoryDetail: View {
    
    @EnvironmentObject var categoryData: ModelDataCat
    @Environment(\.presentationMode) var presentationMode
    @State var category: Category
    
    @State var selectedDifficulty: Int = 1
    @State var startedQuiz: Bool = false
    
    var categoryIndex: Int {
        categoryData.categories.firstIndex(where: {$0.id==category.id}) ?? 0
    }
    
    var body: some View {
        VStack(alignment: .leading, spacing: 0.0) {
//            ZStack {
//
//                Rectangle()
//                    .frame(width: 350, height: 70)
//                    .foregroundColor(.gray)
//                    .cornerRadius(10)
//                Button("BEGINNER") {
//                    selectedDifficulty = 1
//                    startedQuiz = true
//                }
//            }
            //beginner
            Button( action: {
                selectedDifficulty = 1
                startedQuiz = true
            }) {
                ZStack {
                    Rectangle()
                        .frame(width: 350, height: 70)
                        .foregroundColor(.gray)
                        .opacity(0.1)
                        .cornerRadius(10)
                    Text("BEGINNER")
                        .font(.title)
                        .foregroundColor(.black)
                        .bold()
                        .multilineTextAlignment(.center)
                    
                }
            }
            
            
            //intermediate
            Button( action: {
                selectedDifficulty = 2
                startedQuiz = true
            }) {
                ZStack {
                    Rectangle()
                        .frame(width: 350, height: 70)
                        .foregroundColor(.gray)
                        .opacity(0.1)
                        .cornerRadius(10)
                    Text("INTERMEDIATE")
                        .font(.title)
                        .foregroundColor(.black)
                        .bold()
                        .multilineTextAlignment(.center)
                    
                }
            }
            
            
            //advanced
            Button( action: {
                selectedDifficulty = 3
                startedQuiz = true
            }) {
                ZStack {
                    Rectangle()
                        .frame(width: 350, height: 70)
                        .foregroundColor(.gray)
                        .opacity(0.1)
                        .cornerRadius(10)
                    Text("ADVANCED")
                        .font(.title)
                        .foregroundColor(.black)
                        .bold()
                        .multilineTextAlignment(.center)
                    
                }
            }
            
            
            
            
            
//            TextField("Title", text: $categoryData.categories[categoryIndex].title)
//            TextField("Desc", text: $categoryData.categories[categoryIndex].desc)
        }
        .padding()
    }
}

struct CategoryDetail_Previews: PreviewProvider {
    static var categoryData = ModelDataCat()
    
    static var previews: some View {
        CategoryDetail(category: categoryData.categories[0])
            .environmentObject(ModelDataCat())
    }
}
