//
//  ContentUIView.swift
//  HasherAcademy
//
//  Created by niteshkumar72 on 13/12/21.
//

import SwiftUI
import UIKit

struct ContentUIView: View {
    init() {
        UITabBar.appearance().backgroundColor = UIColor.lightGray
     }
    var body: some View {
            TabView{
                HomeView()
                    .tabItem{
                        Image(systemName: "house")
                        Text("Home")
                    }
                
                WishlistView()
                    .tabItem{
                        Image(systemName: "heart.fill")
                        Text("Wishlist")
                    }
                
                UserSettingView()
                    .tabItem{
                        Image(systemName: "person.fill")
                        Text("Profile")
                    }
            }
            .accentColor(.red)
    }
}

struct ContentUIView_Previews: PreviewProvider {
    static var previews: some View {
        ContentUIView()
    }
}
