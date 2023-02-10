//
//  CalculatorView.swift
//  Calculator
//
//  Created by Karen Carballo on 9/19/22.
//
import Foundation
import SwiftUI

struct CalculatorView: View {
    @EnvironmentObject private var viewModel: ViewModel

    var body: some View {
        VStack {
            Spacer()
            Text(viewModel.displayText)
                .padding()
                .frame(maxWidth: .infinity, alignment: .trailing)
                .font(.system(size: 40, weight: .light))
                .lineLimit(1)
            
            Text(viewModel.displayText)
                .padding()
                .frame(maxWidth: .infinity, alignment: .trailing)
                .font(.system(size: 100, weight: .medium))
                .lineLimit(1)
                .minimumScaleFactor(0.5)
                .background(.indigo)
                
        //Buttons
            buttonArea
                .padding()
                .background(.indigo)
     
        }
       // .padding()
           
        }
}

struct CalculatorView_Previews: PreviewProvider{
    static var previews: some View {
        CalculatorView()
            .preferredColorScheme(.dark)
            .environmentObject(CalculatorView.ViewModel())
            
        
    }
}

extension CalculatorView{


    private var buttonArea: some View{
        VStack {
           
            ForEach(viewModel.buttons, id: \.self) {
                row in HStack {
                    ForEach(row, id: \.self) {
                        button in CalculatorButton(button: button)
        
                    }
                }
            }
        }
    }
}
