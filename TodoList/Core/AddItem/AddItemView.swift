//
//  AddItemView.swift
//  TodoList
//
//  Created by Maziar Layeghkar on 05.10.24.
//

import SwiftUI
import CoreData

struct AddItemView: View {
    @StateObject var vm = addItemViewModel()
    @State private var textFieldText: String = ""
    @State private var isNavigating: Bool = false
    
    let textFieldFrameColor = Color(#colorLiteral(red: 0.921431005, green: 0.9214526415, blue: 0.9214410186, alpha: 1))
    let purpleColor = Color(#colorLiteral(red: 0.3236978054, green: 0.1063579395, blue: 0.574860394, alpha: 1))
    
    var body: some View {
        NavigationStack {
            VStack(spacing: -25) {
                searchField
                saveButton
                Spacer()
            }
            .navigationDestination(isPresented: $isNavigating, destination: {
                HomeView()
            })
            .navigationTitle("Add an Item 🖊️")
        }
        .accentColor(purpleColor)
    }
}

#Preview {
    AddItemView()
}

class addItemViewModel: ObservableObject {
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
    
}

extension AddItemView {
    private var searchField: some View {
        TextField("Type something here...", text: $textFieldText)
            .padding()
            .background(
                RoundedRectangle(cornerRadius: 10)
                    .frame(maxWidth: .infinity)
                    .frame(height: 50)
                    .foregroundStyle(textFieldFrameColor)
            )
            .padding()
    }
    
    private var saveButton: some View {
        Button {
            if textFieldText.isEmpty { return }
            else {
                vm.addItems(text: textFieldText)
                textFieldText = ""
                isNavigating = true
            }
        } label: {
            RoundedRectangle(cornerRadius: 10)
                .frame(maxWidth: .infinity)
                .frame(height: 50)
                .foregroundStyle(purpleColor)
                .padding()
                .overlay {
                    Text("Save".uppercased())
                        .foregroundStyle(.white)
                        .fontWeight(.semibold)
                }
        }
    }
    
    private var itemsList: some View {
        List {
            ForEach(vm.savedEntities) { entity in
                VStack(alignment: .leading) {
                    Text(entity.name ?? "No entity name")
                }
            }
            .onDelete(perform: vm.deleteItems)
        }
        .padding()
        .listStyle(.plain)
    }
}
