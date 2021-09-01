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
}


final class FormContentBuilderImpl : ObservableObject , FormContentBuilder{
    
    
    private (set) var content: [FormComponent] = [
        TextFormComponent(id: .firstName, placeHolder: "First Name", keyboardType: .default),
        TextFormComponent(id: .lastName, placeHolder: "Last Name", keyboardType: .default),
        TextFormComponent(id: .email, placeHolder: "Email", keyboardType: .emailAddress),
        DateFormComponent(.dob, mode: .date),
        ButtonFormComponent(.submit, title: "Confirm")
    ]
}
 
