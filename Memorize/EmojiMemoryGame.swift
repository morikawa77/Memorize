//
//  EmojiMemoryGame.swift
//  Memorize
//
//  Created by Reginaldo Morikawa on 15/02/21.
//

import SwiftUI

class EmojiMemoryGame {
    private var model: MemoryGame<String> = EmojiMemoryGame.createMemoryGame()
    
    static func createMemoryGame() -> MemoryGame<String> {
        let emojis = ["👻","🎃","🕷","😱","☠️","😈","🙀","🧛‍♂️","🧟‍♂️","🦇","🍬","🍭"].shuffled()
        let pairs = Int.random(in: 2...5)
        return MemoryGame<String>(numberOfPairsOfCards: pairs) { pairIndex in
            return emojis[pairIndex]
        }
    }
    
    var cards: Array<MemoryGame<String>.Card> {
        model.cards
    }
    
    func choose(card: MemoryGame<String>.Card) {
        model.choose(card: card)
    }
}
