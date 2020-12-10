//
//  main.swift
//  AOCDay2
//
//  Created by Allison Poppe on 12/10/20.
//

import Foundation

func isPasswordValid(rule: String, password: String) -> Bool {
    let splitRule = rule.split(separator: " ")
    let bounds = String(splitRule[0]).split(separator: "-")
    let lowerBounds = String(bounds[0])
    let upperBounds = String(bounds[1])
    let char = Character(String(splitRule[1]))
    let occurences = password.trimmingCharacters(in: .whitespacesAndNewlines).lowercased().filter { $0 == Character(String(char).lowercased()) }.count
    if (occurences < Int(lowerBounds)!) || (occurences > Int(upperBounds)!) {
        return false
    }
    return true
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
