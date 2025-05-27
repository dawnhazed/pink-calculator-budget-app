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
                    TextField("Enter Your Budget", text: $budget)
                        .keyboardType(.numberPad)
                        .toolbar {
                            ToolbarItemGroup(placement: .keyboard) {
                                Spacer()
                                Button("Done") {
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
