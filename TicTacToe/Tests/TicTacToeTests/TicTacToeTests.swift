import XCTest
@testable import TicTacToe

/*
 Test Scenarios:

 General rules:
 1. There are 2 players in the game. (X & 0)
 2. Players can specify the square in which they wanna place their character (X or 0).
 3. Each player take a turn, then is the turn of the other player.
 4. They can't override each other choices.
 5. Players can specify a cell from 1-9

 Winning rules:
 6. One player completes a column/row/diagonal. That player wins.
 7. All squares are taken and no players has one of the above mentions conditions. This is a draw.
 8. Once a player completes the above rules the game is over. The other player cannot pick other cells.
 */

final class TicTacToeTests: XCTestCase {
    
}
