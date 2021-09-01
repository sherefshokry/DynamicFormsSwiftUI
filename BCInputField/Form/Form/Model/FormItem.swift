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
    var formId: FormField
    var val: Any?
    
    
    init(_ id: FormField){
        self.formId = id
    }
    
}


/*
 *  Text Component
 */

final class TextFormComponent : FormComponent {
    
    let placeHolder : String
    let keyboardType : UIKeyboardType
    
    
    init(id : FormField , placeHolder : String , keyboardType : UIKeyboardType = .default) {
        self.placeHolder = placeHolder
        self.keyboardType = keyboardType
        super.init(id)
    }
    
}


/*
 *  Date Component
 */

final class DateFormComponent : FormComponent {
    
    let mode : DatePickerComponents
    
    init(_ id: FormField , mode : DatePickerComponents) {
        self.mode = mode
        super.init(id)
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

