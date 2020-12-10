//
//  main.swift
//  AOCDay1
//
//  Created by Allison Poppe on 12/9/20.
//

import Foundation

guard let path = Bundle.main.path(forResource: "input", ofType: "txt") else {
    preconditionFailure("Couldn't get a path to input.txt")
}

guard FileManager.default.fileExists(atPath: path) else {
    preconditionFailure("The file input.txt is missing")
}

guard let content = try? String(contentsOfFile: path, encoding:String.Encoding.utf8) else {
    preconditionFailure("Could not get string data from the file")
}

let contentLines = content.split(separator: "\n")

for line in contentLines {
    for secondLine in contentLines {
        if Int(line)! + Int(secondLine)! == 2020 {
            print(Int(line)! * Int(secondLine)!)
            exit(0)
        }
    }
}
