//
//  SheetView.swift
//  budgetingApp
//
//  Created by Nadaa Shafa Nadhifa on 24/05/25.
//

import SwiftUI

struct SheetView: View {
    
    @Environment(\.dismiss) private var dismiss
    
    var body: some View {
        
        VStack {
            HStack {
                Text("Settings")
                    .fontWeight(.bold)
                    .font(.title)
                
                Spacer()
                
                Button {
                    dismiss()
                } label: {
                    Image(systemName: "xmark.circle.fill")
                       .font(.system(size: 27))
                       .foregroundColor(.black)
                }
            }
            .padding()
            
            Spacer()
        }
    }
}

#Preview {
    SheetView()
}
