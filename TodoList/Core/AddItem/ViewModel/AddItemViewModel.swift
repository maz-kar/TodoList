//
//  AddItemViewModel.swift
//  TodoList
//
//  Created by Maziar Layeghkar on 10.10.24.
//

import Foundation
import CoreData

class AddItemViewModel: ObservableObject {
    @Published var savedEntities: [TodoItemEntity] = []
    let container: NSPersistentContainer
    
    init() {
        container = NSPersistentContainer(name: "TodoItemsContainer")
        container.loadPersistentStores { decription, error in
            if let error = error {
                print("Error while loading: \(error)")
            }
        }
        fetchRequest()
    }
    
    func fetchRequest() {
        let request = NSFetchRequest<TodoItemEntity>(entityName: "TodoItemEntity")
        do {
            savedEntities = try container.viewContext.fetch(request)
        } catch let error {
            print("Error while fetching: \(error)")
        }
    }
    
    func addItems(text: String) {
        let newItem = TodoItemEntity(context: container.viewContext)
        newItem.name = text
        
        saveItems()
    }
    
    func saveItems() {
        do {
            try container.viewContext.save()
        } catch let error {
            print("Error while saving: \(error)")
        }
        fetchRequest()
    }
    
    func deleteItems(indexSet: IndexSet) {
        guard let index = indexSet.first else { return }
        let itemToDelete = savedEntities[index]
        container.viewContext.delete(itemToDelete)
        
        saveItems()
    }
    
    func toggleIsTapped(for entity: TodoItemEntity) {
        objectWillChange.send()
        entity.isTapped.toggle()
    }
}
