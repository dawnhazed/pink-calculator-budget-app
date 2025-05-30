//
//  SheetView.swift
//  budgetingApp
//
//  Created by Nadaa Shafa Nadhifa on 24/05/25.
//

import SwiftUI

struct SheetView: View {
    
    @State private var budget: String = ""
   // @State private var saveDate = Date()
    
    @FocusState private var isFocused: Bool //= false
    
    @Environment(\.dismiss) private var dismiss
    
    @AppStorage("current")private var current: Int = 0
    @State private var currentText: String = ""
    
    @AppStorage("remaining")private var remaining: Int = 0
    
    @AppStorage("date")private var date: Date = Date()
    @AppStorage("endDate") private var endDate: Double = Date().timeIntervalSince1970
    
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
                    TextField("Enter Your Budget", text: $currentText)
                        .keyboardType(.numberPad)
                        .onAppear {
                            if current > 0 {
                                currentText = String(current)
                            } else {
                                currentText = ""
                            }
                            
                        }
                    
                    DatePicker("End Date", selection: $date, displayedComponents: .date)
                }
                .scrollContentBackground(.hidden)
                .padding(.top, -40)
                
                Spacer()
            }
            
            
        }
        
        .toolbar {
            ToolbarItemGroup(placement: .keyboard) {
                Button("Reset All") {
                    current = 0
                    currentText = ""
                    remaining = 0
                }
                Spacer()
                Button("Done") {
                    current = Int(currentText) ?? 0
                    hideKeyboard()
                }
                .fontWeight(.bold)
            }
        }
    }
    
}


extension View {
    func hideKeyboard() {
        UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
    }
}

#Preview {
    SheetView()
}
