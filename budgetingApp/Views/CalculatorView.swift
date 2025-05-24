//
//  CalculatorView.swift
//  budgetingApp
//
//  Created by Nadaa Shafa Nadhifa on 24/05/25.
//

import SwiftUI

struct CalculatorView: View {
    
    @State var value = "0"
    @State var runningNumber = 0
    // @State var currentOperation: Operation = .none
    
    let buttons : [[CalcButton]] = [
        [.seven, .eight, .nine, .settings],
        [.four, .five, .six, .delete],
        [.one, .two, .three, .clear],
        [.zero, .triple, .decimal, .enter]
        
    ]
    
    var body: some View {
        ZStack {
            VStack {
                RoundedRectangle(cornerRadius: 20)
                    .fill(Color.basePink)
                    .frame(width: 320, height: 500)
                    .shadow(radius: 5)
            }
            
            VStack {
                
                HStack {
                    Text("OH PEACH!")
                    
                    Spacer()
                    
                    Text("dawnhazed")
                }
                .padding(.horizontal, 65)
                
                ZStack {
                    RoundedRectangle(cornerRadius: 20)
                        .frame(width: 280, height: 200)
                        .padding(.bottom, 10)
                        .foregroundStyle(
                            .white.shadow(.inner(color: .black.opacity(0.4), radius: 3, x: 1, y: 1))
                        )
                    
                    Text(value)
                        
                }
                
//                ForEach(buttons, id: \.self) { row in
//                    HStack(spacing: 12) {
//                        ForEach
//                    }
//                }
                
               
            }
        }
    }
    
    func didTap(button: CalcButton) {
        
    }
}

#Preview {
    CalculatorView()
}
