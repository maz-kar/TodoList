//
//  ContentView.swift
//  TodoList
//
//  Created by Maziar Layeghkar on 02.10.24.
//

import SwiftUI

struct HomeView: View {
    var body: some View {
        let purpleColor = Color(#colorLiteral(red: 0.3236978054, green: 0.1063579395, blue: 0.574860394, alpha: 1))
        
        NavigationStack {
            VStack() {
                middleText
                
                Button {
                    //TODO: Add functionality
                } label: {
                    Text("Add Something 🥳")
                        .font(.title2)
                        .fontWeight(.semibold)
                        .foregroundStyle(Color.white)
                        .background(
                            RoundedRectangle(cornerRadius: 10)
                                .frame(width: 250, height: 50)
                                .foregroundStyle(purpleColor)
                        )
                }
                //TODO: Add an animation
            }
            .padding()
            Spacer()
                .toolbar(content: {
                    ToolbarItem(placement: .topBarLeading) {
                        Button {
                            //TODO: add functionality
                        } label: {
                            Text("Edit")
                                .foregroundStyle(purpleColor)
                        }
                    }
                    
                    ToolbarItem(placement: .topBarTrailing) {
                        NavigationLink {
                            AddItemView()
                        } label: {
                            Text("Add")
                                .foregroundStyle(purpleColor)
                        }
                    }
                })
                .navigationTitle("Todo List" + " 📝")
        }
    }
}

extension HomeView {
    private var middleText: some View {
        VStack(spacing: 10) {
            Text("There are no items!")
                .font(.title)
                .fontWeight(.semibold)
            
            Text("Are you a productive person? I think you should click the add button and add a bunch of items to your todo list!")
                .font(.title2)
                .fontWeight(.light)
                .multilineTextAlignment(.center)
        }
        .padding()
    }
}



#Preview {
    HomeView()
}
