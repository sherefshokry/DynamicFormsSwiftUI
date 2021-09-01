//
//  DateFormComponent.swift
//  BCInputField
//
//  Created by SherifShokry on 31/08/2021.
//

import Foundation
import SwiftUI


struct DateFormView : View {
   
    let component : DateFormComponent
    
    var body : some View {
        
        DatePicker("", selection: .constant(Date()), displayedComponents : [component.mode])
            .labelsHidden()
            .frame(maxWidth : .infinity , alignment: .leading)
        Text("Error Here")
            .font(.system(size: 12, weight: .semibold, design: .default))
            .foregroundColor(.red)
        
    }
    
    
}
