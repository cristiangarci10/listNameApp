//
//  ContentView.swift
//  listNameApp
//
//  Created by Cristian Garcia on 25/6/24.
//

import SwiftUI

struct PrincipalView: View {
    @StateObject private var viewModel = UserViewModel()
    @State private var searchText = ""
    

       var body: some View {
           NavigationView{
               ZStack{
                   VStack{
                       searchElement(searchText: $searchText, placeholder: "Buscar usuario")
                           .padding(.vertical)
                           .padding(.horizontal,25)
                       LazyView(users: viewModel.users, searchText: searchText)
                   }  .padding(.horizontal)
               }.background{
                   Image("degradado")
                       .resizable()
                       .scaledToFill()
                       .ignoresSafeArea()
               }
           
           }
          
       }
}


#Preview {
    PrincipalView()
}

extension PrincipalView {

    struct searchElement: View {
        
        @Binding var searchText: String
        var placeholder: String
        
        var body: some View {
            HStack{
                Image(systemName: "magnifyingglass").foregroundColor(Color.gray.opacity(0.4))
                TextField(placeholder, text: $searchText)
                    .font(.custom("Cochin", size: 12))
                    .foregroundColor(.blue)
                    .padding(.trailing)
                    .textFieldStyle(PlainTextFieldStyle())
                    .frame(height: 8)
                if !searchText.isEmpty {
                    Button {
                        searchText = ""
                    } label: {
                        Image(systemName: "x.circle")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 15,height: 15)
                            .foregroundColor(.blue)
                    }
                    
                }
                
            }
            .padding()
            .background(Color.white)
            .cornerRadius(10)
            .shadow(radius: 5)
            .padding(.top,5)
        }
    }
    
    
    struct LazyView: View {
        
        let columns = [
                GridItem(.fixed(150)),
                GridItem(.fixed(150))
            ]
        
        var users: [User]
        var searchText: String
        
        var searchUsers: [User] {
          
            if !searchText.isEmpty{
                return users.filter { $0.name.lowercased().contains(searchText.lowercased()) }
            } else {
                return users
            }
         
        }
        
        var body: some View {
            ScrollView {
                LazyVGrid(columns: columns, spacing: 1) {
                    ForEach(searchUsers.sorted{$0.id < $1.id}) { user in
                        VStack(alignment: .center) {
                            NavigationLink(destination: ProfileView(user: user)) {
                                CardView(image: user.avatar, name: user.name, lastName: user.lastName, email: user.email)
                                
                            }
                            .padding(.horizontal)
                        }
                        .padding(.top)
                    }
                }
                
            }
        }
    }
    
    struct CardView: View {
        var image: String?
        var name: String
        var lastName: String
        var email: String
        
        var body: some View {
            ZStack{
                VStack{
                    AsyncImage(url: URL(string: image ?? "")) { phase in
                                  if let image = phase.image {
                                      image.resizable()
                                          .aspectRatio(contentMode: .fill)
                                          .frame(width: 100, height: 100)
                                          .clipShape(Rectangle())
                                  } else if phase.error != nil {
                                      Color.red // Indicates an error.
                                          .frame(width: 50, height: 50)
                                          .clipShape(Rectangle())
                                  } else {
                                      Color.gray // Acts as a placeholder.
                                          .frame(width: 50, height: 50)
                                          .clipShape(Rectangle())
                                  }
                              }
                    .frame(width: 100, height: 100,alignment: .top) // Ensure the frame is set here as well
                              .clipped()
                              .cornerRadius(10)
                    Spacer()
                    Text("\(name) \(lastName)")
                    .fixedSize()
                }
                  
                            
                        
             
            }
            .frame(minWidth: 110,minHeight: 150)
            .padding()
            .background(Color.white)
            .cornerRadius(10)
            .shadow(radius: 5)
        }
    }
}

