//
//  TabBar.swift
//  Furnitures
//
//  Created by 亚飞 on 2021/1/25.
//

import SwiftUI

struct TabBar: View {
    
    @State var current = "Home"
    
    var body: some View {
    
        ZStack (alignment: Alignment(horizontal: .center, vertical: .bottom), content: {
            
            TabView(selection: $current) {
                
                Home()
                    .tag("Home")
                
                Text("Messages")
                    .tag("Messages")
                
                Text("Account")
                    .tag("Account")
            }
            
            HStack(spacing: 0) {
                
                TabButton(title: "Home", image: "house", selected: $current)
                
                Spacer()
                
                TabButton(title: "Messages", image: "message", selected: $current)
                
                Spacer()
                
                TabButton(title: "Account", image: "person", selected: $current)
            }
            .padding(.vertical, 12)
            .padding(.horizontal)
            .background(Color(#colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)).opacity(0.9))
            .clipShape(Capsule())
            .padding(.horizontal, 25)
        })
    }
}

struct TabBar_Previews: PreviewProvider {
    static var previews: some View {
        TabBar()
    }
}
