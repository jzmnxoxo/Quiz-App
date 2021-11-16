//
//  ByngoApp.swift
//  Byngo
//
//  Created by Jzmn on 13/11/2021.
//

import SwiftUI
import Firebase

@main
struct ByngoApp: App {
    
    @UIApplicationDelegateAdaptor (AppDelegate.self) var appDelegate
    //let persistenceController = PersistenceController.shared
    @StateObject var viewRouter = ViewRouter()
    @StateObject private var categoryData = ModelDataCat()
    @StateObject private var homeData = ModelDataHome()

    var body: some Scene {
        WindowGroup {
            let viewModel = AppViewModel()
            AuthView()
                .environmentObject(categoryData)
                .environmentObject(homeData)
                .environmentObject(viewModel)
                //.environment(\.managedObjectContext, persistenceController.container.viewContext)
            
        }
    }
    
    class AppDelegate: NSObject, UIApplicationDelegate {
        func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions:
            [UIApplication.LaunchOptionsKey:Any]? = nil) -> Bool {
            
            FirebaseApp.configure()
            
            return true
        }
    }
}
