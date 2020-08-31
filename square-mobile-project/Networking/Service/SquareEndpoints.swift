//
//  SquareEndpoints.swift
//  square-mobile-project
//
//  Created by Michael Duong on 8/18/20.
//

import Foundation

protocol RequestProvider {
    var urlRequest: URLRequest { get }
}

enum Endpoint {
    case employees
    case employees_malformed
    case employee_empty
}

extension Endpoint: RequestProvider {
    var urlRequest: URLRequest {
        switch self {
        case .employees:
            guard let url = URL(string: Constants.Url.baseUrl + Constants.Url.employees) else {
                preconditionFailure("Invalid URL")
            }
            return URLRequest(url: url)
        case .employee_empty:
            guard let url = URL(string: Constants.Url.baseUrl + Constants.Url.emptyEmployees) else {
                preconditionFailure("Invalid URL")
            }
            return URLRequest(url: url)
        case .employees_malformed:
            guard let url = URL(string: Constants.Url.baseUrl + Constants.Url.malformedEmployees) else {
                preconditionFailure("Invalid URL")
            }
            return URLRequest(url: url)
        }
    }
}
