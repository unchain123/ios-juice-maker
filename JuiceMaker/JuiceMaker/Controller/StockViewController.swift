////
////  stockViewController.swift
////  JuiceMaker
////
////  Created by unchain, kiwi on 2022/05/02.
////
//
//import UIKit
//
//final class StockViewController: UIViewController {
//    
//    @IBOutlet weak var strawberryStockLabel: UILabel!
//    @IBOutlet weak var bananaStockLabel: UILabel!
//    @IBOutlet weak var pineappleStockLabel: UILabel!
//    @IBOutlet weak var kiwiStockLabel: UILabel!
//    @IBOutlet weak var mangoStockLabel: UILabel!
//    
//    @IBOutlet weak var strawberryStepper: UIStepper!
//    @IBOutlet weak var bananaStepper: UIStepper!
//    @IBOutlet weak var pineappleStepper: UIStepper!
//    @IBOutlet weak var kiwiStepper: UIStepper!
//    @IBOutlet weak var mangoStepper: UIStepper!
//    
//    override func viewDidLoad() {
//        super.viewDidLoad()
//        setupViews()
//        setupStepper()
//    }
//    
//    @IBAction private func didTapClosedBarButton(_ sender: UIBarButtonItem) {
//        self.dismiss(animated: true)
//    }
//    
//    @IBAction private func didTapStepper(_ sender: UIStepper) {
//        do {
//            let fruit = try findFruit(stepper: sender)
//            changeStock(fruit: fruit)
//        } catch MakeJuiceError.wrongFruit {
//            print("없는 과일입니다")
//        } catch {
//            print("")
//        }
//    }
//    
//    private func setupViews() {
//        strawberryStockLabel.text = showFruitsStock(name: .strawberry)
//        bananaStockLabel.text = showFruitsStock(name: .banana)
//        pineappleStockLabel.text = showFruitsStock(name: .pineapple)
//        kiwiStockLabel.text = showFruitsStock(name: .kiwi)
//        mangoStockLabel.text = showFruitsStock(name: .mango)
//    }
//    
//    private func showFruitsStock(name: Fruit) -> String {
//        return String(FruitStore.shared.showFruitsStock(name: name))
//    }
//    
//    private func findFruit(stepper: UIStepper) throws -> Fruit {
//        switch stepper {
//        case strawberryStepper:
//            return .strawberry
//        case bananaStepper:
//            return .banana
//        case pineappleStepper:
//            return .pineapple
//        case kiwiStepper:
//            return .kiwi
//        case mangoStepper:
//            return .mango
//        default:
//            throw MakeJuiceError.wrongMenu
//        }
//    }
//    
//    private func findFruitStepper(fruit: Fruit) -> UIStepper {
//        switch fruit {
//        case .strawberry:
//            return strawberryStepper
//        case .banana:
//            return bananaStepper
//        case .pineapple:
//            return pineappleStepper
//        case .kiwi:
//            return kiwiStepper
//        case .mango:
//            return mangoStepper
//        }
//    }
//    
//    private func setupStepper() {
//        strawberryStepper.value = Double(FruitStore.shared.showFruitsStock(name: .strawberry))
//        bananaStepper.value = Double(FruitStore.shared.showFruitsStock(name: .banana))
//        pineappleStepper.value = Double(FruitStore.shared.showFruitsStock(name: .pineapple))
//        kiwiStepper.value = Double(FruitStore.shared.showFruitsStock(name: .kiwi))
//        mangoStepper.value = Double(FruitStore.shared.showFruitsStock(name: .mango))
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
//    private func changeStock(fruit: Fruit) {
//        FruitStore.shared.changeStock(fruit: fruit, newValue: Int(findFruitStepper(fruit: fruit).value))
//        selectFruitLabel(fruit: fruit).text = showFruitsStock(name: fruit)
//    }
//}
