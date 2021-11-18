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
    
    @State var choose: Int = 0
    @State private var isStarted = false

    let Difficulty = ["Beginner", "Intermediate", "Advanced"]
    
    var categoryIndex: Int {
        categoryData.categories.firstIndex(where: {$0.id==category.id}) ?? 0
    }
    
    @State var isSelected: Bool = false
    
    var body: some View {
        
        if !isSelected {
            //not yet selected
            VStack(alignment: .leading, spacing: 0.0) {
                
                Text(category.title)
                    .font(.largeTitle)
                    .bold()
                
               
                Rectangle()
                    .frame(width: 350, height: 50)
                    .foregroundColor(.clear)
                
                Button {
                    isSelected.toggle()
                    choose = 0
                } label: {
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
                
                
                Button {
                    isSelected.toggle()
                    choose = 1
                } label: {
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
                Button {
                    isSelected.toggle()
                    choose = 2
                } label: {
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
            }
        } else {
            //selected
            CatConfirm(category: categoryData.categories[category.id], selected: choose)
        }
    }

}


//struct CategoryDetail_Previews: PreviewProvider {
//    static var categoryData = ModelDataCat()
//
//    static var previews: some View {
//        CategoryDetail(category: categoryData)
//            .environmentObject(ModelDataCat())
//    }
//}
