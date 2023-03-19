//
//  StorageView.swift
//  JuiceMaker
//
//  Created by unchain on 2023/03/19.
//

import SwiftUI

struct StorageView: View {
    @StateObject var viewModel = StorageViewModel(service: JuiceService())
    @Binding var isActive: Bool

    var body: some View {
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
            Text("Juice Stroage")
                .font(Font.custom("BMJUAOTF", size: 30))
                .bold()
                .foregroundColor(Color.black)


            Button(action: {}) {
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
    }
}

//struct StorageView_Previews: PreviewProvider {
//
//    static var previews: some View {
////        StorageView(viewModel: StorageViewModel(service: JuiceService()), isActive: true)
//    }
//}
