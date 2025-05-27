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
    
    @AppStorage("current")private var current: Int = 0
    @State private var currentText: String = ""
    
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
                            currentText = String(current)
                        }
                        .toolbar {
                            ToolbarItemGroup(placement: .keyboard) {
                                Spacer()
                                Button("Done") {
                                    current = Int(currentText) ?? 0
                                    hideKeyboard()
                                }
                                .fontWeight(.bold)
                            }
                        }
                    
                    DatePicker("End Date", selection: $saveDate, displayedComponents: .date)
                }
                .scrollContentBackground(.hidden)
                .padding(.top, -40)
                Spacer()
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
