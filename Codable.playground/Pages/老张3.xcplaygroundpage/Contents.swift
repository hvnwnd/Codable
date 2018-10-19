//: [Previous](@previous)

import Foundation

let jsonStr = """
{
"id" : "10009",
"name" : "老张",
"age" : 23,
"face" : "😊",
"birthday" : "1995-09-11",
"graduate_school" : "UCBC",
"home_page": "https://ucbc.edu/pages/laozhang"
}
"""
struct User: Codable {
    let id: String
    let name: String
    let age: UInt
    let face: String
    let birthday: Date
    let graduateSchool: String
    let homePage: URL
    
    private enum CodingKeys: String, CodingKey {
        case id
        case name
        case age
        case face
        case birthday
        case graduateSchool
        case homePage
    }
}

let jsonDecoder = JSONDecoder()
let data = Data(jsonStr.utf8)

let fmt = DateFormatter()
fmt.dateFormat = "yyyy-MM-dd"

do {
    jsonDecoder.keyDecodingStrategy = .convertFromSnakeCase
    jsonDecoder.dateDecodingStrategy = .deferredToDate
//    jsonDecoder.dateDecodingStrategy = .formatted(fmt)
    let user = try jsonDecoder.decode(User.self, from: data)
    print(user)
} catch {
    debugPrint(error)
}

//: [Next](@next)
