//
//  EmojiMemoryGame.swift
//  Memorize
//
//  Created by Reginaldo Morikawa on 15/02/21.
//

import SwiftUI

class EmojiMemoryGame: ObservableObject {
    @Published private var model: MemoryGame<String>
    
    private static func createMemoryGame(with theme: Theme) -> MemoryGame<String> {
        let emojis = theme.emojis.shuffled()
        
        let themePairs = theme.numberOfPairs ?? Int.random(in: 2..<5)
        
        return MemoryGame<String>(numberOfPairsOfCards: themePairs) { emojis[$0] }
    }
    
    init() {
            model = EmojiMemoryGame.createMemoryGame(with: theme)
    }
    
    var theme = themes.randomElement()!
    
    var score: Int {
        model.score
    }
    
    var cards: Array<MemoryGame<String>.Card> {
        model.cards
    }
    
    func choose(card: MemoryGame<String>.Card) {
        model.choose(card)
    }
    
    func newGame() {
        theme = themes.randomElement()!
        model = EmojiMemoryGame.createMemoryGame(with: theme)
    }
}
