//
//  ContentView.swift
//  TodoList
//
//  Created by Maziar Layeghkar on 02.10.24.
//

import SwiftUI

struct HomeView: View {
    var body: some View {
        let colorPurple = Color(#colorLiteral(red: 0.2196078449, green: 0.007843137719, blue: 0.8549019694, alpha: 1))
        
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
                                .foregroundStyle(Color(colorPurple))
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
                                .foregroundStyle(Color(colorPurple))
                        }
                    }
                    
                    ToolbarItem(placement: .topBarTrailing) {
                        Button {
                            //TODO: add functionality
                        } label: {
                            Text("Add")
                                .foregroundStyle(Color(colorPurple))
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

/*
 TODO: Check these first
 - Add dark mode. Align in the end all the colors in both light and dark mode.
 - Add readme.
 - Add functionality to toolbarItems.
 - Add animation to the button.
 - Add color scheme.
 */
