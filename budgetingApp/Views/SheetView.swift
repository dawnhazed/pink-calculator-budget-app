//
//  SheetView.swift
//  budgetingApp
//
//  Created by Nadaa Shafa Nadhifa on 24/05/25.
//

import SwiftUI

struct SheetView: View {
    
    @State private var budget: String = ""
    @State private var saveDate = Date()
    
    @FocusState private var isFocused: Bool //= false
    
    @Environment(\.dismiss) private var dismiss
    
    var body: some View {
        ZStack {
            
            Rectangle()
                .fill(Color.paleCoral)
                .ignoresSafeArea()
            
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
                
                Form {
                    TextField("Budget", text: $budget)
                    DatePicker("End Date", selection: $saveDate, displayedComponents: .date)
                }
                
                Spacer()
            }
        }
    }
}

#Preview {
    SheetView()
}
