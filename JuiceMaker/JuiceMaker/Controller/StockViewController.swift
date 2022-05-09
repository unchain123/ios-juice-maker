//
//  stockViewController.swift
//  JuiceMaker
//
//  Created by unchain, kiwi on 2022/05/02.
//

import UIKit

final class StockViewController: UIViewController {
    
    @IBOutlet weak var strawberryStock: UILabel!
    @IBOutlet weak var bananaStock: UILabel!
    @IBOutlet weak var pineappleStock: UILabel!
    @IBOutlet weak var kiwiStock: UILabel!
    @IBOutlet weak var mangoStock: UILabel!
    
    @IBOutlet weak var strawberryStepper: UIStepper!
    @IBOutlet weak var bananaStepper: UIStepper!
    @IBOutlet weak var pineappleStepper: UIStepper!
    @IBOutlet weak var kiwiStepper: UIStepper!
    @IBOutlet weak var mangoStepper: UIStepper!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
        setupStepper()
    }
    
    @IBAction private func didTapClosedStockViewController(_ sender: UIBarButtonItem) {
        self.dismiss(animated: true)
    }
    
    @IBAction private func didTapStepper(_ sender: UIStepper) {
           do {
           let fruit = try findFruit(stepper: sender)
           changeStock(fruit: fruit)
           } catch FruitStoreError.wrongFruit {
               print("없는 과일입니다")
           } catch {
               print("")
           }
       }
    
    private func setupViews() {
        strawberryStock.text = FruitStore.shared.showFruitsStock(name: .strawberry)
        bananaStock.text = FruitStore.shared.showFruitsStock(name: .banana)
        pineappleStock.text = FruitStore.shared.showFruitsStock(name: .pineapple)
        kiwiStock.text = FruitStore.shared.showFruitsStock(name: .kiwi)
        mangoStock.text = FruitStore.shared.showFruitsStock(name: .mango)
    }
    
    private func findFruit(stepper: UIStepper) throws -> Fruit {
        switch stepper {
        case strawberryStepper:
            return .strawberry
        case bananaStepper:
            return .banana
        case pineappleStepper:
            return .pineapple
        case kiwiStepper:
            return .kiwi
        case mangoStepper:
            return .mango
        default:
            throw FruitStoreError.wrongMenu
        }
    }
    
    private func findFruitStepper(fruit: Fruit) -> UIStepper {
        switch fruit {
        case .strawberry:
            return strawberryStepper
        case .banana:
            return bananaStepper
        case .pineapple:
            return pineappleStepper
        case .kiwi:
            return kiwiStepper
        case .mango:
            return mangoStepper
        }
    }
    
    private func setupStepper() {
        strawberryStepper.value = Double(makeVaildStepperValue(fruit: .strawberry))
        bananaStepper.value = Double(makeVaildStepperValue(fruit: .banana))
        pineappleStepper.value = Double(makeVaildStepperValue(fruit: .pineapple))
        kiwiStepper.value = Double(makeVaildStepperValue(fruit: .kiwi))
        mangoStepper.value = Double(makeVaildStepperValue(fruit: .mango))
    }
    
    private func makeVaildStepperValue(fruit: Fruit) -> Int {
        guard let stepperValue = FruitStore.shared.fruits[fruit] else { return -1 }
        return stepperValue
    }
    
    private func selectFruitLable(fruit: Fruit) -> UILabel {
        switch fruit {
        case .strawberry:
            return strawberryStock
        case .mango:
            return mangoStock
        case .kiwi:
            return kiwiStock
        case .pineapple:
            return pineappleStock
        case .banana:
            return bananaStock
        }
    }
    
    private func changeStock(fruit: Fruit) {
        FruitStore.shared.fruits[fruit] = Int(findFruitStepper(fruit: fruit).value)
        selectFruitLable(fruit: fruit).text = FruitStore.shared.showFruitsStock(name: fruit)
    }
}
