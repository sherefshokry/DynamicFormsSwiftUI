//
//  ValidationError.swift
//  BCInputField
//
//  Created by SherifShokry on 31/08/2021.
//

import Foundation

enum ValidationError : Error {
    case custom(message : String)
}

extension ValidationError {
    
    var errorDescription : String {
        
        switch self {
        case .custom(let message):
            return message
        }
        
    }
    
    
    
}
