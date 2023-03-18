//
//  JuiceView.swift
//  JuiceMaker
//
//  Created by unchain on 2023/03/17.
//

import SwiftUI

struct JuiceCellView: View {
    @State var startAnimation: CGFloat = 0
    var juice: Juice

    init(juice: Juice) {
        self.juice = juice
    }

    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 20)
                .fill(.yellow)
            VStack(spacing: 20) {
                JuiceImageView(startAnimation: startAnimation, juice: juice)
                    .padding()
                Text("\(juice.name)")
                    .font(Font.custom("BMJUAOTF", size: 40))
                ingredientView
            }
            .frame(maxHeight: .infinity)
        }
    }
}

extension JuiceCellView {
    var ingredientView: some View {
        VStack {
            ForEach(juice.recipe.ingredient.sorted(by: >), id: \.key) { fruit, amount in
                HStack {
                    Text(fruit.icon)
                        .font(Font.custom("TossFaceFontMac", size: 30))
                    Group {
                        Text("x")
                        Text("\(amount)")
                    }
                    .font(Font.custom("BMJUAOTF", size: 30))
                }
            }
        }
    }
}

struct JuiceImageView: View {
    @State var startAnimation: CGFloat = 0
    var juice: Juice
    var progress: CGFloat = 0.8

    var body: some View {
        ZStack {
            CupShape()
                .stroke(Color("glassBlue"), style: StrokeStyle(lineWidth: 10, lineCap: .round, lineJoin: .round))
                .frame(width: 120, height: 120)

            CupShape()
                .fill(Color("glassBlue"))
                .frame(width: 120, height: 120)

            WaterWave(progress: progress, waveHeight: 0.3, offset: startAnimation)
                .fill(Color("\(juice.color)"))
                .frame(width: 110, height: 110)
                .mask {
                    CupShape()
                        .fill(.gray)
                        .frame(width: 110, height: 110)
                }
        }
        .onAppear {
            withAnimation(.linear(duration: 2).repeatForever(autoreverses: false)) {
                startAnimation = 360
            }
        }
    }
}

struct CupShape: Shape {
    func path(in rect: CGRect) -> Path {
        var path = Path()
        path.move(to: CGPoint(x: rect.width/10, y: 0))
        path.addLine(to: CGPoint(x: rect.width/10 * 2, y: rect.height))
        path.addLine(to: CGPoint(x: rect.width/10 * 8, y: rect.height))
        path.addLine(to: CGPoint(x: rect.width/10 * 9, y: 0))
        path.addLine(to: CGPoint(x: rect.width/10, y: 0))
        return path
    }
}

struct WaterWave: Shape {
    var progress: CGFloat
    var waveHeight: CGFloat
    var offset: CGFloat

    var animatableData: CGFloat {
        get {offset}
        set {offset = newValue}
    }

    var animatableProgress: CGFloat {
        get {progress}
        set {progress = newValue}
    }

    func path(in rect: CGRect) -> Path {
        return Path { path in
            path.move(to: .zero)

            let progressHeight: CGFloat = (1 - progress) * rect.height
            let height = waveHeight * rect.height

            for value in stride(from: 0, through: rect.width, by: 2) {
                let x: CGFloat = value

                let sine: CGFloat = sin(Angle(degrees: value + offset).radians)/4
                let y: CGFloat = progressHeight + (height * sine)
                path.addLine(to: CGPoint(x: x, y: y))
            }

            path.addLine(to: CGPoint(x: rect.width, y: rect.height))
            path.addLine(to: CGPoint(x: 0, y: rect.height))
        }
    }
}

struct JuiceCellView_Previews: PreviewProvider {
    static var previews: some View {
        JuiceCellView(juice: Juice(name: "딸기주스", recipe: .init(ingredient: [.strawberry: 2]), color: "watermelonRed"))
    }
}

