//
//  Suggestion.swift
//  DesignCodeiOS15
//
//  Created by zw on 2022/3/11.
//

import SwiftUI

struct Suggestion : Identifiable {
    let id = UUID()
    var text: String
}

var suggestions = [
    Suggestion(text: "SwiftUI"),
    Suggestion(text: "React"),
    Suggestion(text: "Desgin"),
]
