//
//  ContentView.swift
//  TodoList
//
//  Created by Maziar Layeghkar on 02.10.24.
//

import SwiftUI

struct HomeView: View {
    @EnvironmentObject private var vm: AddItemViewModel
    @State private var isNavigating: Bool = false
    @State private var isScaled: Bool = false
    
    let purpleColor = Color(#colorLiteral(red: 0.3236978054, green: 0.1063579395, blue: 0.574860394, alpha: 1))
    let secondaryPurpleColor = Color(#colorLiteral(red: 0.5725490451, green: 0, blue: 0.2313725501, alpha: 1))
    
    var body: some View {
        NavigationStack {
            VStack() {
                if vm.savedEntities.isEmpty {
                    middleText
                    addSthButton
                }
                else {
                    itemsList
                }
            }
            .navigationDestination(isPresented: $isNavigating, destination: {
                AddItemView()
            })
            
            .padding()
            
            Spacer()
            
                .toolbar(content: {
                    ToolbarItem(placement: .topBarLeading) {
                        EditButton()
                            .foregroundStyle(purpleColor)
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
        Button {
            isNavigating = true
        } label: {
            Text("Add Something 🥳")
                .font(.title2)
                .fontWeight(.semibold)
                .foregroundStyle(Color.white)
                .background(
                    RoundedRectangle(cornerRadius: 10)
                        .frame(width: 250, height: 50)
                        .shadow(color: isScaled ? secondaryPurpleColor : purpleColor, radius: 20, y: 20)
                )
        }
        .scaleEffect(isScaled ? 1.1 : 0.9)
        .foregroundStyle(isScaled ? secondaryPurpleColor : purpleColor)
        .animation(
            Animation.easeInOut(duration: 2.0)
                .repeatForever(autoreverses: true), value: isScaled
        )
        .onAppear {
            isScaled = true
        }
    }
    
    private var itemsList: some View {
        List {
            ForEach(vm.savedEntities) { entity in
                VStack {
                    HStack {
                        Image(systemName: entity.isTapped ? "checkmark.circle" : "circle")
                            .animation(.easeInOut)
                            .foregroundStyle(entity.isTapped ? Color.green : Color.red)
                        Text(entity.name ?? "no name")
                    }
                    .offset(x: -15)
                    .onTapGesture {
                        vm.toggleIsTapped(for: entity)
                    }
                }
            }
            .onDelete(perform: vm.deleteItems)
            
            .onMove { indices, newOffset in
                vm.savedEntities.move(fromOffsets: indices, toOffset: newOffset)
            }
            
        }
        .listStyle(.plain)
    }
}

#Preview {
    HomeView()
        .environmentObject(AddItemViewModel())
}
