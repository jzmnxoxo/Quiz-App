//
//  HistRouter.swift
//  Byngo
//
//  Created by Jzmn on 18/11/2021.
//

import SwiftUI

class HistRouter: ObservableObject {
  
    @Published var currentHist: Hist = .comments

}
enum Hist {
    case comments
    case saved
}
