//
//  Concetraton.swift
//  Concetration
//
//  Created by Nikita Babarykin on 21.01.2020.
//  Copyright © 2020 Nikita Babarykin. All rights reserved.
//


class Concetration {
    
    private var cards = [Card]()
    
    private var indexOfOneAndOnlyFaceUpCard: Int? {
        get {
            var oneAndOnlyFaceUpCardIndex: Int?
            for index in cards.indices {
                if cards[index].isFaceUp {
                    if oneAndOnlyFaceUpCardIndex == nil {
                        oneAndOnlyFaceUpCardIndex = index
                    } else {
                        return nil
                    }
                }
            }
            return oneAndOnlyFaceUpCardIndex
        }
        set {
            if newValue == nil {
                return
            }
            for index in cards.indices {
                cards[index].isFaceUp = (index == newValue)
            }
        }
    }
    
    init(numberOfPairsOfCards: Int) {
        assert(numberOfPairsOfCards > 0, "Concetration#init(numberOfPairsOfCards\(numberOfPairsOfCards)), there must be at least one pair of cards")
        for _ in 0..<numberOfPairsOfCards {
            let card = Card()
            cards += [card, card]
        }
        var generator = SystemRandomNumberGenerator()
        cards.shuffle(using: &generator)
    }
    
    func chooseCard(at index: Int) {
        assert(cards.indices.contains(index), "Concetration#chooseCard(at: \(index): chosen index not in the cards")
        if !cards[index].isMatched {
            if let matchIndex = indexOfOneAndOnlyFaceUpCard, matchIndex != index {
                if cards[matchIndex].identifier == cards[index].identifier {
                    cards[matchIndex].isMatched = true
                    cards[index].isMatched = true
                }
                cards[index].isFaceUp = true
            } else {
                indexOfOneAndOnlyFaceUpCard = index
            }
        }
    }
    
    func getCard(at index: Int) -> Card {
        assert(cards.indices.contains(index), "Concetration#getCard(at: \(index): chosen index not in the cards")
        return cards[index]
    }
    
}
