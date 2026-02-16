//
//  ContentView.swift
//  warikan
//
//  Created by しょう on 2026/02/12.
//

import SwiftUI

struct ContentView: View {
    @State private var totalAmount = ""
    @State private var numberOfPeople = 2
    
    @AppStorage("isDarkMode") private var isDarkMode = false

    var body: some View {
        NavigationView {
            Form {
                // 外観設定セクション
                Section(header: Text("設定")) {
                    Toggle("ダークモード", isOn: $isDarkMode)
                }

                Section(header: Text("お会計")) {
                    TextField("金額を入力", text: $totalAmount)
                        .keyboardType(.numberPad)
                }

                Section(header: Text("人数")) {
                    Picker("人数を選択", selection: $numberOfPeople) {
                        ForEach(2..<21) { number in
                            Text("\(number) 人").tag(number)
                        }
                    }
                    .pickerStyle(.menu)
                }

                Section(header: Text("一人あたりの金額")) {
                    Text("\(calculateAmount()) 円")
                        .font(.headline)
                        .foregroundColor(isDarkMode ? .yellow : .blue) // モードによって色を変える例
                }
            }
            .navigationTitle("割り勘くん")
        }
        .preferredColorScheme(isDarkMode ? .dark : .light)
    }

    func calculateAmount() -> Int {
        let amount = Double(totalAmount) ?? 0
        let result = amount / Double(numberOfPeople)
        return Int(ceil(result))
    }
}
#Preview {
    ContentView()
}
