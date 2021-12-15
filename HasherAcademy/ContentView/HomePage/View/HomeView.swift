//
//  HomeView.swift
//  HasherAcademy
//
//  Created by niteshkumar72 on 13/12/21.
//


//                TopNav()
//                Divider()
//                Spacer()
//    SearchView(search:$searchItem)
//                Spacer()
//                list data

import SwiftUI
var lightGreyClr=Color(red: 239.0/255.0, green: 243.0/255.0, blue: 244.0/255.0)
var purpleBg=Color(red: 154/255.0, green: 6/255.0, blue: 128/255.0)
struct HomeView: View {
    @State var searchItem:String=""

    @Binding var products:[Product]
    @Binding var cart:[Product]
    @Binding var favorites:[Product]
    var body: some View {
            VStack{
                TopNav(cart: $cart)
                    SearchView(search:$searchItem)
                
                List(products) { data in
                    NavigationLink(destination:CourseDetailView(product: data, cart: self.$cart, favorites: self.$favorites)){
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
                    
                }
                    .navigationBarHidden(true)
                    
                }
                .listStyle(PlainListStyle())
                
            }
        }
}

struct HomeView_Previews: PreviewProvider {
   static var product:[Product] = [
    Product(
        id:"product123",
        imgName: "logo",
        title: "SwiftUI learning by nitesh kumar",
        descritption: "A friendly-looking, tentacled space creature with two eyes.",
        price: "123",
        originalPrice: "99"
    )
]
    @State static var items:[Product] = [
        Product(
            id:"product123",
            imgName: "logo",
            title: "SwiftUI learning by nitesh kumar",
            descritption: "A friendly-looking, tentacled space creature with two eyes.",
            price: "123",
            originalPrice: "99"
        )
    ]
    @State static var cart:[Product]=DataSource
    @State static var favorites:[Product]=[]
    
    static var previews: some View {
        HomeView(products:$items,cart:$cart,favorites: $favorites)
            .previewInterfaceOrientation(.portrait)
    }
}

struct TopNav: View {
    @Binding var cart:[Product]
    var body: some View {
        HStack{
            Text("Courses")
                .font(.largeTitle)
                .fontWeight(.semibold)
            Spacer()
            HStack{
                Spacer()
                ZStack{
                Image(systemName: "cart.fill")
                    .resizable()
                    .frame(width: 45, height: 45)
                    .clipShape(Rectangle())
                    .frame(width: 80, height: 80)
                    .foregroundColor(.green)
                    .cornerRadius(20)
                    
                    Text("\($cart.count)")
                        .padding(.all,10)
                        .font(.body)
                        .background(.red)
                        .foregroundColor(.white)
                        .clipShape(Circle())
                        .offset(x:14,y:-20)
                    
                }
            }
        }
        .padding(.top,30)
        .padding(.horizontal)
    }
}

struct SearchView: View {
    @Binding var search:String
    var body: some View {
        VStack{
            HStack{
                TextField("Search", text: $search)
                    .padding()
                    .background(lightGreyClr)
                    .cornerRadius(5.0)
                
                Image(systemName: "magnifyingglass")
                    .frame(width: 55, height: 55)
                    .foregroundColor(purpleBg)
                    .background(lightGreyColor)
                    .cornerRadius(5)
                
            }.padding()
        }
    }
}
