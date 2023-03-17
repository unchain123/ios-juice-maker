//
//  JuiceServiceTests.swift
//  JuiceServiceTests
//
//  Created by unchain on 2023/03/17.
//

import XCTest
@testable import JuiceMaker

final class JuiceServiceTests: XCTestCase {
    var sut: JuiceService!

    override func setUpWithError() throws {
        sut = JuiceService()
    }

    override func tearDownWithError() throws {
        sut = nil
    }

    func test_plusStock메서드를_호출시_값이_1증가하는지() throws {
        //given
        let expectResult: Int = sut.stock[.kiwi]! + 1

        //when
        sut.plusStock(fruit: .kiwi)

        let result = sut.stock[.kiwi]
        //then
        XCTAssertEqual(expectResult, result)
    }

    func test_plusStock메서드를_다섯번_호출시_값이_5증가하는지() throws {
        //given
        let expectResult: Int = sut.stock[.banana]! + 5
        //when
        for _ in 1...5 {
            sut.plusStock(fruit: .banana)
        }
        let result = sut.stock[.banana]
        //then

        XCTAssertEqual(expectResult, result)
    }

    func test_minusStock메서드를_호출시_값이_1감소하는지() throws {
        //given
        let expectResult: Int = sut.stock[.banana]! - 1
        //when
        sut.minusStock(fruit: .banana)

        let result = sut.stock[.banana]
        //then

        XCTAssertEqual(expectResult, result)
    }

    func test_minusStock메서드를_5번호출시_값이_5감소하는지() throws {
        //given
        let expectResult: Int = sut.stock[.banana]! - 5
        //when
        for _ in 1...5 {
            sut.minusStock(fruit: .banana)
        }
        let result = sut.stock[.banana]
        //then

        XCTAssertEqual(expectResult, result)
    }

    func test_addNewJuice메서드를_호출했을때_내가원하는주스가_추가되었는지() throws {
        //given
        let expectResult: Juice = Juice(name: "testJuice", recipe: .init(ingredient: [.banana: 3]))
        //when
        sut.addNewJuice(expectResult)

        let result = sut.juices.last
        //then


        XCTAssertEqual(expectResult.name, result?.name)
        XCTAssertEqual(expectResult.recipe.ingredient, result?.recipe.ingredient)
    }

    func test_makeJuice메서드를_호출시_값이_내가_원하는주스가반환되고_재고가바뀌는지() throws {
        // given
        let testJuice = Juice(name: "테스트 주스", recipe: .init(ingredient: [.mango: 3]))

        let expectStock: Int = sut.stock[.mango]! - 3

        let result = sut.makeJuice(testJuice)

        // then
        switch result {
        case .success(let juice):
          XCTAssertEqual(testJuice.name, juice.name)
          XCTAssertEqual(testJuice.recipe.ingredient, juice.recipe.ingredient)
        case .failure(let error):
            XCTAssertEqual(MakeJuiceError.outOfStock, error)
        }

        XCTAssertEqual(expectStock, sut.stock[.mango]!)
    }

    func test_makeJuice메서드를_호출시_재고가모자랄때_outOfRange에러를_보내는지() throws {
     //given
    let testJuice = Juice(name: "테스트 주스", recipe: .init(ingredient: [.mango: 20]))

    let result = sut.makeJuice(testJuice)

    // then
    switch result {
    case .success(let juice):
      XCTAssertEqual(testJuice.name, juice.name)
      XCTAssertEqual(testJuice.recipe.ingredient, juice.recipe.ingredient)
    case .failure(let error):
        XCTAssertEqual(MakeJuiceError.outOfStock, error)
    }
}

    func test_changeStock메서드를_호출하면_재고가_바뀌는지() throws {
        // given
        let expectResult = 10
        // when
        sut.changeStock([.mango: 10])
        // then
        let result = sut.stock[.mango]
        XCTAssertEqual(expectResult, result)
      }

    func test_isEnoughStock메서드를_호출할때_재고가_부족하면_false_반환하는지() throws {
        // given

        // when
        let testJuice = Juice(name: "testJuice", recipe: .init(ingredient: [.banana: 30]))

        let result = sut.isEnoughStock(juice: testJuice)
        // then

        XCTAssertFalse(result)
      }
}
