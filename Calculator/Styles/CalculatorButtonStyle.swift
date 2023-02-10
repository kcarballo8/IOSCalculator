//
//  CalculatorButtonStyle.swift
//  Calculator
//
//  Created by Karen Carballo on 9/20/22.
//

import SwiftUI

struct CalculatorButtonStyle: ButtonStyle{
    
    var size: CGFloat
    var backgroundColor: Color
    var foregroundColor: Color
    
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .font(.system(size: 42, weight: .medium))
            .frame(width: size, height: size)
            .background(backgroundColor)
            .foregroundColor(foregroundColor)
            .overlay{
                if configuration.isPressed{
                    Color(white: 1.0, opacity: 0.2)
                }
            }
            .clipShape(Rectangle())
        
        
    }
}
