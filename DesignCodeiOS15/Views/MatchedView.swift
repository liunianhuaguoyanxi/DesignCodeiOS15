//
//  MatchedView.swift
//  DesignCodeiOS15
//
//  Created by zw on 2022/3/9.
//

import SwiftUI

struct MatchedView: View {
    @Namespace var namespace
    @State var show = false
    var body: some View {
        ZStack {
            if !show{

            }else{

            }

        }
        .onTapGesture {
            withAnimation(.spring(response: 0.6, dampingFraction: 0.8)){
                //使用此方法可以将布尔值从true切换到false或从false切换到tru
            show.toggle()
            }
        }
    }
}

struct MatchedView_Previews: PreviewProvider {
    static var previews: some View {
        MatchedView()
    }
}
