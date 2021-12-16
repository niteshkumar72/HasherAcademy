//
//  UserSettingView.swift
//  HasherAcademy
//
//  Created by niteshkumar72 on 13/12/21.
//

import SwiftUI

struct UserSettingView: View {
    @State var username:String="Nitesh Kumar"
    @State var bandName:String="B7"
    @State var position:String="SD-1"
    @State var skills:String="iOS Developer"
    @State var level:String="Intermediate"
    @State var bio:String="I'm iOS developer"
    
    @Environment(\.editMode) private var editMode
    @State private var disableTextField = true
    
    var purpleBg=Color(red: 154/255.0, green: 6/255.0, blue: 128/255.0)
    
    var body: some View {
        
        VStack{
            TopNavBar()
                .padding(.top,30)
            
            Divider()
            ScrollView{
                VStack{
                    
                    LogoView()
                    //            form details
                    VStack{
                        //                     Mark1:   name
                        NameView(username:$username,disableTextField:$disableTextField)
                        //                        Mark 2 : Band name and Position
                        brandAndPositionView(bandName:$bandName,position:$position)
                        
                        //                        Mark 3: Skills and levels
                        SkillsAndLevelsView(skills:$skills,level:$level)
                        //                        Mark 4: Bio
                        BioView(bio:$bio,disableTextField:$disableTextField)
                        Spacer()
                        //                        mark 5: Logout button
                        Button(action: {
                            
                        }) {
                            LogoutTextView()
                        }
                        .cornerRadius(15)
                        //                        Mark 6 : Version
                        VersionTextView()
                        
                        
                    }
                    
                    
                    Spacer()
                }
            }
            .padding(.bottom,30)
            .navigationBarHidden(true)
            .navigationBarBackButtonHidden(true)
            
        }.ignoresSafeArea()
            .padding(.horizontal)
    }
}

struct UserSettingView_Previews: PreviewProvider {
    static var previews: some View {
        UserSettingView()
            .previewInterfaceOrientation(.portrait)
    }
}

struct LogoView: View {
    var body: some View {
        HStack{
            Spacer()
            Image("niteshkumar")
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(width: 125, height: 125)
                .foregroundColor(purpleBg)
                .background(lightGreyColor)
                .cornerRadius(125)
            
            Spacer()
        }
    }
}

struct NameView: View {
    @Binding var username:String
    @Binding var disableTextField:Bool
    var body: some View {
        VStack{
            HStack{
                Text("Name")
                    .fontWeight(.medium)
                    .frame( height: 20, alignment: .leading)
                    .font(.title2)
                Spacer()
            }
            TextField("Name",text: $username)
                .padding(.vertical)
                .background(lightGreyColor)
                .cornerRadius(5)
                .disabled(disableTextField)
        }
        .padding(.top)
    }
}

struct brandAndPositionView: View {
    @Binding var bandName:String
    @Binding var position:String
    var body: some View {
        VStack{
            HStack{
                VStack{
                    HStack{
                        Text("Band Name")                    .fontWeight(.medium)
                            .font(.title2)
                        
                        Spacer()
                    }
                    TextField("Band name",text: $bandName)
                        .padding(.vertical)
                        .background(lightGreyColor)
                        .cornerRadius(5)
                    
                }
                Spacer()
                VStack{
                    HStack{
                        Text("Position")
                            .fontWeight(.medium)
                            .font(.title2)
                        
                        Spacer()
                    }
                    TextField("position name",text: $position)
                        .padding(.vertical)
                        .background(lightGreyColor)
                        .cornerRadius(5)
                    
                }
                
            }
        }
    }
}

struct SkillsAndLevelsView: View {
    @Binding var skills:String
    @Binding var level:String
    var body: some View {
        VStack{
            HStack{
                VStack{
                    HStack{
                        Text("Skills")
                            .fontWeight(.medium)
                            .font(.title2)
                        
                        Spacer()
                    }
                    TextField("Mobility",text: $skills)
                        .padding(.vertical)
                        .background(lightGreyColor)
                        .cornerRadius(5)
                    
                }
                Spacer()
                VStack{
                    HStack{
                        Text("Level")
                            .fontWeight(.medium)
                            .font(.title2)
                        
                        Spacer()
                    }
                    TextField("Expert",text: $level)
                        .padding(.vertical)
                        .background(lightGreyColor)
                        .cornerRadius(5)
                    
                }
                
                
            }
        }
    }
}

struct BioView: View {
    @Binding var bio:String
    @Binding var disableTextField:Bool
    var body: some View {
        VStack{
            HStack{
                Text("Bio")
                    .fontWeight(.medium)
                    .frame( height: 20, alignment: .leading)
                    .font(.title2)
                Spacer()
            }
            TextField("describe yourself",text: $bio)
                .padding(.vertical)
                .background(lightGreyColor)
                .cornerRadius(5)
                .disabled(false)
            
        }
    }
}

struct LogoutTextView: View {
    var body: some View {
        Text("Logout")
            .bold()
            .font(.title)
            .frame(width: 150, height: 40, alignment: .center)
            .padding(.all,10)
            .foregroundColor(.white)
            .background(purpleBg)
    }
}

struct VersionTextView: View {
    var body: some View {
        VStack{
            Text("Version 1.0")
                .font(.title3)
                .padding(.bottom,10)
            
        }
    }
}

struct TopNavBar: View {
    @State var imageName = "square.and.pencil"
    var body: some View {
        HStack{
            Text("Profile")
                .font(.largeTitle)
                .fontWeight(.semibold)
            Spacer()
            Button(action: {
                print("hello")
            }) {
                if(1==1){
                    HStack{
                        Text("Edit")
                            .offset(x:20,y:1)
                        Image(systemName:"square.and.pencil")
                            .foregroundColor(purpleBg)
                            .frame(width: 50, height: 50, alignment: .center)
                            .cornerRadius(10)
                        
                    }
                } else {
                    HStack{
                        Text("Done")
                            .offset(x:20,y:1)
                        Image(systemName: "checkmark")
                            .foregroundColor(Color.green)
                            .frame(width: 50, height: 50, alignment: .center)
                            .cornerRadius(10)
                    }
                }
                
            }
            
        }
        .padding()
    }
}
