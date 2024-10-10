//
//  AddItemView.swift
//  TodoList
//
//  Created by Maziar Layeghkar on 05.10.24.
//

import SwiftUI
import CoreData

struct AddItemView: View {
    @EnvironmentObject private var vm: AddItemViewModel
    @State private var textFieldText: String = ""
    @State private var isNavigating: Bool = false
    @State private var showAlert: Bool = false
    
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
        .environmentObject(AddItemViewModel())
}



extension AddItemView {
    private var searchField: some View {
        TextField("Type something here...", text: $textFieldText)
            .autocorrectionDisabled(true)
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
            if textFieldText.count < 3 {
                showAlert = true
            }
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
        .alert(isPresented: $showAlert) {
            Alert(title: Text("Your new todo item must be at least 3 characters long!!! 😨😰😱"), message: nil)
        }
    }
    
}
