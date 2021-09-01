//
//  FormContentBuilder.swift
//  BCInputField
//
//  Created by SherifShokry on 31/08/2021.
//

import Foundation
import SwiftUI
import Combine


protocol FormContentBuilder {
    var content : [FormComponent] { get }
    var state : FormState? { get }
    func update(_ val : Any , in component : FormComponent)
    func validate()
}


final class FormContentBuilderImpl : ObservableObject , FormContentBuilder{
     
   @Published private(set) var state: FormState?
    
    private (set) var content: [FormComponent] = [
       
        TextFormComponent(id: .firstName,validations: [
                            
            RegexValidationManagerImple([
                RegexFormItem(pattern: RegexPatterns.name, error: .custom(message: "Invalid First Name Entered"))
        ])
        
        ], placeHolder: "First Name", keyboardType: .default),
        
        
        
        
        TextFormComponent(id: .lastName,validations: [
            
            RegexValidationManagerImple([
                RegexFormItem(pattern: RegexPatterns.name, error: .custom(message: "Invalid Last Name Entered"))
        ])
        
        ], placeHolder: "Last Name", keyboardType: .default),
        
        TextFormComponent(id: .email,validations: [
            
            RegexValidationManagerImple([
                RegexFormItem(pattern: RegexPatterns.emailChars, error: .custom(message: "Invalid Email Missing @")
                ),
                RegexFormItem(pattern: RegexPatterns.higherThanSixChars, error: .custom(message: "Less than 6 chars")
                )
        ])
        
        ], placeHolder: "Email", keyboardType: .emailAddress),
        
        DateFormComponent(.dob,validations: [DateValidationManagerImple()], mode: .date),
        
        ButtonFormComponent(.submit, title: "Confirm")
    ]
    
    
    func update(_ val: Any, in component: FormComponent) {
        guard let index = content.firstIndex(where: { $0.id == component.id }) else { return }
        content[index].val = val
    }
    
    
    func validate() {
        
        let formComponent = content.filter { $0.formId != .submit }
        
        
        for component in formComponent {
            
            for validator in component.validations {
                
                if let error = validator.validate(component.val as Any) {
                    self.state = .fail(error: error)
                    return
                }
            }
        }
        
        
        if let firstName = formComponent.first(where: {$0.formId == .firstName })?.val as? String,
           let lastName = formComponent.first(where: {$0.formId == .lastName })?.val as? String,
           let email = formComponent.first(where: {$0.formId == .email })?.val as? String,
           let dob = formComponent.first(where: {$0.formId == .dob })?.val as? Date {
        
            
            let newUser = User(firstName: firstName, lastName: lastName, email: email, dob: dob)
            self.state = .valid(user: newUser)
            
            
            
        }
        
        
        
    }
    
}
 
