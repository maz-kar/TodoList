//
//  ContentView.swift
//  TodoList
//
//  Created by Maziar Layeghkar on 02.10.24.
//

import SwiftUI

struct HomeView: View {
    //TODO: I want to have a ref of vm here. call vm.savedEntities. if empty, show the current view. if not show the savedEntities. Consider to use environment instead of two times using vm in 2 different views.
    @StateObject var vm = addItemViewModel()
    let purpleColor = Color(#colorLiteral(red: 0.3236978054, green: 0.1063579395, blue: 0.574860394, alpha: 1))
    
    var body: some View {
        NavigationStack {
            VStack() {
                if !vm.savedEntities.isEmpty {
                    middleText
                    addSthButton
                }
                else {
                    //TODO: Show the savedEntities list
                }
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
                .navigationBarBackButtonHidden()
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
    
    private var addSthButton: some View {
        NavigationLink(destination: AddItemView()) {
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
    
    
}



#Preview {
    HomeView()
}
