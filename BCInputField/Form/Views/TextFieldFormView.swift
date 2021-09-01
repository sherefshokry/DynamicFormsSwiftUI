//
//  TextFormView.swift
//  BCInputField
//
//  Created by SherifShokry on 31/08/2021.
//

import Foundation
import SwiftUI


struct TextFieldFormView : View {
   
    let component : TextFormComponent
    
    var body : some View {
        
        VStack(alignment: .leading, spacing: /*@START_MENU_TOKEN@*/nil/*@END_MENU_TOKEN@*/, content: {
            
            TextField(component.placeHolder , text: .constant(""))
                .frame(maxWidth : .infinity,minHeight: 44, alignment: .center)
                .padding(.leading,5)
                .keyboardType(component.keyboardType)
                .background(RoundedRectangle(cornerRadius: 10).stroke(Color.gray.opacity(0.25)))
            Text("Error Here")
                .font(.system(size: 12, weight: .semibold, design: .default))
                .foregroundColor(.red)
            
        })
        
    }
    
    
}
