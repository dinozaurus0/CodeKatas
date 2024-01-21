
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
 6. Players' movements are cumulative <--
 7. ++ Verify that each players choice is correct. (Covered by point 5 where we use any player)

 Winning rules:
 7. One player completes a column/row/diagonal. That player wins.
 8. All squares are taken and no players has one of the above mentions conditions. This is a draw.
 9. Once a player completes the above rules the game is over. The other player cannot pick other cells.

 */

final class TicTacToeTests: XCTestCase {}
