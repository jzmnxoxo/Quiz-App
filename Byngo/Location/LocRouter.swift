//
//  LocViewRouter.swift
//  Byngo
//
//  Created by Jzmn on 17/11/2021.
//

import Foundation
import SwiftUI

class LocRouter: ObservableObject {
  
    @Published var currentLoc: Loc = .threeD

}
enum Loc {
    case threeD
    case ar
}
