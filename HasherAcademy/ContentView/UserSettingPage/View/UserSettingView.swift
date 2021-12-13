//
//  UserSettingView.swift
//  HasherAcademy
//
//  Created by niteshkumar72 on 13/12/21.
//

import SwiftUI

struct UserSettingView: View {
    @State var username:String=""
    @State var bandName:String=""
    var body: some View {
        VStack{
            HStack{
                Text("Profile")
                    .font(.largeTitle)
                    .fontWeight(.semibold)
                Spacer()
                Image(systemName: "square.and.pencil")
                    .resizable()
                    .frame(width: 35, height: 35, alignment: .center)
            }
            .padding()
            Divider()
            ScrollView{
                VStack{
                    
                    HStack{
                        Spacer()
                        Image("logo")
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                            .frame(width: 125, height: 125)
                            .foregroundColor(purpleBg)
                            .background(lightGreyColor)
                            .cornerRadius(5)
                        Spacer()
                    }
                    //            form details
                    VStack{
                        //                     Mark1:   name
                        VStack{
                            HStack{
                                Text("Name")
                                    .frame( height: 20, alignment: .leading)
                                    .font(.title3)
                                Spacer()
                            }
                            TextField("Name",text: $username)
                                .padding(.vertical)
                                .background(lightGreyColor)
                        }
                        .padding(.vertical)
                        //                        Mark 2 : Band name and Position
                        VStack{
                            HStack{
                                VStack{
                                    HStack{
                                        Text("Band Name")
                                            .font(.title3)

                                        Spacer()
                                    }
                                    TextField("Band name",text: $bandName)
                                        .padding(.vertical)
                                        .background(lightGreyColor)
                                }
                                Spacer()
                                VStack{
                                    HStack{
                                        Text("Position")
                                            .font(.title3)

                                        Spacer()
                                    }
                                    TextField("position name",text: $bandName)
                                        .padding(.vertical)
                                        .background(lightGreyColor)
                                }
                                
                            }
                        }.padding(.vertical)
                        
                        //                        Mark 3: Skills and levels
                        VStack{
                            HStack{
                                VStack{
                                    HStack{
                                        Text("Skills")
                                            .font(.title3)

                                        Spacer()
                                    }
                                    TextField("Mobility",text: $bandName)
                                        .padding(.vertical)
                                        .background(lightGreyColor)
                                }
                                Spacer()
                                VStack{
                                    HStack{
                                        Text("Level")
                                            .font(.title3)

                                        Spacer()
                                    }
                                    TextField("Expert",text: $bandName)
                                        .padding(.vertical)
                                        .background(lightGreyColor)
                                }
                                
                                
                            }
                        }.padding(.vertical)
//                        Mark 4: Bio
                        VStack{
                            HStack{
                                Text("Bio")
                                    .frame( height: 20, alignment: .leading)
                                    .font(.title3)

                                Spacer()
                            }
                            TextField("describe yourself",text: $username)
                                .padding(.vertical)
                                .background(lightGreyColor)
                        }
                        .padding(.vertical)
                        Spacer()
//                        mark 5: Logout button
                        Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/) {
                            Text("Logout")
                                .bold()
                                .font(.title)
                                .frame(width: 150, height: 40, alignment: .center)
                                .padding(.all,10)
                                .foregroundColor(.white)
                                .background(.black)
                        }
                        .cornerRadius(15)
//                        Mark 6 : Version
                        VStack{
                            Text("Version 1.0")
                                .font(.title3)
                        }

                        
                    }
                    
                    Spacer()
                }
            }        .padding()
            
        }.ignoresSafeArea()
    }
}

struct UserSettingView_Previews: PreviewProvider {
    static var previews: some View {
        UserSettingView()
            .previewInterfaceOrientation(.portrait)
    }
}
