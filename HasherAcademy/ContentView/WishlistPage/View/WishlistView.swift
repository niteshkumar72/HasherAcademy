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
            Text("Helo")
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
