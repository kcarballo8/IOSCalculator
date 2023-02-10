//
//  CalculatorViewModel.swift
//  Calculator
//
//  Created by Karen Carballo on 9/19/22.
//

import Foundation

extension CalculatorView {
    final class ViewModel: ObservableObject {
        @Published private var calculator = CalculatorBrain()
        @Published private var number = NumberValue()
        var buttons: [[String]] {
            [
                ["C" , "+/-", "ϕ", "x2"],
                ["%" , "e", "π", "+"],
                ["7", "8", "9", "÷"],
                ["4", "5", "6", "-"],
                ["1", "2", "3", "x"],
                ["0", ".", "="]
            ]
        }
      
        private var digits: [String] = ["0", "1", "2", "3", "4", "5", "6", "7", "8", "9", "."]
        
        func performAction(for button: String){
            if digits.contains(button) {
                number.addDigit(button)
            }
            else {
                if number.value != nil {
                    calculator.setOperand(Decimal(string: number.value!)!)
                    number.clear()
                }
                calculator.performOperation(button)
            } 
        }
        
        var displayText: String {
            if let value = number.value {
                return value
            }
            else {
                return calculator.displayText
            }
        }
    }
}
