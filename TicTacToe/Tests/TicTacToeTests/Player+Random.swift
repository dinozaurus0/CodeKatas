//
//  File.swift
//  
//
//  Created by Vlad Grigore Sima on 20.01.2024.
//

import TicTacToe

extension TicTacToe.Player {
    static var random: Self {
        let randomNumber = Int.random(in: 0..<100)
        return randomNumber % 2 == 0 ? .one : .two
    }
}
