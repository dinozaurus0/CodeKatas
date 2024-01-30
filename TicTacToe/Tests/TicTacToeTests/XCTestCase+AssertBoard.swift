//
//  File.swift
//  
//
//  Created by Vlad Grigore Sima on 20.01.2024.
//

import XCTest
import TicTacToe

extension XCTestCase {
    func assertEqualBoards(
        firstBoard: TicTacToe.Board,
        secondBoard: TicTacToe.Board,
        function: String = #function,
        file: StaticString = #filePath,
        line: UInt = #line
    ) {
        if firstBoard.dimension != secondBoard.dimension {
            XCTFail("Boards dimension is not equal", file: file, line: line)
        }

        var position: Int = 0

        for (firstBoardValue, secondBoardValues) in zip(firstBoard.values, secondBoard.values) {
            for (lhsValue, rhsValue) in zip(firstBoardValue, secondBoardValues) {
                position += 1
                let comparisonExpression = lhsValue == rhsValue || lhsValue.flatMap( { $0 }) == rhsValue || lhsValue == rhsValue.flatMap( {$0 } )
                if !comparisonExpression {
                    let errorMessage = "Failed test for method \(function). \n Values are not equal \(String(describing: lhsValue)) & \(String(describing: rhsValue)) at position: \(position)"
                    XCTFail(errorMessage, file: file, line: line)
                }
            }
        }
    }
}
