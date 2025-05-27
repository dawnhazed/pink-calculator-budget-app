//
//  ContentView.swift
//  budgetingApp
//
//  Created by Nadaa Shafa Nadhifa on 24/05/25.
//

import SwiftUI

struct ContentView: View {
    
    @State private var isActive = false
    
    var body: some View {
        
        ZStack {
            TimelineView(.animation) { context in
                
                let s = context.date.timeIntervalSince1970
                let v = Float(sin(s)) / 4
                
                MeshGradient(
                    width: 3,
                    height: 3,
                    
                    points: [
                        
                    [0.0, 0.0], [0.5, 0.0],         [1.0, 0.0],
                    [0.0, 0.5], [0.5 + v, 0.5 - v], [1.0, 0.3 - v],
                    [0.0, 1.0], [0.7 - v, 1.0],     [1.0, 1.0]
                    
                ], colors: [
                    .paleCoral,                             .lightOrange,   isActive ? .lightCoral : .coralPink,
                    .coral,                                 .lightCoral,    .newPink,
                    isActive ? .lightCoral : .lightPink,    .paleCoral,     .paleYellow
                ])
                .opacity(0.35)
                .ignoresSafeArea()
                .onAppear() {
                    withAnimation(.easeInOut(duration: 3).repeatForever(autoreverses: true)) {
                        isActive = true
                    }
                }
                
            
            }
            
            CalculatorView()
        }
    }
}

#Preview {
    ContentView()
}
