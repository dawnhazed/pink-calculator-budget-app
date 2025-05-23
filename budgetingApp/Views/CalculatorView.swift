//
//  CalculatorView.swift
//  budgetingApp
//
//  Created by Nadaa Shafa Nadhifa on 24/05/25.
//

import SwiftUI

struct CalculatorView: View {
    var body: some View {
        ZStack {
            VStack {
                RoundedRectangle(cornerRadius: 20)
                    .fill(Color.basePink)
                    .frame(width: 320, height: 500)
                    //.shadow(radius: 10)
            }
            
            VStack {
                RoundedRectangle(cornerRadius: 20)
                    .fill(Color.white)
                    .frame(width: 280, height: 200)
                    .padding(.bottom, 10)
                
                RoundedRectangle(cornerRadius: 20)
                    .fill(Color.white)
                    .frame(width: 280, height: 230)
            }
        }
    }
}

#Preview {
    CalculatorView()
}
