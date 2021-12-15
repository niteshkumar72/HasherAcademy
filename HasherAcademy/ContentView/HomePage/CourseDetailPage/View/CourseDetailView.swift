//
//  CourseDetailView.swift
//  HasherAcademy
//
//  Created by niteshkumar72 on 13/12/21.
//

import SwiftUI

struct CourseDetailView: View {
    var product:Product
    @Binding var cart:[Product]
    @Binding var favorites:[Product]
    
    var body: some View {
        VStack{
            VStack{
                Image(product.imgName)
                    .resizable()
                    .aspectRatio(contentMode:.fit)
                    .background(.green)
                
//                Mark 2: Title
                Text(product.title)
                    .font(.title2)
                    .fontWeight(.semibold)
                
//                Mark 3: courseDetails
                Text(product.descritption)
                    .padding(.vertical)

            }
            Spacer()
            VStack{
                HStack{
//                Image(systemName: "heart.square.fill")
//                        .resizable()
//                        .aspectRatio(contentMode: .fit)
//                        .frame( height: 60, alignment: .leading)
//                        .foregroundColor(.green)
                    Button(action: {
                        if self.favorites.contains(where: { (fav) -> Bool in
                            fav.id == self.product.id
                        }) {
                            self.favorites.removeAll { (fav) -> Bool in
                                fav.id == self.product.id
                            }
                        } else {
                            self.favorites.append(self.product)
                        }
                        
                        
                        
                    }) {
                        if self.favorites.contains(where: { (fav) -> Bool in
                            fav.id == product.id
                        }) {
                            Image(systemName: "heart.fill")
                            .foregroundColor(Color.red)
                            .frame(width: 40, height: 40, alignment: .center)
                            .background(Color.gray.opacity(0.2))
                            .cornerRadius(10)
                        } else {
                            Image(systemName: "heart")
                            .foregroundColor(Color.black)
                            .frame(width: 40, height: 40, alignment: .center)
                            .background(Color.gray.opacity(0.2))
                            .cornerRadius(10)
                        }
                        
                    }
                    Spacer()
//                Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/) {
//                    Text("ADD TO CART")
//                        .bold()
//                        .font(.title)
//                        .aspectRatio(contentMode: .fill)
//                        .padding()
//                        .foregroundColor(.white)
//                        .background(.green)
//                }.
//                    cornerRadius(15)
                    Button(action: {
                        if self.cart.contains(where: { (prod) -> Bool in
                            prod.id == self.product.id
                        }) {
                            self.cart.removeAll { (prod) -> Bool in
                                prod.id == self.product.id
                            }
                        } else {
                            self.cart.append(self.product)
                        }
                    }) {
                        if self.cart.contains(where: { (prod) -> Bool in
                            prod.id == self.product.id
                        }) {
                            HStack(alignment: .center, spacing: 20) {
                                Text("IN YOUR CART")
                                Image(systemName: "checkmark")
                            }
                            .padding(.horizontal, 40)
                            .padding(.vertical, 10)
                            .foregroundColor(Color.white)
                            .font(Font.system(size: 17, weight: .semibold, design: .rounded))
                            .background(Color.gray)
                            .cornerRadius(10)
                        } else {
                            HStack(alignment: .center, spacing: 20) {
                                Text("ADD TO CART")
                                Image(systemName: "cart.fill")
                            }
                            .padding(.horizontal, 40)
                            .padding(.vertical, 10)
                            .foregroundColor(Color.white)
                            .font(Font.system(size: 17, weight: .semibold, design: .rounded))
                            .background(Color(red: 111/255, green: 115/255, blue: 210/255))
                            .cornerRadius(10)
                        }
                        
                    }
                    
                }
                .padding(.horizontal)
            }
        }
//        .navigationBarHidden(true)
//        .navigationBarBackButtonHidden(true)
    }
}

struct CourseDetailView_Previews: PreviewProvider {
    static var product:Product=Product(
            id:"product6",
            imgName: "logo",
            title: "SwiftUI learning by nitesh kumar",
            descritption: "A friendly-looking, tentacled space creature with two eyes.",
            price: "123",
            originalPrice: "99"
        )
  @State  static var cart:[Product] = [
    Product(
        id:"product123",
        imgName: "logo",
        title: "SwiftUI learning by nitesh kumar",
        descritption: "A friendly-looking, tentacled space creature with two eyes.",
        price: "123",
        originalPrice: "99"
    )
]
    @State static var favorites:[Product]=[]
    
    static var previews: some View {
        CourseDetailView(product: product, cart: $cart, favorites: $favorites)
    }
}
