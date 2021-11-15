//
//  ConfirmQuizView.swift
//  Byngo
//
//  Created by felix on 15/11/2021.
//

import SwiftUI


struct ConfirmQuizView: View {
    
    @EnvironmentObject var categoryData: ModelDataCat
    @State var category: Category
    
    @State var selectedDifficulty: Int
    
    let difficulty = ["Beginner", "Intermediate", "Advanced"]
    
    var categoryIndex: Int {
        categoryData.categories.firstIndex(where: {$0.id==category.id}) ?? 0
    }

    
    var body: some View {
        
//        Text($categoryData.categories[categoryIndex].title)
        VStack {
            Text(category.title)
                .font(.largeTitle)
                .bold()
//            Text(String(selectedDifficulty))
//                .font(.largeTitle)
//                .bold()
            
        }
    }
}

struct ConfirmQuizView_Previews: PreviewProvider {
    
    static var categoryData = ModelDataCat()
    
    static var previews: some View {
        ConfirmQuizView(category: categoryData.categories[0])
            .environmentObject(ModelDataCat())
    }
}
