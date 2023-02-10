//
//  CalculatorBrain.swift
//  Calculator
//
//  Created by Karen Carballo on 9/19/22.
//

import Foundation

struct CalculatorBrain {
    
    private var accumulator: Decimal?
    
    enum Operation {
        case constant (Decimal)
        case unaryOperator((Decimal) -> Decimal)
        case binaryOperator((Decimal, Decimal) -> Decimal)
        case equals
        case clear
    }
    
    
    var operations: [String : Operation] = [
        "+": .binaryOperator(+),
        "-": .binaryOperator(-),
        "x": .binaryOperator(*),
        "÷": .binaryOperator(/),
        "π": .constant(3.1416),
        "+/-": .unaryOperator(-),
        "%": .unaryOperator({(perc) in perc / 100}),
        "ϕ": .constant(1.61803398874989),
        "x2": .unaryOperator({(squared) in squared * squared}),
        "e": .constant(2.718281828459045),
        "=": .equals,
        "C": .clear
        
    ]
     
    mutating func setOperand (_ operand: Decimal) {
        accumulator = operand;
    }
    
    var displayText: String {
        return "\(accumulator ?? 0)"
    }
    
    mutating func performOperation(_ symbol : String) {
        if let operation = operations[symbol] {
            switch operation {
            case .constant(let value):
                accumulator = value
            
            case .unaryOperator(let function):
                if accumulator != nil {
                    accumulator = function(accumulator!)
                }
                
            case .binaryOperator(let function):
                performOperationInProgress()
                if accumulator != nil {
                    operationInProgress = OperationInProgress(firstOperand: accumulator!, function: function)
                    accumulator = nil
                }
            case .equals:
                performOperationInProgress()
            case .clear:
                accumulator = nil
                operationInProgress = nil
          
           
            }
        }
    }
    
    private mutating func performOperationInProgress() {
        if accumulator != nil && operationInProgress != nil {
            accumulator = operationInProgress!.perform(with: accumulator!)
            operationInProgress = nil
        }
    }
    
    private var operationInProgress: OperationInProgress?
    
    private struct OperationInProgress {
        let firstOperand: Decimal
        let function: (Decimal, Decimal) -> Decimal
        
        func perform(with secondOperand: Decimal) -> Decimal {
            return function(firstOperand, secondOperand)
        }
    }
    
}
  
