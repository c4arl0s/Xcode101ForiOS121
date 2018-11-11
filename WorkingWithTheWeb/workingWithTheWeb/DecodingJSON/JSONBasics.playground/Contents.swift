//: Playground - noun: a place where people can play
//How does this JSON map to a Swift type? Let's break down how the JSON data is presented:
//Curly brackets { } encapsulate a dictionary of keys and values.
//Square brackets [ ] encapsulate an array.
//Text inside of quotation marks " " are string values.
//Numbers and Booleans are written without quotation marks.

// “Decoding into Swift Types
import Foundation
import PlaygroundSupport

PlaygroundPage.current.needsIndefiniteExecution = true

extension URL {
    func withQueries(_ queries: [String: String]) -> URL? {
        var components = URLComponents(url: self, resolvingAgainstBaseURL: true)
        components?.queryItems = queries.compactMap { URLQueryItem(name: $0.0, value: $0.1) }
        return components?.url
    }
}
let baseURL = URL(string: "https://api.nasa.gov/planetary/apod")!
let query: [String: String] = [ "api_key": "DEMO_KEY", ]
let url = baseURL.withQueries(query)!
let Task = URLSession.shared.dataTask(with: url) { (data, response, error) in
    if let data = data, let string = String(data: data, encoding: .utf8) {
        print("======")
        print(string)
        print("======")
    }
    if let error = error {
        print(error)
    }
}
Task.resume()

let task = URLSession.shared.dataTask(with: url) { (data, response, error) in
    let decoder = JSONDecoder()
    if let data = data, let photoDictionary = try? decoder.decode([String: String].self, from: data) {
        print("======")
        print(photoDictionary)
        print("======")
    }
}
task.resume()

struct PhotoInfo {
    var title: String
    var description: String
    var url: URL
    var copyright: String?

enum CodingKeys: String, CodingKey {
    case title
    case description = "explanation"
    case url
    case copyright
    }
init(from decoder: Decoder) throws {
    let valueContainer = try decoder.container(keyedBy:
        CodingKeys.self)
    self.title = try valueContainer.decode(String.self, forKey: CodingKeys.title)
    self.description = try valueContainer.decode(String.self, forKey: CodingKeys.description)
    self.url = try valueContainer.decode(URL.self, forKey: CodingKeys.url)
    self.copyright = try? valueContainer.decode(String.self, forKey: CodingKeys.copyright)
    }
}

