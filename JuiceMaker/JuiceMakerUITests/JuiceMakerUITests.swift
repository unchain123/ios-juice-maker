//
//  JuiceMakerUITests.swift
//  JuiceMakerUITests
//
//  Created by unchain on 2023/03/20.
//

import XCTest

final class JuiceMakerUITests: XCTestCase {
    let app = XCUIApplication()

    override func setUpWithError() throws {
        app.launch()
        continueAfterFailure = false
    }

    override func tearDownWithError() throws {
    }

    func test_주스가_만들어지면_얼럿띄우는지() throws {
        let button = app.buttons["만들기"]
        button.tap()
        XCTAssertTrue(app.alerts["딸기 주스 나왔습니다! "].scrollViews.otherElements.buttons["잘 먹겠습니다."].waitForExistence(timeout: 1))
    }

    func test_재고가_없을때_재고없음버튼으로_바뀌는지() throws {
        let button = app.buttons["만들기"]
        button.tap()
        let button2 = app.alerts["딸기 주스 나왔습니다! "].scrollViews.otherElements.buttons["잘 먹겠습니다."]
                button2.tap()
                button.tap()
                button2.tap()
        XCTAssert(
            app.buttons["재고없음"].waitForExistence(timeout: 1)
        )
    }

    func test_재고없음버튼을_클릭하면_창고로가시겠습니까_얼럿메시지띄우는지() throws {
        let button = app.buttons["만들기"]
        button.tap()
        let button2 = app.alerts["딸기 주스 나왔습니다! "].scrollViews.otherElements.buttons["잘 먹겠습니다."]
                button2.tap()
                button.tap()
                button2.tap()
                let button3 = app.buttons["재고없음"]
                button3.tap()
        XCTAssert(
            app.alerts["재고가 부족합니다.\n 창고로 가시겠습니까?"].scrollViews.otherElements.buttons["네"].waitForExistence(timeout: 1)
        )
    }

    func test_얼럿을통해창고로이동후_재고를_10개늘리고_저장하면_다시_버튼이_만들기로_바뀌는지() throws {
        let button = app.buttons["만들기"]
        button.tap()
        let button2 = app.alerts["딸기 주스 나왔습니다! "].scrollViews.otherElements.buttons["잘 먹겠습니다."]
                button2.tap()
                button.tap()
                button2.tap()
                let button3 = app.buttons["재고없음"]
                button3.tap()
                app.alerts["재고가 부족합니다.\n 창고로 가시겠습니까?"].scrollViews.otherElements.buttons["네"].tap()


        let app = XCUIApplication()
        let strawberryButton = app.scrollViews.otherElements.containing(.staticText, identifier:"🍓").children(matching: .button).matching(identifier: "+").element(boundBy: 1)
        for _ in 1...10 {
            strawberryButton.tap()
        }

        app.buttons["저장"].tap()
        XCTAssert(
            app.buttons["만들기"].waitForExistence(timeout: 1)
        )

}

    func testLaunchPerformance() throws {
        if #available(macOS 10.15, iOS 13.0, tvOS 13.0, watchOS 7.0, *) {
            // This measures how long it takes to launch your application.
            measure(metrics: [XCTApplicationLaunchMetric()]) {
                XCUIApplication().launch()
            }
        }
    }
}
