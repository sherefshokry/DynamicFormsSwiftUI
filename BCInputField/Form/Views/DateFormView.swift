//
//  DateFormComponent.swift
//  BCInputField
//
//  Created by SherifShokry on 31/08/2021.
//

import Foundation
import SwiftUI


struct DateFormView : View {
   
    @EnvironmentObject var contentBuilder : FormContentBuilderImpl
    @State private var selectedDate = Date()
    @State private var error : ValidationError?
    
    
    let component : DateFormComponent
    
    var body : some View {
        
        DatePicker("", selection: $selectedDate, displayedComponents : [component.mode])
            .labelsHidden()
            .frame(maxWidth : .infinity , alignment: .leading)
        Text(error?.errorDescription ?? "")
            .font(.system(size: 12, weight: .semibold, design: .default))
            .foregroundColor(.red)
            .onChange(of: selectedDate, perform: { value in
                
                contentBuilder.update(selectedDate, in: component)
                
                error = component.validations.compactMap{
                    $0.validate(selectedDate)
                }.first
                
                
            })
        
    }
    
    
}
