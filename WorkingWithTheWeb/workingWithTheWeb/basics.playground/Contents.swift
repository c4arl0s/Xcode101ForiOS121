//
//  Basics.swift
//  createAURL
//
//  Created by Carlos Santiago Cruz on 27/09/18.
//  Copyright © 2018 Carlos Santiago Cruz. All rights reserved.
//

import Foundation
import PlaygroundSupport

// =========================================================
PlaygroundPage.current.needsIndefiniteExecution = true
// =========================================================

// create a URL
let url = URL(string: "https://www.apple.com")!

// Create a Network Request
let task = URLSession.shared.dataTask(with: url) { (data, response, error) in
    if let data = data,
        let string = String(data: data, encoding: .utf8) {
            print(string)
    }
}
// Send the Request
// ===========
task.resume()
// ===========
// Generally, this is all you need to start a network request.
// Up until now, all the code you've written has run synchronously, which means it runs on the main thread of the device's processor. You can think of a thread as a queue, or a line, of instructions that the processor will execute in order. As the processor handles each instruction, it moves on to the next. If a processor has one thread, it can process one instruction at a time. If a processor has multiple threads, it can execute one instruction at a time for each—sometimes known as multiprocessing.
// For now, what you need to know is that playgrounds don't support asynchronous code
// once you understand syncrnous and asyncronous.
// at this point you have to add import PlaygroundSupport at the top of the file

// You should see the HTML for the https://www.apple.com home page printed to the console.
// You may be wondering why you'd want your iOS app to fetch a website's HTML. That's a great question. In fact, fetching HTML isn't very useful at all. HTML describes how a website should be displayed in a browser—not in an iOS app.
// More often than not, you'll want to use a network request to fetch raw information (instead of the website's HTML), which you can serialize into model objects and display in your app, just as you've done in previous apps throughout this course..
