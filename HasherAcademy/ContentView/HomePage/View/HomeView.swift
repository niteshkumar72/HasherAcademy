//
//  HomeView.swift
//  HasherAcademy
//
//  Created by niteshkumar72 on 13/12/21.
//

import SwiftUI
var lightGreyClr=Color(red: 239.0/255.0, green: 243.0/255.0, blue: 244.0/255.0)
var purpleBg=Color(red: 154/255.0, green: 6/255.0, blue: 128/255.0)

struct HomeView: View {
    @State var searchItem:String=""
    var body: some View {
        VStack{
            HStack{
                Text("Courses")
                    .font(.largeTitle)
                    .fontWeight(.semibold)
                Spacer()
                Image(systemName: "cart.fill")
                    .resizable()
                    .frame(width: 35, height: 35, alignment: .center)
            }
            .padding()
            Divider()
            Spacer()
            VStack{
                HStack{
                    TextField("Search", text: $searchItem)
                        .padding()
                        .background(lightGreyClr)
                        .cornerRadius(5.0)
                    
                    Image(systemName: "magnifyingglass")
                        .frame(width: 55, height: 55)
                        .foregroundColor(purpleBg)
                        .background(lightGreyColor)
                        .cornerRadius(5)
                    
                }.padding()
                
//              list of courses
                VStack{
                    HStack{
                        Image("logo")
                            .resizable()
                            .aspectRatio( contentMode: .fill)
                            .frame(width: 80, height: 80)
                            .clipped()
                            .background(.blue)
                        Spacer()
                        VStack{
                            Text("The complete react native course")
                                .font(.title3)
                                .fontWeight(.bold)
                                .frame(height: 45, alignment: .leading)
                            Text("In this course you will learn how to make cross plateform app (android / iOS )")
                                .font(.title3)
                                .frame( height: 50, alignment: .leading)
                                .offset(y:-12)
                        }
                        Spacer()
                        VStack{
                            Text("$199")
                                .fontWeight(.semibold)
                                .frame(width: 80, height: 20, alignment: .center)
                                .font(.title3)
                            Text("$600")
                                .strikethrough(true)

                        }
                    }
                }
                .padding()
                Spacer()
                
            }
            Spacer()
            
        }
        .ignoresSafeArea()
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
            .previewInterfaceOrientation(.portrait)
    }
}
