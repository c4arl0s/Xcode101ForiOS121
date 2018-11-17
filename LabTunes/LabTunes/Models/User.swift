//
//  User.swift
//  LabTunes
//
//  Created by Carlos Santiago Cruz on 09/11/18.
//  Copyright © 2018 Carlos Santiago Cruz. All rights reserved.
//

import Foundation

class User {
    static let userName = "iOSLab"
    static let password = "verysecure"
    static let session = Session.sharedInstance
    
    // se crea un metodo static por que aun no se ha creado un usuario.
    static func login(userName: String, password: String) -> Bool {
        if self.userName == userName, self.password == password {
        session.SaveSession()
        return true
        }
        return false
    }
    static func fetchSongs() throws {
        guard let token = Session.sharedInstance.token else { throw UserError.notSessionAvailable }
        debugPrint(token)
    }
    enum UserError: Error {
    case notSessionAvailable
    }
}
