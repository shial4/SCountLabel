//
//  SCountLabel.swift
//  SCountLabel
//
//  Created by Shial on 9/6/17.
//  Copyright © 2017 Shial. All rights reserved.
//

import Foundation
import UIKit

extension UILabel {
    func count(to: String, interval: TimeInterval = 0.2, format: [String]? = nil) {
        count(from: text ?? to, to: to, interval: interval, format: format)
    }
    
    func count(from: String, to: String, interval: TimeInterval = 0.05, format: [String]? = nil) {
        struct Counter {
            static var timer: NSMapTable<UILabel,Timer> = NSMapTable(keyOptions: NSPointerFunctions.Options.weakMemory, valueOptions: NSPointerFunctions.Options.strongMemory)
            static func numbers(_ text: String) -> [String] {
                do {
                    let regex = try NSRegularExpression(pattern: "[\\-\\+]?[0-9]*(\\.[0-9]+)?")
                    let nsString = text as NSString
                    let results = regex.matches(in: text, range: NSRange(location: 0, length: nsString.length))
                    return results.map { nsString.substring(with: $0.range)}.filter({ !$0.isEmpty })
                } catch {
                    return []
                }
            }
            fileprivate static func shouldContinue(_ from: Double, to: Double, round: Double, offset: Double = 0) -> Bool {
                if to - from < 0 {
                    return shift(from, to: to, round: round, offset: offset) > to
                } else {
                    return shift(from, to: to, round: round, offset: offset) < to
                }
            }
            
            fileprivate static func shift(_ from: Double, to: Double, round: Double, offset: Double = 0) -> Double {
                if to - from < 0 {
                    return (from - (1 * pow(10.0, offset)) * round)
                } else {
                    return (from + (1 * pow(10.0, offset)) * round)
                }
            }
        }
        Counter.timer.object(forKey: self)?.invalidate()
        Counter.timer.removeObject(forKey: self)
        text = from
        let fromValues = Counter.numbers(from)
        let toValues = Counter.numbers(to)
        let numbersCount = fromValues.count < toValues.count ? fromValues.count : toValues.count
        guard numbersCount > 0 else {
            self.text = to
            return
        }
        var round: Double = 1
        Counter.timer.setObject(Timer.scheduledTimer(withTimeInterval: interval, repeats: true) {[weak self] timer in
            var fromString = from
            var shouldInvalidate = true
            for i in 0..<numbersCount {
                guard let fromD = Double(fromValues[i]),
                    let toD = Double(toValues[i]),
                    let offset = Double(format?[i].components(separatedBy: CharacterSet(charactersIn: ".0123456789").inverted).joined() ?? "0"),
                    Counter.shouldContinue(fromD, to: toD, round: round, offset: offset) else { continue }
                fromString = fromString.replacingOccurrences(of: fromValues[i], with: String(format: format?[i] ?? "%0.0f", Counter.shift(fromD, to: toD, round: round, offset: offset)))
                shouldInvalidate = false
            }
            if shouldInvalidate {
                self?.text = to
                Counter.timer.object(forKey: self)?.invalidate()
                Counter.timer.removeObject(forKey: self)
            } else {
                self?.text = fromString
                round = round + 1
            }
        }, forKey: self)
    }
}
