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
                VStack{
                    HStack{
                        Text("Name")
                            .frame( height: 20, alignment: .leading)
                        Spacer()
                    }
                    TextField("Name",text: $username)
                        .padding(.vertical)
                        .foregroundColor(.white)
                        .background(.red)
                }
                
                HStack{
                    VStack{
                        Text("Band Name")
                        TextField("Band name",text: $bandName)
                            .padding(.vertical)
                            .foregroundColor(.white)
                            .background(.red)
                    }
                    Spacer()
                    VStack{
                        Text("Position")
                        TextField("position name",text: $bandName)
                            .padding(.vertical)
                            .foregroundColor(.white)
                            .background(.red)
                    }
                    
                }
                HStack{
                    VStack{
                        Text("Skills")
                        TextField("Mobility",text: $bandName)
                            .padding(.vertical)
                            .foregroundColor(.white)
                            .background(.red)
                    }
                    Spacer()
                    VStack{
                        Text("Level")
                        TextField("Expert",text: $bandName)
                            .padding(.vertical)
                            .foregroundColor(.white)
                            .background(.red)
                    }
                    
                }
                VStack{
                    HStack{
                        Text("Bio")
                            .frame( height: 20, alignment: .leading)
                        Spacer()
                    }
                    TextField("describe yourself",text: $username)
                        .padding(.vertical)
                        .foregroundColor(.white)
                        .background(.red)
                }
                
                
            }
            
            Spacer()
        }
    }
}

struct UserSettingView_Previews: PreviewProvider {
    static var previews: some View {
        UserSettingView()
            .previewInterfaceOrientation(.portrait)
    }
}
