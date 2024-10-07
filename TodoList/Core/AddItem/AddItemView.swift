//
//  AddItemView.swift
//  TodoList
//
//  Created by Maziar Layeghkar on 05.10.24.
//

import SwiftUI
import CoreData

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
                            .frame(maxWidth: .infinity)
                            .frame(height: 50)
                            .foregroundStyle(textFieldFrameColor)
                    )
                    .padding()
                
                NavigationLink(destination: HomeView()) {
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
                
                Spacer()
            }
            .navigationTitle("Add an Item 🖊️")
        }
        .accentColor(purpleColor)
    }
}

#Preview {
    AddItemView()
}

/*
 Solution 1:
 I press SAVE, savedEntities will be updated. And we will be navigated to HomeView
 */

