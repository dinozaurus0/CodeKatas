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

        for (firstBoardValue, secondBoardValues) in zip(firstBoard.values, secondBoard.values) {
            for (lhsValue, rhsValue) in zip(firstBoardValue, secondBoardValues) {
                let comparisonExpression = lhsValue == rhsValue || lhsValue.flatMap( { $0 }) == rhsValue || lhsValue == rhsValue.flatMap( {$0 } )
                if !comparisonExpression {
                    XCTFail("Failed test for method \(function). \n Values are not equal \(String(describing: lhsValue)) & \(String(describing: rhsValue))", file: file, line: line)
                }
            }
        }
    }
}
