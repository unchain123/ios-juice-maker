//
//  JuiceMenuViewModelTest.swift
//  JuiceServiceTests
//
//  Created by unchain on 2023/03/20.
//

import XCTest
@testable import JuiceMaker

final class JuiceMenuViewModelTest: XCTestCase {
    var sut: JuiceViewModel!
    var mockService = MockService()

    override func setUpWithError() throws {
        sut = JuiceViewModel(service: mockService, viewRouter: ViewRouter())
    }

    override func tearDownWithError() throws {
        sut = nil
    }

    func test_tappedMakeButton을_호출하여_성공한주스의_정보가_일치하는지() throws {
        //given
        let successJuice = Juice(name: "성공했다", recipe: .init(ingredient: [.apple: 3]))
        sut.juices.append(successJuice)

        // when
        sut.tappedMakeButton(selected: 0)
        let result = sut.juices[0]

        // then
        XCTAssertEqual(successJuice.name, result.name)
    }

    func test_isEnough메서드를_호출했을때_재고가충분할때_True를_반환하는지() {
        //given
        let successJuice = Juice(name: "필요한주스", recipe: .init(ingredient: [.apple: 3]))
        sut.juices.append(successJuice)
        // when
        let result = sut.isEnough(fruit: 0)

        // then
        XCTAssertTrue(result)
    }
}

final class MockService: JuiceServiceProtocol {
    var stock: [Fruit : Int] = [.apple: 10]
    var juices: [Juice] = []

    func plusStock(fruit: Fruit) { }

    func minusStock(fruit: Fruit) { }

    func addNewJuice(_ juice: Juice) {
        juices.append(juice)
    }

    func makeJuice(_ juice: Juice) -> Result<Juice, MakeJuiceError> {
        if juice.name == "성공주스" {
            return .success(Juice(name: "성공주스", recipe: .init(ingredient: [:]), color: "red"))
        } else if juice.name == "재고부족" {
            return .failure(.outOfStock)
        } else {
            return .failure(.wrongFruit)
        }
    }

    func changeStock(_ newStock: [JuiceMaker.Fruit : Int]) { }

    func isEnoughStock(juice: JuiceMaker.Juice) -> Bool { return true }
}
