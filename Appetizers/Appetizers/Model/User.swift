//
//  User.swift
//  Appetizers
//
//  Created by Sooni Mohammed on 2020-11-20.
//

import Foundation

struct User: Codable {
    var firstName       = ""
    var lastName        = ""
    var email           = ""
    var birthDate       = Date()
    var extraNapikins   = false
    var frequentRefills = false
}
