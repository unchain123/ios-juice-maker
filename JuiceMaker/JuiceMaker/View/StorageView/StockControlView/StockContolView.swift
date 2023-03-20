//
//  StockContolView.swift
//  JuiceMaker
//
//  Created by unchain on 2023/03/19.
//

import SwiftUI

struct StockControlView: View {
    @ObservedObject var viewModel: StockControlViewModel

    var body: some View {
        VStack(spacing: 30) {
            Text(viewModel.fruit.icon)
                .font(Font.custom("TossFaceFontMac", size: 60))
            HStack {
                Button(action: {
                    viewModel.minusCount()
                }) {
                    Text("-")
                        .font(Font.custom("BMJUAOTF", size: 30))
                        .frame(width: 20, height: 20)
                }
                .buttonStyle(.borderedProminent)
                Text("\(viewModel.count)")

                Button(action: {
                    viewModel.plusCount()
                }) {
                    Text("+")
                        .frame(width: 20, height: 20)
                }
                .buttonStyle(.borderedProminent)
            }
            .font(Font.custom("BMJUAOTF", size: 24))
        }
    }
}
