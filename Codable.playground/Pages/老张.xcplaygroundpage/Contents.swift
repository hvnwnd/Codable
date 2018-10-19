//: [Previous](@previous)

import Foundation

let jsonStr = """
{
    "id" : "10009",
    "name" : "老张",
    "age" : 23,
    "face" : "🤪"
}
"""

struct User: Codable {
    let id: String
    let name: String
    let age: UInt
    let face: String
}

let jsonDecoder = JSONDecoder()
let data = jsonStr.data(using: .utf8)
let user = try jsonDecoder.decode(User.self, from: data!)

print(user)

//: [Next](@next)
