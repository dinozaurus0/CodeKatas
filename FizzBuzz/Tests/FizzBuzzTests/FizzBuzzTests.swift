import XCTest
import FizzBuzz

final class FizzBuzzTests: XCTestCase {
    func test_whenInputIsOne_shouldReturnOne() {
        let sut = FizzBuzzGenerator()

        let result = sut.generate(value: 1)

        XCTAssertEqual(result, "1")
    }

    func test_whenInputIsTwo_shouldReturnTwo() {
        let sut = FizzBuzzGenerator()

        let result = sut.generate(value: 2)

        XCTAssertEqual(result, "2")
    }

    func test_whenInputIsThree_shouldReturnFizz() {
        let sut = FizzBuzzGenerator()

        let result = sut.generate(value: 3)

        XCTAssertEqual(result, "fizz")
    }

    func test_whenInputIsSix_shouldReturnFizz() {
        let sut = FizzBuzzGenerator()

        let result = sut.generate(value: 6)

        XCTAssertEqual(result, "fizz")
    }

    func test_whenInputIsFive_shouldReturnBuzz() {
        let sut = FizzBuzzGenerator()

        let result = sut.generate(value: 5)

        XCTAssertEqual(result, "buzz")
    }

    func test_whenInputIsTen_shouldReturnBuzz() {
        let sut = FizzBuzzGenerator()

        let result = sut.generate(value: 10)
        
        XCTAssertEqual(result, "buzz")
    }

    func test_whenInputIsFifteen_shouldReturnFizzBuzz() {
        let sut = FizzBuzzGenerator()

        let result = sut.generate(value: 15)

        XCTAssertEqual(result, "fizzbuzz")
    }

    func test_whenInputIsThirty_shouldReturnFizzBuzz() {
        let sut = FizzBuzzGenerator()

        let result = sut.generate(value: 30)

        XCTAssertEqual(result, "fizzbuzz")
    }
}
