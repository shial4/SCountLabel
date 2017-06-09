//
//  SCountLabel.swift
//  SCountLabel
//
//  Created by Shial on 9/6/17.
//  Copyright © 2017 Shial. All rights reserved.
//

import Foundation

extension UILabel {
    func count(to: String, interval: TimeInterval = 0.2, format: [String]? = nil) {
        count(from: text ?? to, to: to, interval: interval, format: format)
    }
    
    func count(from: String, to: String, interval: TimeInterval = 0.2, format: [String]? = nil) {
        struct Counter {
            static var timer: Timer?
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
            fileprivate static func shouldContinue(_ from: Double, to: Double, round: Int) -> Bool {
                if to - from < 0 {
                    return shift(from, to: to, round: round) > to
                } else {
                    return shift(from, to: to, round: round) < to
                }
            }
            
            fileprivate static func shift(_ from: Double, to: Double, round: Int) -> Double {
                if to - from < 0 {
                    return (from - Double(1 * round))
                } else {
                    return (from + Double(1 * round))
                }
            }
        }
        Counter.timer?.invalidate()
        Counter.timer = nil
        text = from
        let fromValues = Counter.numbers(from)
        let toValues = Counter.numbers(to)
        let numbersCount = fromValues.count < toValues.count ? fromValues.count : toValues.count
        guard numbersCount > 0 else {
            self.text = to
            return
        }
        var round: Int = 1
        Counter.timer = Timer.scheduledTimer(withTimeInterval: interval, repeats: true) {[weak self] timer in
            var fromString = from
            var shouldInvalidate = true
            for i in 0..<numbersCount {
                guard let fromD = Double(fromValues[i]),
                    let toD = Double(toValues[i]),
                    Counter.shouldContinue(fromD, to: toD, round: round) else { continue }
                fromString = fromString.replacingOccurrences(of: fromValues[i], with: String(format: format?[i] ?? "%0.0f", Counter.shift(fromD, to: toD, round: round)))
                shouldInvalidate = false
            }
            if shouldInvalidate {
                self?.text = to
                Counter.timer?.invalidate()
                Counter.timer = nil
            } else {
                self?.text = fromString
                round = round + 1
            }
        }
    }
}
