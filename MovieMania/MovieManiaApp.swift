//
//  MovieManiaApp.swift
//  MovieMania
//
//  Created by Boubacar sidiki barry on 13.02.24.
//

import SwiftUI
import FirebaseCore

@main
struct MovieManiaApp: App {
    @StateObject var viewModel = AuthenticationViewModel()
    
    init(){
        FirebaseApp.configure()
        print("config firebase")
    }
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(viewModel)
            
        }
    }
}
