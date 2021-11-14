//
//  ByngoApp.swift
//  Byngo
//
//  Created by Jzmn on 13/11/2021.
//

import SwiftUI

@main
struct ByngoApp: App {
    //let persistenceController = PersistenceController.shared
    @StateObject var viewRouter = ViewRouter()
    @StateObject private var categoryData = ModelData()

    var body: some Scene {
        WindowGroup {
            ContentView(viewRouter: viewRouter)
                .environmentObject(categoryData)
                //.environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
