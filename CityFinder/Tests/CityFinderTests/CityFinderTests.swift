import XCTest
@testable import CityFinder

/*
 1. If the search text is fewer than 2 characters, then should return no results. (It is an optimization feature of the search functionality.)
 2. If the search text is equal to or more than 2 characters, then it should return all the city names starting with the exact search text
 a. For example for search text “Va”, the function should return Valencia and Vancouver
 3. The search functionality should be case insensitive
 4. The search functionality should work also when the search text is just a part of a city
 name
 a. For example “ape” should return “Budapest” city
 5. If the search text is a “*” (asterisk), then it should return all the city names.
 */

final class CityFinderTests: XCTestCase {
    func test_search_withEmptyCharacter_shouldReturnNoResults() {
        let sut = CityFinder()

        let result = sut.find(using: "")

        XCTAssertEqual(result, [])
    }

    func test_search_withMatchingSingleCharacter_shouldReturnNoResults() {
        let sut = CityFinder()

        let result = sut.find(using: "A")

        XCTAssertEqual(result, [])
    }

    func test_search_withPrefixVa_shouldReturnCitiesStartingWithPrefix() {
        let sut = CityFinder()

        let result = sut.find(using: "Va")

        XCTAssertEqual(result, ["Valencia", "Vancouver"])
    }

    func test_search_withPrefixRo_shouldReturnCitiesStartingWithPrefix() {
        let sut = CityFinder()

        let result = sut.find(using: "Ro")

        XCTAssertEqual(result, ["Rotterdam", "Rome"])
    }

    func test_search_withCaseInsensitivePrefix_shouldReturnCitiesStartingWithPrefix() {
        let sut = CityFinder()

        let result = sut.find(using: "ro")

        XCTAssertEqual(result, ["Rotterdam", "Rome"])
    }

    func test_search_withSearchTextApe_shouldReturnCitiesContainingSearchText() {
        let sut = CityFinder()

        let result = sut.find(using: "ape")

        XCTAssertEqual(result, ["Budapest"])
    }

    func test_search_withSearchTextDam_shouldReturnCitiesContainingSearchText() {
        let sut = CityFinder()

        let result = sut.find(using: "Dam")

        XCTAssertEqual(result, ["Rotterdam", "Amsterdam"])
    }

    func test_search_withAsterix_shouldReturnAllCities() {
        let sut = CityFinder()

        let result = sut.find(using: "*")

        XCTAssertEqual(result, cities)
    }
}
