//
//  ViewRouter.swift
//  TabBar
//
//  Created by Jzmn on 13/11/2021.
//

import SwiftUI

class StatRouter: ObservableObject {
  
    @Published var currentStat: Stat = .overall

}
enum Stat {
    case overall
    case category
}
