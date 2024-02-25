//
//  CustomInput.swift
//  MovieMania
//
//  Created by Boubacar sidiki barry on 19.02.24.
//

import SwiftUI

struct CustomInput: View {
    @Binding var text : String
//    let  title : String
    let placeholder : String
    var isSecureField : Bool  = false
    var logoName : String
    
    var body: some View {
        
        VStack(alignment : .leading,spacing:12){
//            Text(title)
//                .foregroundStyle(.white)
//                .fontWeight(.semibold)
//                .font(.footnote)
            
            if isSecureField {
                HStack {
                    Image(systemName: logoName)
                        .foregroundStyle(.mmPurple)
                    
                    SecureField(placeholder, text: $text)
                        
                }
                .padding()
                .font(.system(size: 14))
                .frame(width: 300 , height: 40)
                .background(.white.opacity(0.8))
                .clipShape(RoundedRectangle(cornerRadius: 12))
            }else {
                HStack {
                    Image(systemName: logoName)
                        .foregroundStyle(.mmPurple)
                    TextField(placeholder, text: $text)
                        
                }.padding()
                    .font(.system(size: 14))
                    .frame(width: 300 , height: 40)
                    .background(.white.opacity(0.8))
                .clipShape(RoundedRectangle(cornerRadius: 12))
            }
        }
    }
}

#Preview {
    CustomInput(text: .constant(""),  placeholder: "name@example.com", logoName: "envelope")
}
