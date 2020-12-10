//
//  main.swift
//  AOCDay2b
//
//  Created by Allison Poppe on 12/10/20.
//

import Foundation

func isPasswordValid(rule: String, password: String) -> Bool {
    let trimmedPass = password.trimmingCharacters(in: .whitespacesAndNewlines)
    let splitRule = rule.split(separator: " ")
    let substrings = String(splitRule[0]).split(separator: "-")
    let firstSubstring = String(substrings[0])
    let secondSubstring = String(substrings[1])
    let char = Character(String(splitRule[1]))
    if (trimmedPass[trimmedPass.index(trimmedPass.startIndex, offsetBy: Int(firstSubstring)! - 1)] == char) ||
        (trimmedPass[trimmedPass.index(trimmedPass.startIndex, offsetBy: Int(secondSubstring)! - 1)] == char) {
        if (trimmedPass[trimmedPass.index(trimmedPass.startIndex, offsetBy: Int(firstSubstring)! - 1)] == char) &&
            (trimmedPass[trimmedPass.index(trimmedPass.startIndex, offsetBy: Int(secondSubstring)! - 1)] == char) {
            return false
        }
        return true
    }
    return false
}

guard let path = Bundle.main.path(forResource: "input", ofType: "txt") else {
    preconditionFailure("Couldn't get a path to input.txt")
}

guard FileManager.default.fileExists(atPath: path) else {
    preconditionFailure("The file input.txt is missing")
}

guard let content = try? String(contentsOfFile: path, encoding:String.Encoding.utf8) else {
    preconditionFailure("Could not get string data from the file")
}

let input = content.split(separator: "\n")

var count = 0

for passAndValidation in input {
    let splitPasswordAndRule = passAndValidation.split(separator: ":")
    if (isPasswordValid(rule: String(splitPasswordAndRule[0]), password: String(splitPasswordAndRule[1]))) {
        count += 1
    }
}

print (count)
