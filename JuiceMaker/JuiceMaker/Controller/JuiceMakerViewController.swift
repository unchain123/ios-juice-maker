////
////  JuiceMaker - ViewController.swift
////  Created by yagom. 
////  Copyright © yagom academy. All rights reserved.
//// 
//
//import UIKit
//
//final class JuiceMakerViewController: UIViewController {
//    
//    @IBOutlet weak var strawberryStockLabel: UILabel!
//    @IBOutlet weak var bananaStockLabel: UILabel!
//    @IBOutlet weak var pineappleStockLabel: UILabel!
//    @IBOutlet weak var kiwiStockLabel: UILabel!
//    @IBOutlet weak var mangoStockLabel: UILabel!
//    
//    @IBOutlet weak var strawBerryBananJuiceButton: UIButton!
//    @IBOutlet weak var mangoKiwiJuiceButton: UIButton!
//    @IBOutlet weak var strawberryJuiceButton: UIButton!
//    @IBOutlet weak var bananaJuiceButton: UIButton!
//    @IBOutlet weak var pineappleJuiceButton: UIButton!
//    @IBOutlet weak var kiwiJuiceButton: UIButton!
//    @IBOutlet weak var mangoJuiceButton: UIButton!
//    
//    private let juiceMaker = JuiceMaker()
//    
//    override func viewWillAppear(_ animated: Bool) {
//        super.viewWillAppear(animated)
//        updateViews()
//        self.navigationItem.accessibilityLabel = "My accessible label"
//    }
//    
//    @IBAction private func didTapOrderJuice(_ sender: UIButton) {
//        do {
//            let order = try orderJuice(sender: sender)
//            makeJuice(fruit: order)
//            for (fruit, _) in order.recipe {
//                let stock = selectFruitLabel(fruit: fruit)
//                stock.text = showFruitsStock(name: fruit)
//            }
//        } catch MakeJuiceError.wrongMenu {
//            print("없는 메뉴입니다")
//        } catch {
//            print("")
//        }
//        strawberryStockLabel.accessibilityLabel = "딸기의 남은 수량은 \(strawberryStockLabel.text!)개 입니다."
//        bananaStockLabel.accessibilityLabel = "바나나의 남은 수량은 \(bananaStockLabel.text!)개 입니다."
//        pineappleStockLabel.accessibilityLabel = "파인애플의 남은 수량은 \(pineappleStockLabel.text!)개 입니다."
//        kiwiStockLabel.accessibilityLabel = "키위의 남은 수량은 \(kiwiStockLabel.text!)개 입니다."
//        mangoStockLabel.accessibilityLabel = "망고의 남은 수량은 \(mangoStockLabel.text!)개 입니다."
//    }
//    
//    private func updateViews() {
//        strawberryStockLabel.text = showFruitsStock(name: .strawberry)
//        bananaStockLabel.text = showFruitsStock(name: .banana)
//        pineappleStockLabel.text = showFruitsStock(name: .pineapple)
//        kiwiStockLabel.text = showFruitsStock(name: .kiwi)
//        mangoStockLabel.text = showFruitsStock(name: .mango)
//        strawberryStockLabel.accessibilityLabel = "딸기의 남은 수량은 \(strawberryStockLabel.text!)개 입니다."
//        bananaStockLabel.accessibilityLabel = "바나나의 남은 수량은 \(bananaStockLabel.text!)개 입니다."
//        pineappleStockLabel.accessibilityLabel = "파인애플의 남은 수량은 \(pineappleStockLabel.text!)개 입니다."
//        kiwiStockLabel.accessibilityLabel = "키위의 남은 수량은 \(kiwiStockLabel.text!)개 입니다."
//        mangoStockLabel.accessibilityLabel = "망고의 남은 수량은 \(mangoStockLabel.text!)개 입니다."
//    }
//    
//    private func showFruitsStock(name: Fruit) -> String {
//        return String(FruitStore.shared.showFruitsStock(name: name))
//    }
//    
//    private func selectFruitLabel(fruit: Fruit) -> UILabel {
//        switch fruit {
//        case .strawberry:
//            return strawberryStockLabel
//        case .mango:
//            return mangoStockLabel
//        case .kiwi:
//            return kiwiStockLabel
//        case .pineapple:
//            return pineappleStockLabel
//        case .banana:
//            return bananaStockLabel
//        }
//    }
//    
//    private func orderJuice(sender: UIButton) throws -> Juice {
//        switch sender {
//        case strawBerryBananJuiceButton:
//            return .strawberryBanana
//        case mangoKiwiJuiceButton:
//            return .mangoKiwi
//        case strawberryJuiceButton:
//            return .strawberry
//        case bananaJuiceButton:
//            return .banana
//        case pineappleJuiceButton:
//            return .pineapple
//        case kiwiJuiceButton:
//            return .kiwi
//        case mangoJuiceButton:
//            return .mango
//        default:
//            throw MakeJuiceError.wrongMenu
//        }
//    }
//    
//    private func showMakeJuiceMessage(message: String) {
//        let makeJuiceMessage = UIAlertController(title: nil, message: message, preferredStyle: .alert)
//        let okButton = UIAlertAction(title: "OK", style: .default, handler: nil)
//        makeJuiceMessage.addAction(okButton)
//        present(makeJuiceMessage, animated: true, completion: nil)
//    }
//    
//    private func showCheckStockMessage() {
//        let checkStockMessage = UIAlertController(title: "재료가 모자라요. 재고를 수정할까요?", message: nil, preferredStyle: .alert)
//        let yesButton = UIAlertAction(title: "예", style: .default) { _ in
//            self.performSegue(withIdentifier: "showFruitStockSegue", sender: nil)
//        }
//        let noButton = UIAlertAction(title: "아니오", style: .default, handler: nil)
//        
//        checkStockMessage.addAction(yesButton)
//        checkStockMessage.addAction(noButton)
//        present(checkStockMessage, animated: true, completion: nil)
//    }
//    
//    private func makeJuice(fruit: Juice) {
//        if juiceMaker.canMakeJuice(flavor: fruit) {
//            showMakeJuiceMessage(message: "\(fruit.name) 나왔습니다! 맛있게 드세요!")
//        } else {
//            showCheckStockMessage()
//        }
//    }
//}
//
