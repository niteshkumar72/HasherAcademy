//
//  ContentUIView.swift
//  HasherAcademy
//
//  Created by niteshkumar72 on 13/12/21.
//

import SwiftUI
import UIKit

struct ContentUIView: View {
    var product:Product = DataSource[0]
    @State var items:[Product] = DataSource
    @State var cart:[Product]=[]
    @State var favorites:[Product]=[]
    var purpleClr=Color(red: 154/255.0, green: 6/255.0, blue: 128/255.0)
    
    init() {
        UITabBar.appearance().backgroundColor = UIColor.white
        UITabBar.appearance().isOpaque = true
        
        items.append(contentsOf: [product])
        cart.append(contentsOf: [product])
     }
    var body: some View {
            TabView{
                HomeView(products:$items,cart:$cart,favorites: $favorites)
                    .tabItem{
                        Image(systemName: "house")
                        Text("Home")
                    }.tag(0)
                
                WishlistView(favorites: $favorites)
                    .tabItem{
                        Image(systemName: "heart.fill")
                        Text("Wishlist")
                    }.tag(1)
                
                UserSettingView()
                    .tabItem{
                        Image(systemName: "person.fill")
                        Text("Profile")
                    }.tag(2)
            }
            .accentColor(purpleClr)
    }
}

struct ContentUIView_Previews: PreviewProvider {
    static var previews: some View {
        ContentUIView()
    }
}
