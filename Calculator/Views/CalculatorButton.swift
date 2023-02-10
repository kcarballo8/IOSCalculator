//
//  CalculatorButton.swift
//  Calculator
//
//  Created by Karen Carballo on 9/20/22.
//

import SwiftUI

extension CalculatorView{
    struct CalculatorButton: View {
        @EnvironmentObject private var viewModel: ViewModel
        
        var button: String
        
        var body: some View {
            if button == "1" || button == "2" || button == "3"
            || button == "4" || button == "5" || button == "6"
            || button == "7" || button == "8" || button == "9"
            || button == "0"{
                Button(button) {
                    viewModel.performAction(for: button)
                }
                .buttonStyle(CalculatorButtonStyle(
                    size: getButtonSize(),
                    backgroundColor: .teal,
                    foregroundColor: .white //font color
                    
                ))
            }
            else if button == "C"{
                Button(button) {
                    viewModel.performAction(for: button)
                }
                .buttonStyle(CalculatorButtonStyle(

                    size: getButtonSize(),
                    backgroundColor: .gray,
                    foregroundColor: .white //font color
                    
                ))
            }
            else{
            Button(button) {
                viewModel.performAction(for: button)
            }
            .buttonStyle(CalculatorButtonStyle(

                size: getButtonSize(),
                backgroundColor: .black, 
                foregroundColor: .white //font color
                
            ))
            }
            
        }
        private func getButtonSize() -> CGFloat{
            let screenWidth = UIScreen.main.bounds.width
            let buttonCount: CGFloat = Constants.buttonsInARow
            let numberOfSpaces = buttonCount + 1
            
            return (screenWidth - numberOfSpaces * Constants.padding) / buttonCount
        }
    }
}


