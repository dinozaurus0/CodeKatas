//
//  File.swift
//  
//
//  Created by Vlad Grigore Sima on 20.01.2024.
//

import TicTacToe

extension Matrix where T: Equatable {
    static func isEqual(lhs: Matrix, rhs: Matrix) -> Bool {
        guard lhs.dimension == rhs.dimension else { return false }

        for (lhsValues, rhsValues) in zip(lhs.values, rhs.values) {
            for (lhsValue, rhsValue) in zip(lhsValues, rhsValues) {
                let comparisonExpression = lhsValue.map( { $0 }) == rhsValue || lhsValue == rhsValue.map( {$0 } ) || lhsValue == rhsValue
                guard comparisonExpression else { return false }
            }
        }

        return true
    }
}
