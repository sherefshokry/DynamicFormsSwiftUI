//
//  ButtonFormView.swift
//  BCInputField
//
//  Created by SherifShokry on 31/08/2021.
//

import Foundation
import SwiftUI


struct ButtonFormView : View {
   
    let component : ButtonFormComponent
    
    
    var body : some View {
        
        Button(component.title){
            
        }.frame(maxWidth: .infinity , maxHeight:  50 , alignment: .center)
        .background(Color.blue)
        .foregroundColor(.white)
        .font(.system(size: 16, weight : .bold))
        .cornerRadius(8)
        
    }
    
    
}
