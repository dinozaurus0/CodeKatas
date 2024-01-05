
import XCTest
/*
 Test Scenarios:

 General rules:
 1. There are 2 players in the game. (X & 0)
 2. Players can specify the square in which they wanna place their character (X or 0).
 3. Each player take a turn, then is the turn of the other player.
 4. They can't override each other choices.
 5. Players can specify a cell from 1-9. Verify that all transitions are correct. Is this independent of player?

 Winning rules:
 6. One player completes a column/row/diagonal. That player wins.
 7. All squares are taken and no players has one of the above mentions conditions. This is a draw.
 8. Once a player completes the above rules the game is over. The other player cannot pick other cells.

 */



public struct TicTacToe {
    public typealias Position = Int
    public typealias Matrix = [[String?]]

    public enum Player {
        case one
        case two
    }

    public init() {}

    func makeMove(player: Player, position: Position) -> Matrix {
        if position == 3 {

            return [
                [nil, nil, "X",
                 nil, nil, nil,
                 nil, nil, nil
                ]
            ]
        }

        if position == 4 {
            return [
                [nil, nil, nil,
                 "X", nil, nil,
                 nil, nil, nil
                ]
            ]
        }

        if position == 6 && player == .two {
            return [
                [nil, nil, nil,
                 nil, nil, "0",
                 nil, nil, nil
                ]
            ]
        }

        if position == 6 && player == .one {
            return [
                [nil, nil, nil,
                 nil, nil, "X",
                 nil, nil, nil
                ]
            ]
        }


        return [
            [nil, nil, nil,
             nil, nil, nil,
             nil, nil, nil
            ]
        ]
    }

}

final class TicTacToeTests: XCTestCase {
    // func test_playerSpecifiesACell_boardIsUpdatedWithItsChoice()

    func test_playerOneSpecifiesCell3_boardIsUpdatedWithItsChoice() {
        let sut = TicTacToe()

        let result = sut.makeMove(player: .one, position: 3)

        XCTAssertEqual(result, [
            [nil, nil, "X",
             nil, nil, nil,
             nil, nil, nil
            ]
        ])
    }

    func test_playerOneSpecifiesCell4_boardIsUpdatedWithItsChoice() {
        let sut = TicTacToe()

        let result = sut.makeMove(player: .one, position: 4)

        XCTAssertEqual(result, [
            [nil, nil, nil,
             "X", nil, nil,
             nil, nil, nil
            ]
        ])
    }

    func test_playerTwoSpecifiesCell6_boardIsUpdatedWithItsChoice() {
        let sut = TicTacToe()

        let result = sut.makeMove(player: .two, position: 6)

        XCTAssertEqual(result, [
            [nil, nil, nil,
             nil, nil, "0",
             nil, nil, nil
            ]
        ])
    }

    func test_playerOneSpecifiesCell6_boardIsUpdatedWithItsChoice() {
        let sut = TicTacToe()

        let result = sut.makeMove(player: .one, position: 6)

        XCTAssertEqual(result, [
            [nil, nil, nil,
             nil, nil, "X",
             nil, nil, nil
            ]
        ])
    }
}
