//
//  Employee.swift
//  square-mobile-project
//
//  Created by Michael Duong on 8/12/20.
//

import Foundation

struct EmployeesResponse: Decodable, Equatable {
    let employees: [Employee]
}

struct Employee: Decodable, Comparable, Equatable {
    let uuid: String
    let fullName: String
    let phoneNumber: String?
    let emailAddress: String
    let biography: String?
    let photoUrlSmall: String?
    let photoUrlLarge: String?
    let team: String
    let employeeType: EmployeeType?
    
    enum CodingKeys: String, CodingKey {
        case uuid, biography, team
        case fullName = "full_name"
        case phoneNumber = "phone_number"
        case emailAddress = "email_address"
        case photoUrlSmall = "photo_url_small"
        case photoUrlLarge = "photo_url_large"
        case employeeType = "employee_type"
    }
    
    // For sorting later
    static func < (lhs: Employee, rhs: Employee) -> Bool {
        return lhs.fullName < rhs.fullName
    }
    
    // For grouping & filtering later down the road
    static func == (lhs: Employee, rhs: Employee) -> Bool {
        return lhs.team == rhs.team || lhs.employeeType == rhs.employeeType
    }
}

enum EmployeeType: String, Decodable {
    case FULL_TIME = "FULL_TIME"
    case PART_TIME = "PART_TIME"
    case CONTRACTOR = "CONTRACTOR"
}
