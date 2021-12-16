//
//  ContentView.swift
//  HasherAcademy
//
//  Created by niteshkumar72 on 12/12/21.
//

import SwiftUI
import UIKit

var purple=Color(red: 154/255.0, green: 6/255.0, blue: 128/255.0)
var lightGreyColor=Color(red: 239.0/255.0, green: 243.0/255.0, blue: 244.0/255.0)

let StoredUsername="Nitesh"
let StoredPassword="nitesh"
struct ContentView: View {
    
    
    @State var username:String=""
    @State var password:String=""
    @State var authenticationDidFail:Bool=false
    @State var authenticationDidSuccess:Bool=false
    @State var nextPage:Bool=false
    var body: some View {
        NavigationView{
            ScrollView{
                Spacer()
                VStack{
                    Spacer()
                    CompanyLogo()
                    if authenticationDidFail{
                        Text("Information not correct. Try Again.")
                            .foregroundColor(.red)
                    }
                        UsernameTextField(username: $username)
                        PasswordTextField(password: $password)
                        HStack{
                            Button(action: {
                                if self.username==StoredUsername && self.password == StoredPassword{
                                    self.authenticationDidSuccess=true
                                    
                                }else{
                                    self.authenticationDidFail=true;
                                }
                            }) {
                                if(self.authenticationDidSuccess){
                                    NavigationLink(destination:ContentUIView()) {
                                        LoginButtonText()
                                    }
                                } else{
                                    LoginButtonText()
                                }
                            }
                            .cornerRadius(15.0)
                            .padding(.bottom,10)
                            Spacer()
                            NavigationLink(destination:ContentUIView()) {
                            ForgetPasswordText()
                            }
                        }
                        CreateAccountButton()
                        Spacer()
                    }
                }
                .padding(.horizontal)
                .navigationBarBackButtonHidden(true)
                .navigationBarHidden(true)
            }
            .navigationViewStyle(StackNavigationViewStyle())
        }
    }
    struct ContentView_Previews: PreviewProvider {
        static var previews: some View {
            ContentView()
                .previewInterfaceOrientation(.portrait)
        }
    }
    
    
    struct CompanyLogo: View {
        var body: some View {
            Image("logo")
                .resizable()
                .aspectRatio( contentMode: .fill)
                .frame(width: 150, height: 150)
                .clipped()
                .cornerRadius(150)
        }
    }
    
    struct UsernameTextField: View {
        @Binding var username:String
        var body: some View {
            TextField("Username", text: $username)
                .padding()
                .background(lightGreyColor)
                .cornerRadius(5.0)
        }
    }
    
    struct PasswordTextField: View {
        @Binding var password:String
        var body: some View {
            SecureField("Password",text: $password)
                .padding()
                .background(lightGreyColor)
                .cornerRadius(5.0)
                .padding(.bottom,15)
        }
    }
    
    struct ForgetPasswordText: View {
        var body: some View {
            Text("Forget password!")
                .foregroundColor(.accentColor)
                .font(.body)
                .fontWeight(.semibold)
        }
    }
    
    struct CreateAccountButton: View {
        var body: some View {
            Button(action: {
                print("Create an account")
            }
                   
            ) {
                Text("Create Account")
                    .frame(width: 200, height: 20)
                    .padding()
                    .background(lightGreyColor)
                    .foregroundColor(.black)
                
            }
            .cornerRadius(15)
        }
    }
    
    struct LoginButtonText: View {
        var body: some View {
            Text("LOGIN")
                .bold()
                .font(.title)
                .frame(width: 120, height: 30, alignment: .center)
                .padding(.all,10)
                .foregroundColor(.white)
                .background(purple)
        }
    }
