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
    
    let datas=DataSource
    var body: some View {
        VStack{
            TopNav(cart: $cart)
            SearchView(search:$searchItem)
            
            List{
                ForEach(result){
                    prdName in
                    NavigationLink(destination:CourseDetailView(product: prdName, cart: self.$cart, favorites: self.$favorites)){
                        VStack{
                            HStack{
                                Image(prdName.imgName)
                                    .resizable()
                                    .aspectRatio( contentMode: .fill)
                                    .frame(width: 80, height: 80)
                                    .clipped()
                                Spacer()
                                VStack{
                                    HStack{
                                        Text(prdName.title)
                                            .font(.title3)
                                            .fontWeight(.bold)
                                            .frame(height: 45, alignment: .leading)
                                        Spacer()
                                    }
                                    Text(prdName.descritption)
                                        .font(.body)
                                        .frame( height: 50, alignment: .leading)
                                        .offset(y:-12)
                                }
                                Spacer()
                                VStack{
                                    Text("₹ \(prdName.price)")
                                        .fontWeight(.semibold)
                                        .frame(width: 80, height: 20, alignment: .center)
                                        .font(.title3)
                                    Text(" \(prdName.originalPrice)/-")
                                        .strikethrough(true)
                                    
                                }
                            }
                        }
                    }
                    
                }
                .navigationBarHidden(true)
                
            }
            .listStyle(PlainListStyle())
            .searchable(text: $searchItem)
            
            
        }
    }
    var result:[Product]{
        if(searchItem.isEmpty){
            return products
        }else{
            return products.filter{($0.title).contains(searchItem)}
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var product:[Product] = DataSource
    @State static var items:[Product] = DataSource
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
                        .frame(width: 50, height: 50)
                        .foregroundColor(purpleBg)
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
                    .colorScheme(.light)
                
                Image(systemName: "magnifyingglass")
                    .frame(width: 55, height: 55)
                    .foregroundColor(purpleBg)
                    .background(lightGreyColor)
                    .cornerRadius(5)
                
            }.padding(.horizontal)
        }
    }
}
