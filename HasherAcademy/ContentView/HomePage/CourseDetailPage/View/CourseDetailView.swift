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
    var purpleBg=Color(red: 154/255.0, green: 6/255.0, blue: 128/255.0)
    
    var body: some View {
        VStack{
            VStack{
                Image(product.imgName)
                    .resizable()
                    .aspectRatio(contentMode:.fit)
                
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
                            
                            Image(systemName:"heart.fill")
                            .foregroundColor(purpleBg)
                            .frame(width: 50, height: 50, alignment: .center)
                            .background(Color.gray.opacity(0.2))
                            .cornerRadius(10)
                        } else {
                            
                            Image(systemName: "heart")
                            .foregroundColor(Color.black)
                            .frame(width: 50, height: 50, alignment: .center)
                            .background(Color.gray.opacity(0.2))
                            .cornerRadius(10)
                            
                        }
                        
                    }
                    Spacer()
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
                            .padding(.vertical, 15)
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
                            .padding(.vertical, 15)
                            .foregroundColor(Color.white)
                            .font(Font.system(size: 17, weight: .semibold, design: .rounded))
                            .background(purpleBg)
                            .cornerRadius(10)
                        }
                    }
                }
                .padding(.horizontal)
                .padding(.bottom,20)
            }
            .padding(.horizontal)
        }
//        .navigationBarHidden(true)
//        .navigationBarBackButtonHidden(true)
    }
}

struct CourseDetailView_Previews: PreviewProvider {
    static var product:Product=DataSource[0]
  @State  static var cart:[Product] = DataSource
    @State static var favorites:[Product]=[]
    
    static var previews: some View {
        CourseDetailView(product: product, cart: $cart, favorites: $favorites)
    }
}
