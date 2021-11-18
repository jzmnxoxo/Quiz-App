//
//  QustionBank.swift
//  Byngo
//
//  Created by felix on 17/11/2021.
//

import Foundation
import SwiftUI


class ModelDataQuestion: ObservableObject {
    
    @Published var questions:[Question] = []
    
    init() {
        
        questions.append(Question(id:0, category:CategoryQuestion(id:0, question:"", choice:["A","B","C","D"])))
        questions.append(Question(id:0, category:CategoryQuestion(id:1, question:"", choice:["A","B","C","D"])))
        
        questions.append(Question(id:1, category:CategoryQuestion(id:0, question:"", choice:["A","B","C","D"])))
        questions.append(Question(id:1, category:CategoryQuestion(id:1, question:"", choice:["A","B","C","D"])))
    }
}
