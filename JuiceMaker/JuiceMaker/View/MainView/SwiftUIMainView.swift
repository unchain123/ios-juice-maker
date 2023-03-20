//
//  SwiftUIMainView.swift
//  JuiceMaker
//
//  Created by unchain on 2023/03/17.
//

import SwiftUI

struct MainView: View {
    @StateObject var viewModel: MainViewModel
    @State var selected: Int = 0

    var body: some View {
        VStack {
            Text("JuiceMaker")
                .font(Font.custom("BUJUAOTF", size: 36))
                .padding(EdgeInsets(top: 5, leading: 0, bottom: 0, trailing: 0))

            Spacer()

            TabView(selection: $selected) {
                ForEach($viewModel.juices.indices, id: \.self) { index in
                    CardView(juice: $viewModel.juices[index])
                        .tag(index)
                }
            }
            .tabViewStyle(PageTabViewStyle(indexDisplayMode: .always))
            .indexViewStyle(.page)
            .frame(height: 400)
            MakeButtonView(viewModel: viewModel, selected: $selected)
                .alert("\(viewModel.juices[selected].name) 나왔습니다!", isPresented: $viewModel.isAlert, actions: {
                    Button("잘 먹겠습니다", role: .none) {}
                })
                .padding(EdgeInsets(top: 20, leading: 0, bottom: 0, trailing: 0))
            StorageButtonView(viewModel: viewModel)
                .padding(EdgeInsets(top: 20, leading: 0, bottom: 0, trailing: 0))
            Spacer()
        }
    }
}

struct CardView: View {
    @Binding var juice: Juice

    var body: some View {
        ZStack {
            Rectangle()
                .fill(Color.yellow)
                .frame(height: 400)
                .cornerRadius(20.0)
                .padding(EdgeInsets(top: 0, leading: 30, bottom: 0, trailing: 30))
            JuiceCellView(juice: juice)
                .frame(width: 300)
        }
    }
}

struct MakeButtonView: View {
    @ObservedObject var viewModel: MainViewModel
    @Binding var selected: Int

    var body: some View {
        Button(action: {
            viewModel.tappedMakeButton(selected: selected)
        }) {
            ZStack {
                Rectangle()
                    .fill(Color.yellow)
                    .frame(width: 100, height: 60)
                    .cornerRadius(5)
                    .shadow(color: Color.yellow, radius: 10, x: 5, y: 5)
                Rectangle()
                    .fill(Color.white)
                    .frame(width: 90, height: 50)
                    .cornerRadius(5)
                Text("만들기")
                    .foregroundColor(Color.black)
            }
        }
    }
}

struct StorageButtonView: View {
    @ObservedObject var viewModel: MainViewModel
    @State var isActive: Bool = false

    var body: some View {
        Button(action: {
            isActive.toggle()
        }) {
            ZStack {
                Rectangle()
                    .fill(Color.yellow)
                    .frame(width: 70, height: 50)
                    .cornerRadius(5)
                    .shadow(color: Color.yellow, radius: 10, x: 5, y: 5)
                Text("과일창고")
                    .font(.caption)
                    .foregroundColor(Color.black)
                    .fullScreenCover(isPresented: $isActive) {
                        StorageView(viewModel: viewModel.storageViewModel, isActive: $isActive)
                    }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        MainView(viewModel: MainViewModel(service: JuiceService()))
    }
}

