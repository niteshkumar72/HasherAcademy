//
//  CourseDetailView.swift
//  HasherAcademy
//
//  Created by niteshkumar72 on 13/12/21.
//

import SwiftUI

struct CourseDetailView: View {
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
            VStack{
                Image("logo")
                    .resizable()
                    .aspectRatio(contentMode:.fit)
                    .background(.green)
                
//                Mark 2: Title
                Text("The complete guide of swiftUI for mac/iOS development")
                    .font(.title2)
                    .fontWeight(.semibold)
                
//                Mark 3: courseDetails
                Text("This is a SwiftUI reference guide and cookbook of code for everything SwiftUI (note - this is not a project based course)")
                    .padding(.vertical)

            }
            Spacer()
            VStack{
                Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/) {
                    Text("ADD TO CART")
                        .bold()
                        .font(.title)
                        .aspectRatio(contentMode: .fill)
                        .padding()
                        .foregroundColor(.white)
                        .background(.green)
                }.cornerRadius(15)
                
            }
            Spacer()
        }
        .ignoresSafeArea()
    }
}

struct CourseDetailView_Previews: PreviewProvider {
    static var previews: some View {
        CourseDetailView()
    }
}
