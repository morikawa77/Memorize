//
//  Theme.swift
//  Memorize
//
//  Created by Reginaldo Morikawa on 15/02/21.
//

import SwiftUI

struct Theme {
    var name: String
    var emojis: [String]
    var color: Color
    var numberOfPairs: Int?
}

let themes: [Theme] = [
    Theme(name: "Halloween", emojis: ["👻","🎃","🕷","😱","☠️","😈","🙀","🧛‍♂️","🧟‍♂️","🦇","🍬","🍭"], color: .orange),
    Theme(name: "Hearts", emojis: ["❤️","🧡","💛","💚","💙","💜","🖤","🤍","🤎"], color: .gray, numberOfPairs: 4),
    Theme(name: "Horoscope", emojis: ["♈️","♉️","♊️","♋️","♌️","♍️","♎️","♏️","♐️","♑️","♒️","♓️"], color: .purple, numberOfPairs: 4),
    Theme(name: "Flags", emojis: ["🏳️","🏴","🏴‍☠️","🏁","🚩","🇧🇷"], color: .yellow, numberOfPairs: 4),
    Theme(name: "Transportation", emojis: ["🚗","🚌","🛻","🚜","🛴","🛺","🚈","✈️","🚀","🛸","⛵️"], color: .black, numberOfPairs: 4),
    Theme(name: "Drink", emojis: ["🥛","☕️","🧃","🍺","🍹"], color: .red, numberOfPairs: 4),
]
