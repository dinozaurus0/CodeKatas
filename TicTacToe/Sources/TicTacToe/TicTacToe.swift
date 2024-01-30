//
//  File.swift
//
//
//  Created by Vlad Grigore Sima on 05.01.2024.
//

public class TicTacToe {
    public typealias Board = Matrix<String?>

    public enum Player: String {
        case one = "X"
        case two = "O"

        public var symbol: String { self.rawValue }
    }

    public private(set) var board: Board

    public init() {
        let boardSize: TicTacToe.Board.Dimension = (rows: 3, columns: 3)
        self.board = Board(dimension: boardSize)
    }

    public func move(player: Player, at position: Matrix.Position) -> Board {
        board.update(at: position, with: player.symbol)
        return board
    }
}
