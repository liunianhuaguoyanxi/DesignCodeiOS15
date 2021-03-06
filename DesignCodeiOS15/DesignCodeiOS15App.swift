//
//  DesignCodeiOS15App.swift
//  DesignCodeiOS15
//
//  Created by zw on 2022/3/7.
//

import SwiftUI

@main
struct DesignCodeiOS15App: App {
    @StateObject var model = Model()
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(model)
        }
    }
}
