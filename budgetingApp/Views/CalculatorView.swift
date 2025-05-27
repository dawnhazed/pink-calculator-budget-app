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
    @State var showingSheet = false
    let buttonWidth : CGFloat = 60
    
    let buttons : [[CalcButton]] = [
        [.seven, .eight, .nine, .settings],
        [.four, .five, .six, .delete],
        [.one, .two, .three, .clear],
        [.zero, .triple, .enter]
        
    ]
    
    var body: some View {
        ZStack {
            VStack {
                RoundedRectangle(cornerRadius: 20)
                    .fill(Color.basePink)
                    .frame(width: 320, height: 440)
                    .shadow(radius: 5)
            }
            
            VStack {
                
                HStack {
                    Text("CALC")
                        .font(.custom("Press Start 2P", size: 15))
                        .foregroundColor(.black)
                        .padding(.bottom, 10)
                    
                    Spacer()
                }
                .padding(.horizontal, 60)
                
                ZStack {
                    RoundedRectangle(cornerRadius: 20)
                        .frame(width: 280, height: 200)
                        .padding(.bottom, 10)
                        .foregroundStyle(
                            .white.shadow(.inner(color: .black.opacity(0.4), radius: 3, x: 1, y: 1))
                        )
                    
                    VStack (alignment: .leading){
                        Text("Current: ")
                            .font(.custom("Press Start 2P", size: 12))
                            .multilineTextAlignment(.leading)
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .fixedSize(horizontal: false, vertical: true)
                            .padding(.bottom, 10)
                            
                        Text("Remaining: ")
                            .font(.custom("Press Start 2P", size: 12))
                            .multilineTextAlignment(.leading)
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .fixedSize(horizontal: false, vertical: true)
                            .padding(.bottom, 10)
                        
                        Text("End date: ")
                            .font(.custom("Press Start 2P", size: 12))
                            .multilineTextAlignment(.leading)
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .fixedSize(horizontal: false, vertical: true)
                        
                        Text("Amount spent:" + value)
                            .font(.custom("Press Start 2P", size: 12))
                            .multilineTextAlignment(.leading)
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .fixedSize(horizontal: false, vertical: true)
                            .padding(.top, 90)
                    }
                    .padding(.leading, 80)
                }
                
                ForEach(buttons, id: \.self) { row in
                    HStack(spacing: 12) {
                        ForEach(row, id: \.self) { item in
                            if item == .enter {
                                self.createButton(for: .enter)
                                    .frame(width: (buttonWidth * 2) + 12)
                            } else {
                                self.createButton(for: item)
                            }
                        }
                    }
                    .padding(.vertical, 2)
                }
            }
        }
        .sheet(isPresented: $showingSheet) {
            SheetView()
                .presentationDetents([.height(180)])
        }
    }
    
    private func createButton(for item: CalcButton) -> some View {
            Button(action: {
                self.didTap(button: item)
            }) {
                
                ZStack {
                    
//                    RoundedRectangle(cornerRadius: 10)
//                        .frame(width: 60, height: 30)
//                        .foregroundColor(item.buttonColor)
//                        .overlay(
//                            RoundedRectangle(cornerRadius: 10)
//                                .stroke(Color.black, lineWidth: 1)
//                        )
                    
                    if item.rawValue == "Settings" {
                        RoundedRectangle(cornerRadius: 10)
                            .frame(width: 60, height: 30)
                            .foregroundColor(item.buttonColor)
                            .overlay(
                                RoundedRectangle(cornerRadius: 10)
                                    .stroke(Color.black, lineWidth: 1)
                            )
                        
                        Image("settings")
                            .resizable()
                            .scaledToFill()
                            .foregroundColor(.black)
                            .frame(width: 20, height: 20)
                        
                    } else if item.rawValue == "DEL" {
                        RoundedRectangle(cornerRadius: 10)
                            .frame(width: 60, height: 30)
                            .foregroundColor(item.buttonColor)
                            .overlay(
                                RoundedRectangle(cornerRadius: 10)
                                    .stroke(Color.black, lineWidth: 1)
                            )
                        
                        Image("arrow")
                            .resizable()
                            .scaledToFill()
                            .foregroundColor(.black)
                            .frame(width: 25, height: 25)
                    } else if item.rawValue == "AC" {
                        RoundedRectangle(cornerRadius: 10)
                            .frame(width: 60, height: 30)
                            .foregroundColor(item.buttonColor)
                            .overlay(
                                RoundedRectangle(cornerRadius: 10)
                                    .stroke(Color.black, lineWidth: 1)
                            )
                        
                        Text(item.rawValue)
                            .font(.custom("Press Start 2P", size: 10))
                            .foregroundColor(.black)
                            .frame(width: 60, height: 30)
                            .clipShape(RoundedRectangle(cornerRadius: 12))
                        
                    } else if item.rawValue == "Enter" {
                        RoundedRectangle(cornerRadius: 10)
                            .frame(width: 130, height: 30)
                            .foregroundColor(item.buttonColor)
                            .overlay(
                                RoundedRectangle(cornerRadius: 10)
                                    .stroke(Color.black, lineWidth: 1)
                            )
                        
                        Text(item.rawValue)
                            .font(.custom("Press Start 2P", size: 10))
                            .foregroundColor(.black)
                            .frame(width: 60, height: 30)
                            .clipShape(RoundedRectangle(cornerRadius: 12))
                    } else {
                        RoundedRectangle(cornerRadius: 10)
                        .frame(width: 60, height: 30)
                        .foregroundColor(item.buttonColor)
                        .overlay(
                            RoundedRectangle(cornerRadius: 10)
                                .stroke(Color.black, lineWidth: 1)
                        )
                        
                        Text(item.rawValue)
                        
                            .font(.custom("Press Start 2P", size: 15))
                            .foregroundColor(.black)
                            .frame(width: 60, height: 30)
                            .clipShape(RoundedRectangle(cornerRadius: 12))
                    }
                }
            }
        }
    
    func didTap(button: CalcButton) {
        switch button {
            
        case .enter:
            let runningValue = self.runningNumber
            let currentValue = Int(self.value) ?? 0
            
        case .clear:
            self.value = "0"
        
        case .delete:
            if self.value.count > 1 {
                self.value.removeLast()
            } else {
                self.value = "0"
            }
        
        case .settings:
            self.showingSheet = true
            
        case .decimal:
            break
            
        default:
            let number = button.rawValue
            
            if self.value == "0" {
                value = number
            } else {
                self.value = "\(self.value)\(number)"
            }
        }
    }
}

#Preview {
    CalculatorView()
}
