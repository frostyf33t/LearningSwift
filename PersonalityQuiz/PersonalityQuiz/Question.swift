//
//  Question.swift
//  PersonalityQuiz
//
//  Created by Mehdi S on 10/4/21.
//

import Foundation


struct Question{
    var text: String
    var type: ResponseType
    var answers: [Answer]
    
    enum ResponseType{
        case single
        case multiple
        case ranged
        
    }
    
}


struct Answer{
    var text: String
    var type: AnimalType
    
}
    
enum AnimalType: Character {
    case dog = "🐶"
    case cat = "🐱"
    case rabbit = "🐰"
    case turtle = "🐢"
        
    var definition: String {
        switch self {
        case .dog:
            return "You are and incredibly outgoing and loyal person"
        case .cat:
            return "You are a mischevious person"
        case .rabbit:
            return "You are healthy and full of energy"
        case .turtle:
            return "Wise beyond your years.  Slow and steady wins the race"
        }
    }
    
}
