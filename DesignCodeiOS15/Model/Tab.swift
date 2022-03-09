//
//  Tab.swift
//  DesignCodeiOS15
//
//  Created by zw on 2022/3/8.
//

import SwiftUI

struct TabItem:Identifiable {
    var id = UUID()
    var text: String
    var icon: String
    var tab:Tab
    var color :Color
}

var tabItems = [
    TabItem(text: "Learn Now", icon: "house",tab:.home,color: .teal),
    TabItem(text: "Explore", icon: "magnifyingglass",tab:.explore,color: .blue),
    TabItem(text: "Notifications", icon: "bell",tab:.notification,color: .red),
    TabItem(text: "Library", icon: "rectangle.stack",tab:.library,color: .pink)
]

enum Tab:String
{
    case home
    case explore
    case notification
    case library
}

struct TabPrefenenceKey :PreferenceKey{
    static var defaultValue : CGFloat = 0
    static func reduce(value: inout CGFloat, nextValue: () -> CGFloat) {
        value = nextValue()
    }
    
}
