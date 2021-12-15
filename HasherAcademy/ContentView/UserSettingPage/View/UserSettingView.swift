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
    @State var position:String=""
    @State var skills:String=""
    @State var level:String=""
    @State var bio:String=""
    
    @Environment(\.editMode) private var editMode
    @State private var disableTextField = true
    

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
                        BioView(bio:$bio)
                        Spacer()
                        //                        mark 5: Logout button
                        Button(action: {}) {
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
            Image("logo")
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(width: 125, height: 125)
                .foregroundColor(purpleBg)
                .background(lightGreyColor)
                .cornerRadius(5)
                
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
                    .frame( height: 20, alignment: .leading)
                    .font(.title3)
                Spacer()
            }
            TextField("Name",text: $username)
                .padding(.vertical)
                .background(lightGreyColor)
                .cornerRadius(5)
                .disabled(disableTextField)
        }
        .padding(.vertical)
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
                        Text("Band Name")
                            .font(.title3)
                        
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
                            .font(.title3)
                        
                        Spacer()
                    }
                    TextField("position name",text: $position)
                        .padding(.vertical)
                        .background(lightGreyColor)
                        .cornerRadius(5)

                }
                
            }
        }.padding(.vertical)
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
                            .font(.title3)
                        
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
                            .font(.title3)
                        
                        Spacer()
                    }
                    TextField("Expert",text: $level)
                        .padding(.vertical)
                        .background(lightGreyColor)
                        .cornerRadius(5)

                }
                
                
            }
        }.padding(.vertical)
    }
}

struct BioView: View {
    @Binding var bio:String
    var body: some View {
        VStack{
            HStack{
                Text("Bio")
                    .frame( height: 20, alignment: .leading)
                    .font(.title3)
                
                Spacer()
            }
            TextField("describe yourself",text: $bio)
                .padding(.vertical)
                .background(lightGreyColor)
                .cornerRadius(5)

        }
        .padding(.vertical)
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
            .background(.black)
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
            Image(systemName: imageName)
                .resizable()
                .frame(width: 35, height: 35, alignment: .center)
                .onTapGesture {
                    print("logo image tapped")
                    self.imageName="checkmark.circle.fill"
                    
                }
                
        }
        .padding()
    }
}
