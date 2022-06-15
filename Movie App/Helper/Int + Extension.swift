//
//  Int + Extension.swift
//  Movie App
//
//  Created by Rufan Abdurahmanov on 14.06.22.
//

import Foundation

extension Int {
    func withCommas() -> String {
        let numberFormatter = NumberFormatter()
        numberFormatter.numberStyle = .decimal
        return numberFormatter.string(from: NSNumber(value:self))!
    }
}
