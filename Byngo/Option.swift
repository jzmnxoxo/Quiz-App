////
////  Option.swift
////  Byngo
////
////  Created by Jzmn on 14/11/2021.
////
//
//import SwiftUI
//import Combine
//
////Denotes each setting
//struct Option: Codable{
//    var id: Int
//    //title of settings
//    var title: String
//    //whether the setting needs to be show in seperate section
//    var isAddSection: Bool
//    //array of innerSettings
//    var values: [InnerOptionValues]
//}
//
//struct InnerOptionValues: Codable {
//    var title: String
//    var isAddSection: Bool
//    //whether needs toggle
//    var isUseToggle: Bool
//    //title of inner setting
//    var headerTitle: String
//}
//
//extension Option{
//    
//    static let options: [Option] = [
//        .init(id: 1, title: "Notifications", isAddSection: false, values: notifValues),
//        .init(id: 2, title: "Languange & Region", isAddSection: false, values: langValues),
//        .init(id: 3, title: "Sounds", isAddSection: false, values: soundValues),
//        .init(id: 4, title: "Privacy", isAddSection: false, values: privacyValues)
//    ]
//}
//
//extension Option{
//    
//    static let notifValues:[InnerOptionValues]=[
//        .init(title: "Notifications", isAddSection: true, isUseToggle: false, headerTitle: ""),
//    ]
//    static let langValues:[InnerOptionValues]=[
//        .init(title: "Language ", isAddSection: true, isUseToggle: false, headerTitle: ""),
//        .init(title: "Region", isAddSection: true, isUseToggle: false, headerTitle: "")
//    ]
//    static let privacyValues: [InnerOptionValues] = [
//        .init(title: "Location", isAddSection: true, isUseToggle: false, headerTitle: "ENABLE ACCESS TO LOCATION"),
//        .init(title: <#T##String#>, isAddSection: <#T##Bool#>, isUseToggle: <#T##Bool#>, headerTitle: <#T##String#>)
//    ]
//    static let soundValues: [InnerOptionValues] = [
//        .init(title: "Music", isAddSection: false, isUseToggle: true, headerTitle: ""),
//        .init(title: "Sound Effects", isAddSection: false, isUseToggle: true, headerTitle: "")
//    ]
//}
