//
//  Constants.swift
//  square-mobile-project
//
//  Created by Michael Duong on 8/12/20.
//

import Foundation

struct Constants {

    struct Strings {
        static let screenTitle = "Square Employee Directory"
        static let employeeCellId = "employeeCellId"
        
        static let badUrlMessage = "There was an error with the URL/endpoint."
        static let invalidJsonMessage = "There was an issue parsing the JSON data properly."
        static let noNetworkMessage = "There is currently no network connection."
        static let badRequestMessage = "There was an error with the network request."
    }
    
    struct Images {
        static let placeholder = "avatar-placeholder"
    }
    
    struct Url {
        static let baseUrl = "https://s3.amazonaws.com/sq-mobile-interview/"
        static let employees = "employees.json"
        static let malformedEmployees = "employees_malformed.json"
        static let emptyEmployees = "employees_empty.json"
    }
}
