//
//  ContentView.swift
//  budgetingApp
//
//  Created by Nadaa Shafa Nadhifa on 24/05/25.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        ZStack {
            
            MeshGradient(
                width: 3,
                height: 3,
                points: [
                    
                .init(0, 0), .init(0.5, 0), .init(1, 0),
                .init(0, 0.5), .init(0.5, 0.5), .init(1, 0.5),
                .init(0, 1), .init(0.5, 1), .init(1, 1)
                
            ], colors: [
                .red, .purple, .indigo,
                .orange, .white, .blue,
                .yellow, .green, .mint
                
            ]) .ignoresSafeArea()
            
            CalculatorView()
            
            HStack {
                
                Spacer()
                
                VStack {
                    Spacer()
                    
                    Circle()
                        .fill(Color.white)
                        .frame(width: 70, height: 70)
                }
            }
            .padding(30)
        }
    }
}

#Preview {
    ContentView()
}
