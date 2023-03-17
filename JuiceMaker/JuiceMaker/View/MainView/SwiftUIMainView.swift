//
//  SwiftUIMainView.swift
//  JuiceMaker
//
//  Created by unchain on 2023/03/17.
//

import SwiftUI

struct MainView: View {
    @State private var index = 0

    var body: some View {
        VStack {
            Text("JuiceMaker")
                .font(.largeTitle)
            VStack {
                TabView(selection: $index) {
                    ForEach((0..<3), id: \.self) { index in
                        CardView()
                    }
                }
                .tabViewStyle(PageTabViewStyle(indexDisplayMode: .always))
                .indexViewStyle(.page)
            }
            .frame(height: 400)
            MakeButtonView()
                .padding(EdgeInsets(top: 20, leading: 0, bottom: 0, trailing: 0))
            StorageView()
                .padding(EdgeInsets(top: 20, leading: 0, bottom: 0, trailing: 0))
        }
    }
}

struct CardView: View {
    var body: some View {
        Rectangle()
            .fill(Color.yellow.opacity(0.9))
            .frame(height: 400)
            .cornerRadius(20.0)
            .padding(EdgeInsets(top: 0, leading: 30, bottom: 0, trailing: 30))
    }
}

struct MakeButtonView: View {
    var body: some View {
        Button(action: {}) {
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

struct StorageView: View {
    var body: some View {
        Button(action: {}) {
            ZStack {
                Rectangle()
                    .fill(Color.yellow)
                    .frame(width: 70, height: 50)
                    .cornerRadius(5)
                    .shadow(color: Color.yellow, radius: 10, x: 5, y: 5)
                Text("과일창고")
                    .font(.caption)
                    .foregroundColor(Color.black)
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}

