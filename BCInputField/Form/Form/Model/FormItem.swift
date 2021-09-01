//
//  FormItem.swift
//  BCInputField
//
//  Created by SherifShokry on 31/08/2021.
//

import Foundation
import SwiftUI


/*
 *  Implemntation For Form Item
 */

protocol FormItem {
    var id : UUID { get }
    var formId : FormField { get }
    var validations : [ValidationManager] { get }
    var val : Any? { get }
    
}


/*
 *  Unique enum for our form
 */


enum FormField {
    case firstName
    case lastName
    case email
    case dob
    case submit
}


/*
 *  Base Form Component
 */

class FormComponent : FormItem , Identifiable {
   
    
    
    let id = UUID()
    let formId: FormField
    let validations: [ValidationManager]
    var val: Any?
    
    
    init(_ id: FormField,_ validations : [ValidationManager] = [] ){
        self.validations = validations
        self.formId = id
    }
    
}


/*
 *  Text Component
 */

final class TextFormComponent : FormComponent {
    
    let placeHolder : String
    let keyboardType : UIKeyboardType
    
    
    init(id : FormField,validations : [ValidationManager] = [] , placeHolder : String , keyboardType : UIKeyboardType = .default) {
        self.placeHolder = placeHolder
        self.keyboardType = keyboardType
        super.init(id, validations)
    }
    
}


/*
 *  Date Component
 */

final class DateFormComponent : FormComponent {
    
    let mode : DatePickerComponents
    
    init(_ id: FormField , validations : [ValidationManager] = [] , mode : DatePickerComponents) {
        self.mode = mode
        super.init(id, validations)
    }
    
}



/*
 *  Button Component
 */


final class ButtonFormComponent : FormComponent {
    
    let title : String
    
    init(_ id: FormField , title : String) {
        self.title = title
        super.init(id)
    }
    
}

