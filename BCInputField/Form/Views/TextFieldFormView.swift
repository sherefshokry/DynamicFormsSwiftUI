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
    
    @EnvironmentObject var contentBuilder : FormContentBuilderImpl
    @State private var text = ""
    @State private var error : ValidationError?
    
    
    var body : some View {
        
        VStack(alignment: .leading, spacing: /*@START_MENU_TOKEN@*/nil/*@END_MENU_TOKEN@*/, content: {
            
            TextField(component.placeHolder , text: $text)
                .frame(maxWidth : .infinity,minHeight: 44, alignment: .center)
                .padding(.leading,5)
                .keyboardType(component.keyboardType)
                .background(RoundedRectangle(cornerRadius: 10)
                                .stroke( error == nil ? Color.gray.opacity(0.25) : Color.red ))
            Text(error?.errorDescription ?? "")
                .font(.system(size: 12, weight: .semibold, design: .default))
                .foregroundColor(.red)
            
        }).onChange(of: text, perform: { value in
            
            contentBuilder.update(text, in: component)
            
            error = component.validations.compactMap{
                $0.validate(text)
            }.first
            
            
        })
        
    }
    
    
}
