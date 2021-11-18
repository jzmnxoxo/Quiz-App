//
//  SavedView.swift
//  Byngo
//
//  Created by Jzmn on 18/11/2021.
//


import SwiftUI
import CoreData

struct SavedView: View {

    @Environment(\.managedObjectContext) private var viewContext

    @FetchRequest(
        sortDescriptors: [NSSortDescriptor(keyPath: \Item.id, ascending: true)],
        animation: .default)
    private var items: FetchedResults <Item>

    func loadData() {
//        if items.count == 0 {
            let t1 = Item(context: self.viewContext)
            t1.subject = "allergens"
            t1.id = 122
            t1.question = "Q: Which of the following is not a part of the circulatory system?"
            t1.answer="Q: Which of the following is not a part of the circulatory system?\n    A. Heart  B. Aorta  C. Kidney  D. Venae Cavae\nA: C. Kidney is not a part of the circulatory system, but it plays an important role in the urinary system!"


            let t2 = Item(context: self.viewContext)
            t2.subject = "waveform.circle"
            t2.id = 123
            t2.question="Q: When a beam of white rays is dispersed by a prism, which colour will be refracted to a larger extent?"
            t2.answer =
"Q: When a beam of white rays is dispersed by a prism, which colour will be refracted to a larger extent?\nA. Red  B. Violet  C. Blue  D. Green\nA: B. Violet.\nEach beam of light, with its own particular wavelength (or color), is slowed differently by the glass. Since violet light has a shorter wavelength, it is slowed more than the longer wavelengths of red light. Consequently, violet light is bent the most while red light is bent the least."

            do {
                try viewContext.save()
            } catch {
                // Replace this implementation with code to handle the error appropriately.
                // fatalError() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
                let nsError = error as NSError
                fatalError("Unresolved error \(nsError), \(nsError.userInfo)")
            }
//        }
    }

    var body: some View {
        VStack {
                List {
                    ForEach(items) { item in
                        NavigationLink {
                            Text(item.answer!)
                        } label: {
                            HStack{
                                Image(systemName: item.subject!)
                                Text(item.question!)
                            }
                        }
                    }.onDelete(perform: deleteItems)
                }.onAppear(perform: loadData)
//                .toolbar {
//                    ToolbarItem {
//                        Button(action: addItem) {
//                            Label("Add Item", systemImage: "plus")
//                        }
//                    }
//                }

        }
        .navigationBarTitle("History")
    }

    private func addItem() {
        withAnimation {
            let newItem = Item(context: viewContext)
            newItem.id = 12

            do {
                try viewContext.save()
            } catch {
                // Replace this implementation with code to handle the error appropriately.
                // fatalError() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
                let nsError = error as NSError
                fatalError("Unresolved error \(nsError), \(nsError.userInfo)")
            }
        }
    }

    private func deleteItems(offsets: IndexSet) {
        withAnimation {
            offsets.map { items[$0] }.forEach(viewContext.delete)

            do {
                try viewContext.save()
            } catch {
                // Replace this implementation with code to handle the error appropriately.
                // fatalError() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
                let nsError = error as NSError
                fatalError("Unresolved error \(nsError), \(nsError.userInfo)")
            }
        }
    }
}


struct SavedView_Previews: PreviewProvider {
    static var previews: some View {
        SavedView()
            .environment(\.managedObjectContext, PersistenceController.preview.container.viewContext)

    }
}
