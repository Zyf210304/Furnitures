//
//  CardView.swift
//  Furnitures
//
//  Created by 亚飞 on 2021/1/25.
//

import SwiftUI

struct CardView: View {
    
    var item : Item
    
    var body: some View {
        
        HStack(spacing: 50){
            
            Image(item.image)
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(width: 80, height: 100)
                .cornerRadius(5)
                .clipped()
//                .padding(.horizontal, 20)
            
//            Spacer()
            
            VStack(alignment: .leading, spacing:5) {
                
                Text(item.title)
                    .foregroundColor(.black)
                    .fontWeight(.heavy)
                
                Text(item.subTitle)
                    .foregroundColor(.gray)
                    .fontWeight(.heavy)
                
                Text(item.price)
                    .foregroundColor(.black)
                    .fontWeight(.heavy)
            }
        }
        .padding()
        .background(Color(UIColor.white))
        .cornerRadius(20)
        .shadow(color: Color.black.opacity(0.1), radius: 5, x: 5, y: 5)
        .shadow(color: Color.black.opacity(0.1), radius: 5, x: -5, y: -5)
//        .padding(.horizontal)
//        .padding(.top)
        
    }
}

