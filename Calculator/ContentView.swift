//
//  ContentView.swift
//  Calculator
//
//  Created by lpy on 2023/10/1.
//

import SwiftUI

enum enumButtons: String {
    case one = "1"
    case two = "2"
    case three = "3"
    case four = "4"
    case five = "5"
    case six = "6"
    case seven = "7"
    case eight = "8"
    case nine = "9"
    case zero = "0"
    case decimal = "."
    case addition = "➕"
    case subtract = "➖"
    case multiply = "✖️ "
    case divide = "➗"
    case clear = "AC"
    case equal = "🟰"
    
    var ButtonColor: Color {
        switch self{
        case .addition, .subtract, .multiply, .divide, .equal:
            return .orange
        case .clear:
            return .gray
        default:
            return .purple
        }
    }
}

enum enumOperation {
    case addition, subtract, multiply, divide, none
}

struct ContentView: View {
    
    @State var CurrentValue = "0"
    @State var RunningValue:Double = 0
    @State var CurrentOperation = enumOperation.none
    
    let Buttons = [
        [enumButtons.clear, .divide],
        [.seven, .eight, .nine, .multiply],
        [.four, .five, .six, .subtract],
        [.one, .two, .three, .addition],
        [.zero, .decimal, .equal]
    ]
    
    var body: some View {
        ZStack() {
            Color.black.edgesIgnoringSafeArea(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
            
            VStack {
                Spacer()
                //计算数值显示
                //--------------------------------------------------------
                HStack {
                    Spacer()
                    Text(CurrentValue)
                        .font(.system(size: 50))
                        .foregroundColor(.white)
                        .bold()
                }
                //.border(.white)
                .padding(16)
                //--------------------------------------------------------
                
                //按钮显示
                //--------------------------------------------------------
                ForEach(Buttons, id: \.self) { row in
                    HStack() {
                        ForEach(row, id: \.self) { item in   //枚举所有按钮item
                            Button(action: {                 //使用Button封装
                                TapButton(button: item)      //按下按钮后的逻辑
                            }, label: { //按钮UI
                                Text(item.rawValue)
                                    .bold()
                                    .font(.system(size: 45))
                                    .frame(
                                        width: getwidth(item: item),
                                        height: getheight(item: item)
                                    )
                                    .background(item.ButtonColor)
                                    .foregroundStyle(.white)
                                    .cornerRadius(getwidth(item: item))
                                    //.clipShape(Rectangle())
                                    //.border(.white)
                            })
                        }
                    }
                    .padding(.bottom,5)
                }
                //--------------------------------------------------------
            }
        }
    }
    
    func FixCurrentNumber(CurrentValue: String) -> String {
        //只保留六位小数
        /*var decimalid:Int
        for decimalid in 0...CurrentValue.count {
            
        }
        */
        //删除多余零
        var metdecimal:Bool = false
        for character in CurrentValue {
            if character == "." {
                metdecimal = true
                break
            }
        }
        if !metdecimal {
            return CurrentValue
        }
        var Result = CurrentValue
        while Result[Result.index(before: Result.endIndex)] == "0" {
            Result.removeLast()
        }
        if Result[Result.index(before: Result.endIndex)] == "." {
            Result.removeLast()
        }
        return Result
    }
    
    func TapButton(button: enumButtons) {
        switch button {
        case .addition, .subtract, .multiply, .divide, .equal:
            if button == .addition {
                if(CurrentOperation != .none) {
                    if CurrentOperation == .addition {
                        CurrentValue = String(RunningValue + (Double(CurrentValue) ?? 0))
                        CurrentValue = FixCurrentNumber(CurrentValue: CurrentValue)
                    }
                    if CurrentOperation == .subtract {
                        CurrentValue = String(RunningValue - (Double(CurrentValue) ?? 0))
                        CurrentValue = FixCurrentNumber(CurrentValue: CurrentValue)
                    }
                    if CurrentOperation == .multiply {
                        CurrentValue = String(RunningValue * (Double(CurrentValue) ?? 0))
                        CurrentValue = FixCurrentNumber(CurrentValue: CurrentValue)
                    }
                    if CurrentOperation == .divide {
                        CurrentValue = String(RunningValue / (Double(CurrentValue) ?? 0))
                        CurrentValue = FixCurrentNumber(CurrentValue: CurrentValue)
                    }
                }
                RunningValue = Double(CurrentValue) ?? 0
                CurrentOperation = .addition
                CurrentValue = "0"
            }
            else if button == .subtract {
                if(CurrentOperation != .none) {
                    if CurrentOperation == .addition {
                        CurrentValue = String(RunningValue + (Double(CurrentValue) ?? 0))
                        CurrentValue = FixCurrentNumber(CurrentValue: CurrentValue)
                    }
                    if CurrentOperation == .subtract {
                        CurrentValue = String(RunningValue - (Double(CurrentValue) ?? 0))
                        CurrentValue = FixCurrentNumber(CurrentValue: CurrentValue)
                    }
                    if CurrentOperation == .multiply {
                        CurrentValue = String(RunningValue * (Double(CurrentValue) ?? 0))
                        CurrentValue = FixCurrentNumber(CurrentValue: CurrentValue)
                    }
                    if CurrentOperation == .divide {
                        CurrentValue = String(RunningValue / (Double(CurrentValue) ?? 0))
                        CurrentValue = FixCurrentNumber(CurrentValue: CurrentValue)
                    }
                }
                RunningValue = Double(CurrentValue) ?? 0
                CurrentOperation = .subtract
                CurrentValue = "0"
            }
            else if button == .multiply {
                if(CurrentOperation != .none) {
                    if CurrentOperation == .addition {
                        CurrentValue = String(RunningValue + (Double(CurrentValue) ?? 0))
                        CurrentValue = FixCurrentNumber(CurrentValue: CurrentValue)
                    }
                    if CurrentOperation == .subtract {
                        CurrentValue = String(RunningValue - (Double(CurrentValue) ?? 0))
                        CurrentValue = FixCurrentNumber(CurrentValue: CurrentValue)
                    }
                    if CurrentOperation == .multiply {
                        CurrentValue = String(RunningValue * (Double(CurrentValue) ?? 0))
                        CurrentValue = FixCurrentNumber(CurrentValue: CurrentValue)
                    }
                    if CurrentOperation == .divide {
                        CurrentValue = String(RunningValue / (Double(CurrentValue) ?? 0))
                        CurrentValue = FixCurrentNumber(CurrentValue: CurrentValue)
                    }
                }
                RunningValue = Double(CurrentValue) ?? 0
                CurrentOperation = .multiply
                CurrentValue = "0"
            }
            else if button == .divide {
                if(CurrentOperation != .none) {
                    if CurrentOperation == .addition {
                        CurrentValue = String(RunningValue + (Double(CurrentValue) ?? 0))
                        CurrentValue = FixCurrentNumber(CurrentValue: CurrentValue)
                    }
                    if CurrentOperation == .subtract {
                        CurrentValue = String(RunningValue - (Double(CurrentValue) ?? 0))
                        CurrentValue = FixCurrentNumber(CurrentValue: CurrentValue)
                    }
                    if CurrentOperation == .multiply {
                        CurrentValue = String(RunningValue * (Double(CurrentValue) ?? 0))
                        CurrentValue = FixCurrentNumber(CurrentValue: CurrentValue)
                    }
                    if CurrentOperation == .divide {
                        CurrentValue = String(RunningValue / (Double(CurrentValue) ?? 0))
                        CurrentValue = FixCurrentNumber(CurrentValue: CurrentValue)
                    }
                }
                RunningValue = Double(CurrentValue) ?? 0
                CurrentOperation = .divide
                CurrentValue = "0"
            }
            else if button == .equal {
                if CurrentOperation == .addition {
                    CurrentValue = String(RunningValue + (Double(CurrentValue) ?? 0))
                    CurrentValue = FixCurrentNumber(CurrentValue: CurrentValue)
                }
                if CurrentOperation == .subtract {
                    CurrentValue = String(RunningValue - (Double(CurrentValue) ?? 0))
                    CurrentValue = FixCurrentNumber(CurrentValue: CurrentValue)
                }
                if CurrentOperation == .multiply {
                    CurrentValue = String(RunningValue * (Double(CurrentValue) ?? 0))
                    CurrentValue = FixCurrentNumber(CurrentValue: CurrentValue)
                }
                if CurrentOperation == .divide {
                    CurrentValue = String(RunningValue / (Double(CurrentValue) ?? 0))
                    CurrentValue = FixCurrentNumber(CurrentValue: CurrentValue)
                }
                CurrentOperation = .none
            }
        case .decimal:
            CurrentValue += "."
        case .clear:
            CurrentValue = "0"
        default:
            let num = button.rawValue
            if CurrentValue == "0" {
                CurrentValue = num
            }
            else {
                CurrentValue = CurrentValue + num
            }
        }
    }
    
    func getwidth(item: enumButtons) -> CGFloat {
        if item == .zero {
            return 189//((UIScreen.main.bounds.width - 4*12) / 4) * 2;
        }
        if item == .clear {
            return 287
        }
        return 90//(UIScreen.main.bounds.width - 4*12) / 4
    }
    func getheight(item: enumButtons) -> CGFloat {
        return 90//(UIScreen.main.bounds.width - 4*12) / 4
        
    }
    
}

#Preview {
    ContentView()
}

//miemiemie
