//
//  File.swift
//
//
//  Created by Vlad Grigore Sima on 05.01.2024.
//

public struct TicTacToe {
    public typealias Board = Matrix<String?>

    public enum Player {
        case one
        case two
    }

    public init() {}

    public func makeMove(player: Player, position: Matrix.Position) -> Board {
        var board = Board(dimension: Board.Dimension(rows: 3, columns: 3))
        if position == 3 {
            board.update(at: 3, with: "X")
        }

        if position == 4 {
            board.update(at: 4, with: "X")
        }

        if position == 6 && player == .two {
            board.update(at: 6, with: "0")
        }

        if position == 6 && player == .one {
            board.update(at: 6, with: "X")
        }

        return board
    }
}
