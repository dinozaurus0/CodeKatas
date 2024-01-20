//
//  File.swift
//  
//
//  Created by Vlad Grigore Sima on 05.01.2024.
//

import Foundation

public struct Matrix<T> {
    public typealias Dimension = (rows: Int, columns: Int)
    public typealias Position = Int

    public let dimension: Dimension
    public private(set) var values: [[T?]]

    public init(dimension: Dimension) {
        self.dimension = dimension
        self.values = Array(repeating: Array(repeating: nil, count: dimension.columns), count: dimension.rows)
    }

    mutating public func update(at position: Position, with value: T) {
        let row: Int = (position - 1)/(dimension.rows)
        let column: Int = (position - 1)%(dimension.columns)

        values[row][column] = value
    }
}

extension Matrix {
    public init?(values: [[T?]]) {
        guard let firstRow = values.first else { return nil }

        self.dimension = (rows: values.count, columns: firstRow.count)
        self.values = values
    }
}
