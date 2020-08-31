//
//  SquareAPI.swift
//  square-mobile-project
//
//  Created by Michael Duong on 8/18/20.
//

import Foundation

protocol EmployeeProvider {
    var network: Networking { get }
    
    func fetchEmployees(_ completionHandler: @escaping (Result<EmployeesResponse, RequestError>) -> Void)
}

struct SquareAPI: EmployeeProvider {
    var network: Networking
    
    func fetchEmployees(_ completionHandler: @escaping (Result<EmployeesResponse, RequestError>) -> Void) {
        network.execute(Endpoint.employees, completionHandler: completionHandler)
    }
}
