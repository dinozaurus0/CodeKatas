//
//  File.swift
//  
//
//  Created by Vlad Grigore Sima on 30.01.2024.
//

import XCTest
import TicTacToe

final class TicTacToeCumulativeSelectionTests: XCTestCase {
    func test_selectCells_boardUpdatedAtSelectedPosition_forAnyPlayer() {
        let boardPositions = [
            (0, 0), (0, 1), (0, 2),
            (1, 0), (1, 1), (1, 2),
            (2, 0), (2, 1), (2, 2)
        ]

        let testCases = boardPositions.map { (row, column) in
            TestCase(
                sut: makeSUT(),
                expectedResult: makeBoard(for: anyPlayer.symbol, row: row, column: column)
            )
        }

        let cellPosition = (1..<10)
        for (testCase, position) in zip(testCases, cellPosition)  {
            let actualResult = testCase.sut.move(player: anyPlayer, at: position)
            assertEqualBoards(firstBoard: actualResult, secondBoard: testCase.expectedResult!)
        }
    }

    // MARK: - Helpers
    private func makeSUT() -> TicTacToe {
        TicTacToe()
    }

    private func makeBoard(
        for value: String?,
        row: Int,
        column: Int
    ) -> TicTacToe.Board? {
        var values: [[String?]] = [[nil, nil, nil], [nil, nil, nil], [nil, nil, nil]]
        values[row][column] = value

        return TicTacToe.Board(values: values)
    }
}
