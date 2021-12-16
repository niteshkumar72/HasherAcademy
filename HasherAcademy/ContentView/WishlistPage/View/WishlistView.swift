//
//  WishlistView.swift
//  HasherAcademy
//
//  Created by niteshkumar72 on 13/12/21.
//

import SwiftUI

struct WishlistView: View {
    @Binding var favorites:[Product]
    
    var body: some View {
        VStack{
            HStack{
                Text("Wishlist")
                    .font(.largeTitle)
                    .fontWeight(.semibold)
                Spacer()
                HStack{
                    Spacer()
                    ZStack{
                        Image(systemName: "heart.square.fill")
                            .resizable()
                            .frame(width: 40, height: 40)
                            .clipShape(Rectangle())
                            .frame(width: 50, height: 50)
                            .foregroundColor(purpleBg)
                            .cornerRadius(20)
                        
                        Text("\(favorites.count)")
                            .padding(.all,10)
                            .font(.body)
                            .background(.red)
                            .foregroundColor(.white)
                            .clipShape(Circle())
                            .offset(x:14,y:-20)
                    }
                }
            }
            .padding(.horizontal)
            Spacer()
            if favorites.count == 0 {
                VStack{
                Image(systemName: "bag.fill")
                    .resizable()
                    .frame(width: 40, height: 40)
                    .clipShape(Rectangle())
                    .frame(width: 50, height: 50)
                    .foregroundColor(purpleBg)
                    .cornerRadius(20)

                Text("Wishlist empty")
                }
                Spacer()
            }
            else{
            List(favorites) { data in
//                NavigationLink(destination:UserSettingView()){
                    VStack{
                        HStack{
                            Image(data.imgName)
                                .resizable()
                                .aspectRatio( contentMode: .fill)
                                .frame(width: 80, height: 80)
                                .clipped()
                            Spacer()
                            VStack{
                                HStack{
                                    Text(data.title)
                                        .font(.title3)
                                        .fontWeight(.bold)
                                        .frame(height: 45, alignment: .leading)
                                    Spacer()
                                }
                                Text(data.descritption)
                                    .font(.body)
                                    .frame( height: 50, alignment: .leading)
                                    .offset(y:-12)
                            }
                            Spacer()
                            VStack{
                                Text("$ \(data.price)")
                                    .fontWeight(.semibold)
                                    .frame(width: 80, height: 20, alignment: .center)
                                    .font(.title3)
                                Text("$ \(data.originalPrice)")
                                    .strikethrough(true)

                            }
                        }
                    }

//                }
                .navigationBarHidden(true)
                .navigationBarBackButtonHidden(true)
            }                    .listStyle(PlainListStyle())

            }
        }
    }
}
    
    struct WishlistView_Previews: PreviewProvider {
        @State static var favorite:[Product]=[Product(
                id:"product01",
                imgName: "logo",
                title: "SwiftUI learning by nitesh kumar",
                descritption: "A friendly-looking, tentacled space creature with two eyes.",
                price: "123",
                originalPrice: "99"
            )
        ]
        static var previews: some View {
            WishlistView(favorites: $favorite)
        }
    }
