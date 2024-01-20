
import XCTest
import TicTacToe

/*
 Test Scenarios:

 General rules:
 1. There are 2 players in the game. (X & 0)
 2. Players can specify the square in which they wanna place their character (X or 0).
 3. Each player take a turn, then is the turn of the other player.
 4. They can't override each other choices.
 5. Players can specify a cell from 1-9. Verify that all transitions are correct. Is this independent of player? <-----
 6. Players' movements are cumulative
 7. Verify that each players choice is correct

 Winning rules:
 7. One player completes a column/row/diagonal. That player wins.
 8. All squares are taken and no players has one of the above mentions conditions. This is a draw.
 9. Once a player completes the above rules the game is over. The other player cannot pick other cells.

 */

struct TestCase {
    let sut: TicTacToe
    let expectedResult: TicTacToe.Board?
}

struct TicTacToeTestMetadata {
    let player: TicTacToe.Player
    let cellPosition: TicTacToe.Board.Position
}

final class TicTacToeTests: XCTestCase {
    func test_playerSpecifiesACell_boardIsUpdatedWithItsChoice() {
        // a lot of assumptions that position & player & test case will align perfectly. Find a way to enforce though compiler to do so
        // metadata seems a bit off. Find a better way to handle that
        let cellPosition = (1..<10)
        let activePlayer = cellPosition.map { _ in TicTacToe.Player.random }
        let testMetadata = zip(activePlayer, cellPosition).map { player, position in
            TicTacToeTestMetadata(player: player, cellPosition: position)
        }
        let testCases = testMetadata.map { metadata in
            TestCase(
                sut: makeSUT(),
                expectedResult: makeBoard(from: metadata.cellPosition, playerSymbol: metadata.player.symbol)
            )
        }

        for (testCase, metadata) in zip(testCases, testMetadata) {
            let actualResult = testCase.sut.move(player: metadata.player, position: metadata.cellPosition)
            XCTAssertEqual(actualResult, testCase.expectedResult)
        }
    }

    // MARK: - Helpers
    private func makeSUT() -> TicTacToe {
        TicTacToe()
    }

    private func makeBoard(from position: Matrix.Position, playerSymbol: String) -> TicTacToe.Board? {
        var board = TicTacToe.Board(values: [[nil, nil, nil], [nil, nil, nil], [nil, nil, nil]])
        board?.update(at: position, with: playerSymbol)

        return board
    }

}

extension TicTacToe.Player {
    static var random: Self {
        let randomNumber = Int.random(in: 0..<100)
        return randomNumber % 2 == 0 ? .one : .two
    }
}

//extension TicTacToe.Board {
//    func emptyBoard(dimension: TicTacToe.Board.Dimension) -> TicTacToe.Board {
//        Array(repeating: Array(repeating: nil, count: dimension.columns), count: dimension.rows)
//    }
//}
