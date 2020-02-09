//
//  Card.swift
//  Concetration
//
//  Created by Nikita Babarykin on 21.01.2020.
//  Copyright © 2020 Nikita Babarykin. All rights reserved.
//


struct Card: Hashable {
    
    private var identifier: Int
    
    var isFaceUp: Bool
    
    var isMatched: Bool
    
    private static var identifierFactory = 0
    
    private static func getUniqueIdentifier() -> Int {
        identifierFactory += 1
        return identifierFactory
    }
    
    static func == (lhs: Card, rhs: Card) -> Bool {
        return lhs.identifier == rhs.identifier
    }
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(identifier)
    }
    
    init() {
        self.identifier = Card.getUniqueIdentifier()
        self.isFaceUp = false
        self.isMatched = false
    }
    
}
