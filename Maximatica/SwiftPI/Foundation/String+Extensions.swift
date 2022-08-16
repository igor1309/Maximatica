//
//  String+Extensions.swift
//
//  Created by Igor Malyarov on 15.08.2019.
//  Copyright © 2019 Igor Malyarov. All rights reserved.
//

import Foundation

/// concatenate array of strings to one string with ", " as divider
/// https://www.hackingwithswift.com/example-code/system/how-to-join-an-array-of-strings-in-a-natural-way
public func stringFromArray(_ array: [String]) -> String {
    array.joined(separator: ", ")
}

public func randomString(length: Int) -> String {
    let letters = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789"
    return String((0..<length).map{ _ in letters.randomElement()! })
}

public extension String {
    func removingPrefix(_ prefix: String) -> String {
        guard hasPrefix(prefix) else { return self }
        return String(dropFirst(prefix.count))
    }

    func removingSuffix(_ suffix: String) -> String {
        guard hasSuffix(suffix) else { return self }
        return String(dropLast(suffix.count))
    }

    func appendingSuffixIfNeeded(_ suffix: String) -> String {
        guard !hasSuffix(suffix) else { return self }
        return appending(suffix)
    }
}
