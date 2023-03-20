//
//  StorageView.swift
//  JuiceMaker
//
//  Created by unchain on 2023/03/19.
//

import SwiftUI

struct StorageView: View {
    @ObservedObject var viewModel: StorageViewModel
    @Binding var isActive: Bool

    var body: some View {
        VStack {
            HStack {
                Spacer()

                Button(action: {
                    isActive.toggle()
                }) {
                    ZStack {
                        RoundedRectangle(cornerRadius: 10)
                            .foregroundColor(Color.red)
                            .frame(width: 40, height: 40)
                        RoundedRectangle(cornerRadius: 10)
                            .foregroundColor(Color.white)
                            .frame(width: 30, height: 30)
                        Text("❌")
                    }
                }
                Spacer()
                Text("Juice Storage")
                    .font(Font.custom("BMJUAOTF", size: 30))
                    .bold()
                    .foregroundColor(Color.black)
                Spacer()
                Button(action: {
                    viewModel.saveStock()
                }) {
                    ZStack {
                        RoundedRectangle(cornerRadius: 10)
                            .foregroundColor(Color.blue)
                            .frame(width: 40, height: 40)
                        RoundedRectangle(cornerRadius: 10)
                            .foregroundColor(Color.white)
                            .frame(width: 30, height: 30)
                        Text("저장")
                            .font(Font.custom("BMJUAOTF", size: 15))
                            .foregroundColor(Color.black)
                            .frame(width: 40, height: 30, alignment: .center)
                    }
                }
                Spacer()
            }
            ScrollView {
                ForEach(viewModel.juiceStock.sorted(by: >), id: \.key) { fruit, _ in
                    StockControlView(viewModel: viewModel.childrenVieModel[fruit] ??
                                     StockControlViewModel(fruit: .apple, count: 0))
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
                    .padding()
                }
            }
            .padding(EdgeInsets(top: 0, leading: 5, bottom: 0, trailing: 5))
        }
    }
}

struct ContentView_Previews2: PreviewProvider {
    static var previews: some View {
        MainView(viewModel: MainViewModel(service: JuiceService()))
    }
}