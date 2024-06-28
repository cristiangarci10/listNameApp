//
//  ProfileView.swift
//  listNameApp
//
//  Created by Cristian Garcia on 26/6/24.
//

import SwiftUI

struct ProfileView: View {
    
    var user: User
    
    var body: some View {
        ZStack {
            VStack{
              
                Image("fondo")
                 .resizable()
                 .scaledToFill()
                 .frame(height: 130)
                 
                VStack{
                    
                    AsyncImageView(image: user.avatar, width: 120, height: 120)
                    .clipShape(Circle())
                    
                    HStack{
                        Text("\(user.name) \(user.lastName)")
                            .font(.custom("Creepster-Regular", size: 30))
                            .foregroundStyle(Color(red: 222 / 255, green: 174 / 255, blue: 194 / 255))
                            .lineLimit(1)
                    }
                    VStack(alignment:.leading){
                        detailCardView(systemImageName: "mail", textDetail: user.email)
                        Divider()
                        detailCardView(systemImageName: "mappin.and.ellipse", textDetail: user.location ?? "")
                        Divider()
                        detailCardView(systemImageName: "phone", textDetail: user.phone ?? "")
                        Divider()
                        detailCardView(systemImageName: "calendar", textDetail: user.birthYear ?? "")
                    }
                    .padding()
                    .frame(minWidth: 300,alignment: .leading)
                    .background(Color.white)
                    .cornerRadius(10)
                    .shadow(radius: 5)
                    .padding(.horizontal)
                    .padding(.top)
                    
                }.padding(.top,-5)
                Spacer()
            }
            
            
        }.ignoresSafeArea()
    }
}

#Preview {
    ProfileView(user: User(id: 1, email: "", name: "", lastName: "", avatar: ""))
}

extension ProfileView {
    
    struct detailCardView : View {
        
        var systemImageName: String
        var textDetail : String
        
        var body: some View {
            HStack{
                Image(systemName:systemImageName)
                    .resizable()
                    .frame(width: 20,height: 15)
                    .foregroundColor(.blue)
                    .padding(.leading,3)
                Text("\(textDetail)")
            }.padding(.vertical)
        }
    }
}
