////
////  HistoryView.swift
////  TabBar
////
////  Created by Jzmn on 13/11/2021.
////
//
//import SwiftUI
//import CoreData
//
//struct HistoryView: View {
//
//    @Environment(\.managedObjectContext) private var viewContext
//
//    @FetchRequest(
//        sortDescriptors: [NSSortDescriptor(keyPath: \Item.id, ascending: true)],
//        animation: .default)
//    private var items: FetchedResults<Item>
//
//    func loadData() {
//        if items.count == 0 {
//            let t1 = Item(context: self.viewContext)
//            t1.id = 122
//
//            let t2 = Item(context: self.viewContext)
//            t2.id = 123
//
//            do {
//                try viewContext.save()
//            } catch {
//                // Replace this implementation with code to handle the error appropriately.
//                // fatalError() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
//                let nsError = error as NSError
//                fatalError("Unresolved error \(nsError), \(nsError.userInfo)")
//            }
//        }
//    }
//
//    var body: some View {
//        VStack {
//            NavigationView {
//                List {
//                    ForEach(items) { item in
//                        NavigationLink {
//                            Text("ID is \(item.id)")
//                        } label: {
//                            Text("item \(item.id)")
//                        }
//                    }.onDelete(perform: deleteItems)
//                }.onAppear(perform: loadData)
////                .toolbar {
////                    ToolbarItem {
////                        Button(action: addItem) {
////                            Label("Add Item", systemImage: "plus")
////                        }
////                    }
////                }
//            }
//
//
//        }
//        .navigationBarTitle("History")
//    }
//
//    private func addItem() {
//        withAnimation {
//            let newItem = Item(context: viewContext)
//            newItem.id = 12
//
//            do {
//                try viewContext.save()
//            } catch {
//                // Replace this implementation with code to handle the error appropriately.
//                // fatalError() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
//                let nsError = error as NSError
//                fatalError("Unresolved error \(nsError), \(nsError.userInfo)")
//            }
//        }
//    }
//
//    private func deleteItems(offsets: IndexSet) {
//        withAnimation {
//            offsets.map { items[$0] }.forEach(viewContext.delete)
//
//            do {
//                try viewContext.save()
//            } catch {
//                // Replace this implementation with code to handle the error appropriately.
//                // fatalError() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
//                let nsError = error as NSError
//                fatalError("Unresolved error \(nsError), \(nsError.userInfo)")
//            }
//        }
//    }
//}
//
//
//struct HistoryView_Previews: PreviewProvider {
//    static var previews: some View {
//        HistoryView()
//            .environment(\.managedObjectContext, PersistenceController.preview.container.viewContext)
//
//    }
//}
