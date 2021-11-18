//
//  QuestionBank.swift
//  Byngo
//
//  Created by felix on 16/11/2021.
//

import Foundation
import SwiftUI


struct Question: Identifiable {
    var id: Int
    var category: CategoryQuestion
    
}

struct CategoryQuestion: Identifiable {
    var id: Int
    var question: String
    var choice = Array<Any>().self
    
}
