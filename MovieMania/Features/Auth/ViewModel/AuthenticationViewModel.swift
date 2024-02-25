//
//  AuthenticationViewModel.swift
//  MovieMania
//
//  Created by Boubacar sidiki barry on 20.02.24.
//

import Foundation
import Firebase
import FirebaseFirestoreSwift

@MainActor
class AuthenticationViewModel : ObservableObject {
    @Published var userSession : FirebaseAuth.User?
    @Published    var currentUser : User?
    
    init(){
        
        registerAuthStateHandler()
        Task{
            await fetchUserData()
        }
    }
    
    private var authStateHandler: AuthStateDidChangeListenerHandle?

     func registerAuthStateHandler() {
       if authStateHandler == nil {
         authStateHandler = Auth.auth().addStateDidChangeListener { auth, user in
           self.userSession = user
        
         }
       }
     }
    
    
    func createUser( email : String , password : String ,userName : String ) async throws {
        do{
            let result = try await Auth.auth().createUser(withEmail: email, password: password)
            //update usersession
            self.userSession = result.user
            
            //save user data into firestore
//            try await  uploadUserData(withEmail: email, userName: userName, id: result.user.uid)
            let user = User(id: result.user.uid, userName: userName, email: email)
            
            let userData = try Firestore.Encoder().encode(user)
            
            try await Firestore.firestore().collection("users").document(user.id).setData(userData)
            
            await fetchUserData()
            
        }catch{
            print("DEBUG: Failed to create user with error \(error.localizedDescription) ")
        }
    }
    
    func signIn(withEmail  email : String , password: String) async throws {
        do{
            let  result  =  try await  Auth.auth().signIn(withEmail: email, password: password)
            self.userSession = result.user
           
            
            await fetchUserData()
        }catch{
            print("DEBUG: Failed to log In with error \(error.localizedDescription) ")
        }
    }
    
    
    
    func uploadUserData(withEmail email : String , userName : String,id: String ) async throws {
        print("in uploadUder")
//        let user = User(id: id, userName: userName, email: email)
//        
//        let userData = try Firestore.Encoder().encode(user)
//        
//        try await Firestore.firestore().collection("users").document(id).setData(userData)
        
        
    }
  
    func fetchUserData() async {
        guard let uid = Auth.auth().currentUser?.uid else {return}
        
        guard let snapshot = try? await Firestore.firestore().collection("users").document(uid).getDocument() else {return}
        
        self.currentUser = try? snapshot.data(as: User.self)
        
       
    }
    
    
    func signOut(){
        do{
            try Auth.auth().signOut()
            self.userSession = nil
            self.currentUser = nil
        }catch{
            print("DEBUG: Failed to sign out with error \(error.localizedDescription) ")
        }
    }
    
}
