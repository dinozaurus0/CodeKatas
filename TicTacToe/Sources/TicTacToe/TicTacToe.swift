//
//  File.swift
//
//
//  Created by Vlad Grigore Sima on 05.01.2024.
//

public struct TicTacToe {
    public typealias Board = Matrix<String?>

    public enum Player: String {
        case one = "X"
        case two = "O"

        public var symbol: String { self.rawValue }
    }

    public init() {}

    public func move(player: Player, at position: Matrix.Position) -> Board {
        let boardSize: TicTacToe.Board.Dimension = (rows: 3, columns: 3)
        var board = Board(dimension: boardSize)

        board.update(at: position, with: player.symbol)

        return board
    }
}
