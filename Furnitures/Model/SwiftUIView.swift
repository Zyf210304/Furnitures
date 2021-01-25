//
//  SwiftUIView.swift
//  Furnitures
//
//  Created by 亚飞 on 2021/1/25.
//

import SwiftUI

struct Item: Identifiable {
    
    var id = UUID().uuidString
    var title : String
    var price : String
    var subTitle : String
    var image : String
    var offset : CGFloat = 0
    var isFavorite : Bool = false
}


