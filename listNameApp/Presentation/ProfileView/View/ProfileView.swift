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
                    
                    AsyncImage(url: URL(string: user.avatar)) { phase in
                        if let image = phase.image {
                            image.resizable()
                                .aspectRatio(contentMode: .fill)
                                .frame(width: 120, height: 120)
                                .clipShape(Circle())
                        } else if phase.error != nil {
                            Color.red // Indicates an error.
                                .frame(width: 50, height: 50)
                                .clipShape(Circle())
                        } else {
                            Color.gray // Acts as a placeholder.
                                .frame(width: 50, height: 50)
                                .clipShape(Circle())
                        }
                    }
                    
                    .frame(width: 120, height: 120,alignment: .top)
                    .clipped()
                    .cornerRadius(10)
                    
                    HStack{
                        Text("\(user.name) \(user.lastName)")
                            .font(.custom("Creepster-Regular", size: 30))
                            .foregroundColor(.green)
                            .lineLimit(1)
                        
                    }
                   
                    VStack(alignment:.leading){
                        HStack{
                            Image(systemName:"mail")
                                .resizable()
                                .frame(width: 20,height: 15)
                                .foregroundColor(.blue)
                                .padding(.leading,3)
                            Text("\(user.email)")
                        }.padding(.vertical)
                        Divider()
                        HStack{
                            Image(systemName:"mappin.and.ellipse")
                                .resizable()
                                .frame(width: 18,height: 20)
                                .foregroundColor(.blue)
                                .padding(.leading,4)
                            Text("\(user.location ?? "")")
                        }.padding(.vertical)
                        Divider()
                        HStack{
                            Image(systemName:"phone")
                                .resizable()
                                .frame(width: 18,height: 18)
                                .foregroundColor(.blue)
                                .padding(.leading,4)
                            Text("\(user.phone ?? "")")
                        }.padding(.vertical)
                        Divider()
                        HStack{
                            Image(systemName:"calendar")
                                .resizable()
                                .frame(width: 20,height: 20)
                                .foregroundColor(.blue)
                                .padding(.leading,4)
                            Text("\(user.birthYear ?? "")")
                        }.padding(.vertical)
                    
                    }
                    .padding()
                    .frame(minWidth: 300,alignment: .leading)
                    .background(Color.white)
                    .cornerRadius(10)
                    .shadow(radius: 5)
                    .padding(.horizontal)
                    
                }.padding(.top,-5)
                Spacer()
            }
            
            
        }.ignoresSafeArea()
    }
}

#Preview {
    ProfileView(user: User(id: 1, email: "", name: "", lastName: "", avatar: ""))
}
