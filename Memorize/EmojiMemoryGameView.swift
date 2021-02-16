//
//  EmojiMemoryGameView.swift
//  Memorize
//
//  Created by Reginaldo Morikawa on 15/02/21.
//

import SwiftUI

struct EmojiMemoryGameView: View {
    @ObservedObject var viewModel: EmojiMemoryGame

    var body: some View {
        VStack(alignment: .leading) {
            Text("Theme: \(viewModel.theme.name)").font(.title).padding(EdgeInsets(top: 20, leading: 20, bottom: 0, trailing: 0))
            Text("Score: \(viewModel.score)").font(.headline).padding(EdgeInsets(top: 20, leading: 20, bottom: 0, trailing: 0))
        }.frame(width: .greatestFiniteMagnitude)
        
        Grid(viewModel.cards) { card in
                CardView(card: card).onTapGesture {
                    viewModel.choose(card: card)
                }
                .padding(5)
            }
            .padding()
            .foregroundColor(viewModel.theme.color)
        
        Button("New Game") {
            withAnimation(.easeInOut){
                viewModel.newGame()
            }
        }
            .padding()

    }
}

struct CardView: View {
    var card: MemoryGame<String>.Card
    
    var body: some View {
        GeometryReader { geometry in
            if card.isFaceUp || !card.isMatched {
                ZStack {
                    Pie(startAngle: Angle.degrees(0-90), endAngle: Angle.degrees(110-90), clockwise: true)
                        .padding(5).opacity(0.4)
                    Text(card.content)
                        .font(Font.system(size: fontSize(for: geometry.size)))
                }
                .cardify(isFaceUp: card.isFaceUp)
            }
        }
    }
    
    
    private func fontSize(for size:CGSize) -> CGFloat {
        min(size.width, size.height)*0.7
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        let game = EmojiMemoryGame()
        game.choose(card: game.cards[0])
        return EmojiMemoryGameView(viewModel: game)
    }
}
