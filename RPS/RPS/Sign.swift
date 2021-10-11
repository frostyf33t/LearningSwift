//
//  Sign.swift
//  RPS
//
//  Created by Mehdi S on 9/11/21.
//

import Foundation

func randomSign() -> Sign{
    let sign = Int.random(in: 0...2)
    if sign == 0{
        return .rock
    }
    else if sign == 1{
        return .paper
    }
    else{
        return .scissors
    }
}

enum Sign{
    
    case rock
    case paper
    case scissors
    
    
    
    func comparison(_ otherSign:Sign)->GameState{
        if self == Sign.rock && otherSign == Sign.scissors{
            return GameState.Win
        }
        if self == Sign.paper && otherSign == Sign.rock{
            return GameState.Win
        }
        if self == Sign.scissors && otherSign == Sign.paper{
            return GameState.Win
        }
        if self == otherSign{
            return GameState.Draw
        }
        else{
            return GameState.Lose
        }
    }
}

