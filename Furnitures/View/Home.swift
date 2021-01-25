//
//  Home.swift
//  Furnitures
//
//  Created by 亚飞 on 2021/1/25.
//

import SwiftUI

struct Home: View {
    
    @State var size = "Medium"
    @State var currentTab = "All"
    @GestureState var isDragging = false
    @State var items = [
        
        Item(title: "随便起", price: "$20.0", subTitle: "asdadasdasdasfqwe", image: "onePiece0"),
        Item(title: "就这", price: "$245.0", subTitle: "asdadasdasdasfqwe", image: "onePiece1"),
        Item(title: "嘻嘻", price: "$77.0", subTitle: "asdadasdasdasfqwe", image: "onePiece2"),
        Item(title: "biu~", price: "$73.0", subTitle: "asdadasdasdasfqwe", image: "onePiece3"),
        Item(title: "加油", price: "$2703.0", subTitle: "asdadasdasdasfqwe", image: "onePiece4"),
        
    ]
    @State var cart : [Item] = []
    
    
    var body: some View {
        
        VStack {
            
            HStack {
                
                Button(action: {}, label: {
                    
                    Image(systemName: "line.horizontal.3.decrease")
                        .font(.title)
                        .foregroundColor(.black)
                })
                
                Spacer()
                
                Button(action: {}, label: {
                    
                    Image(systemName: "cart")
                        .font(.title)
                        .foregroundColor(.black)
                })
                .overlay(
                
                    Text("\(cart.count)")
                        .font(.caption)
                        .foregroundColor(.white)
                        .fontWeight(.heavy)
                        .frame(width: 20, height: 20)
                        .background(cart.count > 0 ? Color("tab") : Color(UIColor.white))
                        .clipShape(Circle())
                        .offset(x: 15, y: -22)
                )
            }
            .padding(.horizontal)
            .padding(.top)
            .padding(.bottom, 10)
            
            
            ScrollView {
                
                VStack {
                    
                    HStack {
                        
                        VStack(alignment: .leading, spacing: 10, content: {
                            
                            Text("Furniture in \nUnique Style")
                                .font(.largeTitle)
                                .fontWeight(.heavy)
                                .foregroundColor(.black)
                            
                            Text("We have wide range of furnitures")
                                .font(.caption)
                                .foregroundColor(.gray)
                                .fontWeight(.bold)
                        })
                        
                        Spacer()
                        
                        Menu(content: {
                            
                            Button(action: {
                                size = "Small"
                            }, label: {
                                Text("Small")
                            })
                            
                            Button(action: {
                                size = "Medium"
                            }, label: {
                                Text("Medium")
                            })
                            
                            Button(action: {
                                size = "Large"
                            }, label: {
                                Text("Large")
                            })
                            
                        }) {
                            
                            Label(title: {
                                
                                Text(size)
                                    .foregroundColor(.white)
                            }) {
                                
                                Image(systemName: "slider.horizontal.3")
                                    .foregroundColor(.white)
                            }
                            .padding(.vertical, 10)
                            .padding(.horizontal)
                            .background(Color("tab"))
                            .clipShape(Capsule())
                        }
                    }
                    .padding()
                    
                    HStack(spacing: 0) {
                        
                        ForEach(tabs, id:\.self) { tab in
                            
                            Button(action: {
                                currentTab = tab
                            }, label: {
                                Text(tab)
                                    .fontWeight(.bold)
                                    .foregroundColor(currentTab == tab ? .black : .gray)
                            })
                            
                            if tab != tabs.last {
                                Spacer()
                            }
                        }
                    }
                    .padding()
                    
                    ForEach(items.indices) { index in
                        
                        ZStack {
                            
                            Color("tab")
                                .cornerRadius(20)
                                .padding(.horizontal)
                            
                            Color("Color")
                                .cornerRadius(20)
                                .padding(.horizontal)
                                .padding(.trailing, 55)
                            
                            HStack {
                                
                                Spacer()
                                
                                Button(action: {
                                    
                                    withAnimation{
                                        
                                        items[index].isFavorite.toggle()
                                        items[index].offset = 0
                                    }
                                }, label: {
                                    
                                    Image(systemName: items[index].isFavorite ?  "suit.heart.fill" : "suit.heart")
                                        .font(.title)
                                        .foregroundColor(items[index].isFavorite ? .red : .white)
                                        .frame(width: 55)
                                    
                                })
                                
                                Button(action: {
                                    addCart(index: index)
                                }, label: {
                                    
                                    Image(systemName: checkCart(index: index) ? "cart.badge.minus" : "cart.badge.plus")
                                        .font(.title)
                                        .foregroundColor(.white)
                                        .frame(width: 55)
                                    
                                })
                                
                            }.padding()
                            
                            
                            
                            
                            CardView(item: items[index])
                                .offset(x:items[index].offset)
                                .gesture(
                                    DragGesture()
                                        .updating($isDragging, body: { (value, state, _) in
                                            
                                            state = true
                                            onChanged(value: value, index: index)
                                        })
//                                        .onChanged({ (value) in
//                                            onChanged(value: value, index: index)
//                                        })
                                        .onEnded({ (value) in
                                            onEnd(value: value, index: index)
                                        })
                                )
                        }
                        .padding(.horizontal)
                        .padding(.top)
                    }
                }
            }
            
            Spacer()
        }
    }
    
    func checkCart(index: Int) -> Bool {
        
        return cart.contains { (item) -> Bool in
            return item.id == items[index].id
        }
    }
    
    func addCart(index: Int) {
        
        if checkCart(index: index) {
            cart.removeAll { (item) -> Bool in
                return item.id == items[index].id
            }
        }
        else {
            cart.append(items[index])
        }
        
        withAnimation {
            items[index].offset = 0
        }
    }
    
    
    func onChanged(value : DragGesture.Value, index: Int) {
        
        if value.translation.width < 0  && isDragging{
            
            items[index].offset = value.translation.width
        }
    }
    
    func onEnd(value : DragGesture.Value, index: Int) {
        
        withAnimation {
            
            if -value.translation.width >= 100 {
                
                items[index].offset = -130
            }
            else {
                
                items[index].offset = 0
            }
        }
    }
    
}

struct Home_Previews: PreviewProvider {
    static var previews: some View {
        Home()
    }
}


var tabs = ["Tables", "Chairs", "Lamps", "All"]
