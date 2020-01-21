//
//  Card.swift
//  Concetration
//
//  Created by Nikita Babarykin on 21.01.2020.
//  Copyright © 2020 Nikita Babarykin. All rights reserved.
//


struct Card {
    
    private(set) var identifier: Int
    
    var isFaceUp: Bool
    
    var isMatched: Bool
    
    private static var identifierFactory = 0
    
    private static func getUniqueIdentifier() -> Int {
        identifierFactory += 1
        return identifierFactory
    }
    
    init() {
        self.identifier = Card.getUniqueIdentifier()
        self.isFaceUp = false
        self.isMatched = false
    }
    
}
