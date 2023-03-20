//
//  StorageViewModelTest.swift
//  JuiceServiceTests
//
//  Created by unchain on 2023/03/20.
//

import XCTest
@testable import JuiceMaker

class StorageViewModelTest: XCTestCase {
    var sut: StorageViewModel!
    let mockService = MockService()

    override func setUpWithError() throws {
        mockService.stock = [.banana: 10]
        sut = StorageViewModel(service: mockService)
    }

    override func tearDownWithError() throws {
      sut = nil
    }

  func test_stockCount호출시() {
    // given
    let expectResult = 10
    // when
    sut.stockCount()
    let result = sut.juiceStock[.banana]!
    // then
    XCTAssertEqual(expectResult, result)
  }

  func test_saveStock호출시_변경이_되는지() {
    // given
    let expectResult: [Fruit: Int] = [.banana: 10]
    // when
    sut.saveStock()
    // then
    let result = mockService.stock
    XCTAssertEqual(expectResult, result)
  }
}
