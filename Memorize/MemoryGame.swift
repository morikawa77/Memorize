//
//  MemoryGame.swift
//  Memorize
//
//  Created by Reginaldo Morikawa on 15/02/21.
//

import Foundation

struct MemoryGame<CardContent> where CardContent: Equatable {
    private(set) var cards: Array<Card>
    private(set) var score = 0
    
    private var indexOfTheOneAndOnlyFaceUpCard: Int? {
        get { cards.indices.filter { cards[$0].isFaceUp }.only }
        set {
            for index in cards.indices {
               cards[index].isFaceUp = index == newValue
            }
        }
    }
    
    mutating func choose(_ card: Card) {
            if let chosenIndex = cards.firstIndex(matching: card), !cards[chosenIndex].isFaceUp, !cards[chosenIndex].isMatched {
                // Check if there is a card faced up
                if let potentialMatchIndex = indexOfTheOneAndOnlyFaceUpCard {
                    
                    // Check if there' a match, update the score
                    if cards[chosenIndex].content == cards[potentialMatchIndex].content{
                        cards[chosenIndex].isMatched = true
                        cards[potentialMatchIndex].isMatched = true
                        updateScore(with: cards[chosenIndex], with: cards[potentialMatchIndex])
                        
                    } // If no match, mark both cards as seen and update the score
                    else {
                        updateScore(with: cards[chosenIndex], with: cards[potentialMatchIndex])
                        cards[chosenIndex].seen = true
                        cards[potentialMatchIndex].seen = true
                        
                    }
                    // Show the second card whether there's a match or not
                    cards[chosenIndex].isFaceUp = true
                    
                    // If there is no faced up card
                } else {
                    indexOfTheOneAndOnlyFaceUpCard = chosenIndex
                    
                }
            }
        }
    
    init(numberOfPairsOfCards: Int, cardContentFactory: (Int) -> CardContent) {
        cards = Array<Card>()
        for pairIndex in 0..<numberOfPairsOfCards {
            let content = cardContentFactory(pairIndex)
            cards.append(Card(content: content, id: pairIndex*2))
            cards.append(Card(content: content, id: pairIndex*2+1))
        }
        
        cards.shuffle()
    }
    
    mutating func updateScore(with firstCard: Card, with secondCard: Card) {
            if firstCard.isMatched, secondCard.isMatched {
                score += 2
            } else {
                if firstCard.seen {
                    score -= 1
                }
                if secondCard.seen {
                    score -= 1
                }
            }
        }
    
    struct Card: Identifiable {
        var isFaceUp: Bool = false
        var isMatched: Bool = false
        var content: CardContent
        var id: Int
        var seen: Bool = false
    }
}
