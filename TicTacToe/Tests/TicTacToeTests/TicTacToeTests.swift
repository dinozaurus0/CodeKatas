
import XCTest
import TicTacToe

/*
 Test Scenarios:

 General rules:
 1. There are 2 players in the game. (X & 0)
 2. ++ Players can specify the square in which they wanna place their character (X or 0). (Covered by point 5)
 3. Each player take a turn, then is the turn of the other player.
 4. They can't override each other choices.
 5. ++ Players can specify a cell from 1-9. Verify that all transitions are correct. Is this independent of player?
 6. ++ Players' movements are cumulative
 7. ++ Verify that each players choice is correct. (Covered by point 5 where we use any player)

 Winning rules:
 7. One player completes a column/row/diagonal. That player wins.
 8. All squares are taken and no players has one of the above mentions conditions. This is a draw.
 9. Once a player completes the above rules the game is over. The other player cannot pick other cells.

 */

let anyPlayer = TicTacToe.Player.random

final class TicTacToeTests: XCTestCase {
    func test_selectMultipleCells_boardUpdatesAreCumulative_forAnyPlayer() {
        let player = anyPlayer
        let boardPositions = (
            matrixIndices: [(0, 1), (0, 2), (1, 1)],
            indices: [2, 3, 5]
        )
        let newPosition = (
            matrixPosition: (2, 0),
            index: 7
        )
        let testCase = TestCase(
            sut: makeSUT(for: boardPositions.indices, player: player),
            expectedResult: makeBoard(for: boardPositions.matrixIndices + [newPosition.matrixPosition], symbol: player.symbol)
        )

        let actualBoard = testCase.sut.move(player: player, at: newPosition.index)

        assertEqualBoards(firstBoard: actualBoard, secondBoard: testCase.expectedResult!)
    }

    // MARK: - Helpers

    private func makeSUT(
        for indices: [Int],
        player: TicTacToe.Player
    ) -> TicTacToe {

        let sut = TicTacToe()
        indices.forEach { index in
            _ = sut.move(player: player, at: index)
        }

        return sut
    }

    private func makeBoard(
        for indices: [(Int, Int)],
        symbol: String
    ) -> TicTacToe.Board? {
        var values: [[String?]] = [[nil, nil, nil], [nil, nil, nil], [nil, nil, nil]]
        indices.forEach { (row, column) in
            values[row][column] = symbol
        }

        return TicTacToe.Board(values: values)
    }
}
