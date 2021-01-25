//
//  ContentView.swift
//  Furnitures
//
//  Created by 亚飞 on 2021/1/25.
//

import SwiftUI

struct ContentView: View {
    
    //hiding tab bar ...
    init() {
        UITabBar.appearance().isHidden = true
    }
    var body: some View {
        TabBar()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}


