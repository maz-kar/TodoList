//
//  Color.swift
//  TodoList
//
//  Created by Maziar Layeghkar on 11.10.24.
//

import Foundation
import SwiftUI

extension Color {
    static let theme = Theme()
    static let launch = Launch()
}

struct Theme {
    let background = Color("Background")
    let accent = Color("AccentColor")
    let secondaryPurple = Color("SecondaryPurple")
    let secondaryText = Color("SecondaryText")
    let textField = Color("TextField")

}

struct Launch {
    let launchBackground = Color("LaunchBackground")
}

