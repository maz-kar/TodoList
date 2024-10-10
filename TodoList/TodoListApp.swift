//
//  TodoListApp.swift
//  TodoList
//
//  Created by Maziar Layeghkar on 02.10.24.
//

import SwiftUI

@main
struct TodoListApp: App {
    @StateObject var vm = AddItemViewModel()
    
    var body: some Scene {
        WindowGroup {
            HomeView()
        }
        .environmentObject(vm)
    }
}
