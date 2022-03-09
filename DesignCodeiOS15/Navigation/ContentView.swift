//
//  ContentView.swift
//  DesignCodeiOS15
//
//  Created by zw on 2022/3/7.
//

import SwiftUI

struct ContentView: View {
    @AppStorage("selectedTab") var selectedTab :Tab = .home
      
    var body: some View {
        ZStack(alignment: .bottom) {

            switch selectedTab {
            case .home:
                HomeView()
            case .explore:
                AccountView()
             case .notification:
                AccountView()
            case .library:
                AccountView()
            }

            
            TabBar()
        }
        .safeAreaInset(edge: .bottom) {
            Color.blue.frame(height: 44)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
        ContentView()
            .preferredColorScheme(.dark)
    }
}
