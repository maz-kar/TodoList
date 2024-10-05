//
//  AddItemView.swift
//  TodoList
//
//  Created by Maziar Layeghkar on 05.10.24.
//

import SwiftUI

struct AddItemView: View {
    @State private var textFieldTxt: String = ""
    let textFieldFrameColor = Color(#colorLiteral(red: 0.921431005, green: 0.9214526415, blue: 0.9214410186, alpha: 1))
    let purpleColor = Color(#colorLiteral(red: 0.3236978054, green: 0.1063579395, blue: 0.574860394, alpha: 1))
    
    var body: some View {
        NavigationStack {
            VStack(spacing: -25) {
                
                TextField("Type something here...", text: $textFieldTxt)
                    .padding()
                    .background(
                        RoundedRectangle(cornerRadius: 10)
                            .frame(width: .infinity, height: 50)
                            .foregroundStyle(textFieldFrameColor)
                    )
                    .padding()
                
                Button {
                    //TODO: Add functionality
                } label: {
                    RoundedRectangle(cornerRadius: 10)
                        .frame(width: .infinity, height: 50)
                        .foregroundStyle(purpleColor)
                        .padding()
                        .overlay {
                            Text("Save".uppercased())
                                .foregroundStyle(.white)
                                .fontWeight(.semibold)
                        }
                }
                Spacer()
            }
            .navigationTitle("Add an Item 🖊️")
        }
    }
}

#Preview {
    AddItemView()
}

/*
 TODO:
 rename the back button to be really back
 */
