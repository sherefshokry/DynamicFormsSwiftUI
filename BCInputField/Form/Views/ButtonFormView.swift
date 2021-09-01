//
//  ButtonFormView.swift
//  BCInputField
//
//  Created by SherifShokry on 31/08/2021.
//

import Foundation
import SwiftUI


struct ButtonFormView : View {
   
    
   
    typealias ButtonActionHandler = (_ formId : FormField) -> Void
    
    let component : ButtonFormComponent
    let handler : ButtonActionHandler
    
     init(component: ButtonFormComponent, handler: @escaping ButtonFormView.ButtonActionHandler) {
        self.component = component
        self.handler = handler
    }
    
    var body : some View {
        
        Button(component.title){
            handler(component.formId)
        }.frame(maxWidth: .infinity ,maxHeight: .infinity , alignment: .center)
        .background(Color.blue)
        .foregroundColor(.white)
        .font(.system(size: 16, weight : .bold))
        .cornerRadius(8)
        
        
    }
    
    
}
