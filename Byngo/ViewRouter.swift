//
//  ViewRouter.swift
//  TabBar
//
//  Created by Jzmn on 13/11/2021.
//

import SwiftUI

class ViewRouter: ObservableObject {
  
    @Published var currentPage: Page = .home

}
enum Page {
    case user
    case category
    case home
    case history
    case settings
}
