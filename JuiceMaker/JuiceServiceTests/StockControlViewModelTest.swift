//
//  StockControlViewModelTest.swift
//  JuiceServiceTests
//
//  Created by unchain on 2023/03/20.
//

import XCTest
@testable import JuiceMaker

final class StockControlViewModelTest: XCTestCase {
    var sut: StockControlViewModel!

    override func setUpWithError() throws {
        sut = StockControlViewModel(fruit: .mango, count: 5)
    }

    override func tearDownWithError() throws {
        sut = nil
    }

    func test_plusFruit호출시_count가_잘_증가하는지() {
      // given
        let expectedResult = 6
      // when
      sut.plusCount()
      let result = sut.count
      // then
      XCTAssertEqual(expectedResult, result)
    }

    func test_minusFruit호출시_count가_잘_감소하는지() {
      // given
        let expectedResult = 4

      // when
      sut.minusCount()
      let result = sut.count

      // then
      XCTAssertEqual(expectedResult, result)
    }
  }
