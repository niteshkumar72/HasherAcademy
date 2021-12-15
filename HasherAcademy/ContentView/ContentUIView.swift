//
//  ContentUIView.swift
//  HasherAcademy
//
//  Created by niteshkumar72 on 13/12/21.
//

import SwiftUI
import UIKit

struct ContentUIView: View {
    var product:Product =
        Product(
            id:"product123",
            imgName: "logo",
            title: "SwiftUI learning by nitesh kumar",
            descritption: "A friendly-looking, tentacled space creature with two eyes.",
            price: "123",
            originalPrice: "99"
        )
    @State var items:[Product] = [
        Product(
            id:"product01",
            imgName: "logo",
            title: "SwiftUI learning by nitesh kumar",
            descritption: "A friendly-looking, tentacled space creature with two eyes.",
            price: "123",
            originalPrice: "99"
        ),
        Product(
            id:"product02",
            imgName: "logo",
            title: "hello Brother",
            descritption: "Atentacled space creature with two eyes.",
            price: "139",
            originalPrice: "299"
        ),
        Product(
            id:"product03",
            imgName: "logo",
            title: "Hacker bro",
            descritption: "Learn ethical hacking with nitesh kumar.",
            price: "123",
            originalPrice: "999"
        )
    ]
    @State var cart:[Product]=[]
    @State var favorites:[Product]=[]
    
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
            .accentColor(.red)
    }
}

struct ContentUIView_Previews: PreviewProvider {
    static var previews: some View {
        ContentUIView()
    }
}
