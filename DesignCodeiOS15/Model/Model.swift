//
//  Model.swift
//  DesignCodeiOS15
//
//  Created by zw on 2022/3/10.
//

import SwiftUI
import Combine

class Model: ObservableObject{
    @Published var showDetail: Bool = false
    @Published var seletedModal: Modal = .signIn
}

enum Modal:String {
    case signUp
    case signIn
}
