//
//  NumberValue.swift
//  Calculator
//
//  Created by Karen Carballo on 9/19/22.
//

import Foundation

struct NumberValue {
    private(set) var value: String?
    
    mutating func addDigit(_ digit: String) {
        if digit == "." {
            if value == nil {
                value = "0."
            } else {
                if !value!.contains(".") {
                    value! += "."
                }
            }
        } else{
            if value == nil {
                value = digit
            } else {
                value! += digit
            }
        }
    }
    
    mutating func clear() {
        value = nil
    }
}
