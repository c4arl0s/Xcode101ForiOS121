import PlaygroundSupport
import Foundation

PlaygroundPage.current.needsIndefiniteExecution = true
let url = URL(string: "https://api.nasa.gov/planetary/apod?api_key=DEMO_KEY")!
let task = URLSession.shared.dataTask(with: url) { (data, response, error) in
    if let data = data,
        let string = String(data: data, encoding: .utf8) { print(string) }
}
task.resume()


