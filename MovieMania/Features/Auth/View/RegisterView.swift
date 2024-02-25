//
//  RegisterView.swift
//  MovieMania
//
//  Created by Boubacar sidiki barry on 20.02.24.
//

import SwiftUI
import GoogleSignInSwift

struct RegisterView: View {
    @State private var userName = ""
    @State private var email = ""
    @State private var password = ""
    @State private var confirmPassword = ""
    
    @EnvironmentObject var viewModel : AuthenticationViewModel
    
    var body: some View {
        NavigationStack {
            ZStack {
                
                Image(.bgMovieMania)
                    .resizable()
                    .scaledToFill()
                    .ignoresSafeArea()
                
                
                LinearGradient(gradient: Gradient(colors: [
                    Color(red: 0, green: 0, blue: 0 ),
                    Color(red: 0.07, green: 0.31, blue: 0.21, opacity: 0.5),
                    Color(red: 0, green: 0, blue: 0 )
                ]), startPoint: .top, endPoint: .bottom)
                .ignoresSafeArea()
                
                
                
                VStack{
                    Text("Login to Your Account ")
                        .foregroundStyle(.white)
                        .fontWeight(.bold)
                        .font(.title)
                        .padding(.top ,60)
                    
                    Spacer()
                    
                    //forms field
                    VStack(spacing: 14){
                        CustomInput(text: $userName,  placeholder: "john Doe", logoName: "person")
                            .textInputAutocapitalization(.never)
                            .keyboardType(.emailAddress)
                        
                        
                        CustomInput(text: $email,  placeholder: "name@example.com", logoName: "envelope")
                            .textInputAutocapitalization(.never)
                            .keyboardType(.emailAddress)
                        
                        CustomInput(text: $password,  placeholder: "", isSecureField: true, logoName: "lock")
                        
                        HStack {
                            CustomInput(text: $confirmPassword,  placeholder: "", isSecureField: true, logoName: "lock")
                            
                            if(!password.isEmpty && !confirmPassword.isEmpty){
                                if (password == confirmPassword){
                                    Image(systemName: "checkmark.circle.fill")
                                        .foregroundStyle(.green)
                                }else{
                                    Image(systemName: "xmark.circle.fill")
                                        .foregroundStyle(.red)
                                }
                            }
                        }
                        
                        
                        
                        Button {
                            Task{
                                try  await
                                viewModel.createUser(email:email , password:password ,userName: userName)
                            }
                        } label: {
                            HStack{
                                Text("CREATE")
                                    .fontWeight(.semibold)
                                Image(systemName: "arrow.right")
                            }
                            .foregroundStyle(.white)
                            .frame(width: UIScreen.main.bounds.width - 32, height: 48)
                        }
                        .frame(width: 300 ,height: 50)
                        .background(.mmPurple)
                        .disabled(!formIsValid)
                        .opacity(formIsValid ? 1.0 : 0.5)
                        .foregroundStyle(.white)
                        .clipShape(RoundedRectangle(cornerRadius: 40))
                    }
                    .padding(.top , 30)
                    HStack{
                        Rectangle()
                            .fill(.white)
                            .frame(width: 110 ,height: 2)
                        Text("Or continue with")
                            .foregroundStyle(.white)
                        
                        Rectangle()
                            .fill(.white)
                            .frame(width: 110 ,height: 2)
                        
                    }.padding(.top , 30)
                    
                    
                    HStack{
                        GoogleSignInButton(style: .icon , state: .normal) {
                            
                        }
                        .clipShape(Circle())
                        
                    }
                    .padding(.bottom , 30)
                    
                    Spacer()
                    
                    HStack{
                        Text("Don't have an account?")
                            .foregroundStyle(.white)
                        NavigationLink{
                            LoginView()
                        }label: {
                            Text("Sign up")
                                .fontWeight(.bold)
                                .foregroundStyle(.mmPurple)
                        }
                        
                    }
                    .padding(.bottom ,20)
                    .font(.system(size: 14))
                    
                }
                
            }
            .navigationBarBackButtonHidden(true)
        }
    }
}

extension  RegisterView : AuthenticationFormProtocol {
    var formIsValid: Bool {
        return isValidEmail(email)
        && !password.isEmpty
        && password.count > 5
        && userName.count > 2
        && password == confirmPassword
        
        
    }
}

#Preview {
    NavigationStack {
        RegisterView()
    }
}
