//
//  File.swift
//  GLI-Academy
//
//  Created by beni garcia on 17/01/24.
//

import Foundation

class LoginViewModel {
    func validationLogin(username: String, password: String) -> String{
        if username.isEmpty || password.isEmpty {
            return "Username or password can't be empty"
        }else if username == "alfagift-admin" && password == "asdf" {
            return "Success"
        }else {
            return "Username or password wrong"
        }
    }
}
