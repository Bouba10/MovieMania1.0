//
//  ContentView.swift
//  MovieMania
//
//  Created by Boubacar sidiki barry on 20.02.24.
//

import SwiftUI

struct ContentView: View {
    @EnvironmentObject var viewModel : AuthenticationViewModel
    
    var body: some View {
        Group{
            if(viewModel.userSession != nil){
                TabBarView()
            }else{
                LoginView()
            }
        }
    }
}

#Preview {
    ContentView()
}
