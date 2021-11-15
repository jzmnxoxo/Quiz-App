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
    
    var categoryIndex: Int {
        categoryData.categories.firstIndex(where: {$0.id==category.id}) ?? 0
    }
    
    var body: some View {
        VStack(alignment: .leading, spacing: 0.0) {
            
            Text(category.title)
                .font(.largeTitle)
                .bold()
            
           
            Rectangle()
                .frame(width: 350, height: 50)
                .foregroundColor(.clear)
            
            //beginner
            Button( action: {
                selectedDifficulty = 1
                ConfirmQuizView(category: categoryData.categories[categoryIndex], selectedDifficulty: 1)
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
            
            Rectangle()
                .frame(width: 350, height: 30)
                .foregroundColor(.clear)
            
            //intermediate
            Button( action: {
                selectedDifficulty = 2
                ConfirmQuizView(category: categoryData.categories[categoryIndex], selectedDifficulty: 2)
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
            
            Rectangle()
                .frame(width: 350, height: 30)
                .foregroundColor(.clear)
            
            //advanced
            Button( action: {
                selectedDifficulty = 3
                ConfirmQuizView(category: categoryData.categories[categoryIndex], selectedDifficulty: 3)
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
            
            Spacer()
            
            
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
