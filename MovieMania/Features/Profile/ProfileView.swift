//
//  ProfileView.swift
//  MovieMania
//
//  Created by Boubacar sidiki barry on 20.02.24.
//

import SwiftUI

struct ProfileView: View {
    @EnvironmentObject   var viewModel : AuthenticationViewModel
    var body: some View {
        if let user = viewModel.currentUser {
            List {
                Section{
                    HStack{
                        Text(user.initials)
                            .font(.title)
                            .fontWeight(.semibold)
                            .foregroundStyle(.white)
                            .frame(width: 72, height: 72)
                            .background(Color(.systemGray3))
                            .clipShape(Circle())
                        
                        VStack(alignment : .leading){
                            Text(user.userName)
                                .font(.subheadline)
                                .fontWeight(.semibold)
                                .padding(.top ,4)
                            
                            Text(user.email)
                                .font(.footnote)
                                .foregroundStyle(.gray)
                        }
                    }
                }
                
                Section("General") {
                    HStack {
                        SettingsRowView(imageName: "gear", title: "Version", tintColor: .gray )
                        
                        Spacer()
                        
                        Text("1.0.0")
                            .foregroundStyle(.gray)
                    }
                }
                
                Section("Account") {
                    
                    Button(action: {viewModel.signOut()}, label: {
                        SettingsRowView(imageName: "arrow.left.circle.fill", title: "Sign Out", tintColor: .red)
                    })
                    
                    SettingsRowView(imageName: "xmark.circle.fill", title: "Delete Account", tintColor: .red)
                    
                    
                    }
                
                    
            }
        }
        }
        
    
}

#Preview {
    ProfileView()
}

