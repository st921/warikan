//
//  ContentView.swift
//  warikan
//
//  Created by しょう on 2026/02/12.
//

import SwiftUI

struct ContentView: View {
    //状態を保持するプロパティ
    @State private var totalAmount = "" //入力金額
    @State private var numberOfPeople = 2 //初期人数（Pickerのタグと連動）

    var body: some View {
        NavigationView {
            Form {
                //金額入力セクション
                Section(header: Text("お会計")) {
                    TextField("金額を入力", text: $totalAmount)
                        .keyboardType(.numberPad) //数字キーボードを表示
                }

                //人数選択セクション（プルダウン）
                Section(header: Text("人数")) {
                    Picker("人数を選択", selection: $numberOfPeople) {
                        ForEach(2..<21) { number in
                            Text("\(number) 人").tag(number)
                        }
                    }
                    .pickerStyle(.menu) //プルダウン（メニュー）形式
                }

                //計算結果セクション
                Section(header: Text("一人あたりの金額")) {
                    Text("\(calculateAmount()) 円")
                        .font(.headline)
                        .foregroundColor(.blue)
                }
            }
            .navigationTitle("割り勘くん")
        }
    }

    //割り勘計算ロジック
    func calculateAmount() -> Int {
        let amount = Double(totalAmount) ?? 0
        let result = amount / Double(numberOfPeople)
        return Int(ceil(result)) //切り上げして整数を返す
    }
}
#Preview {
    ContentView()
}
