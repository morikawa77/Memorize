//
//  Array+Only.swift
//  Memorize
//
//  Created by Reginaldo Morikawa on 15/02/21.
//

import Foundation

extension Array {
    var only: Element? {
        count == 1 ? first : nil
    }
}
