//
//  EmployeeViewModel.swift
//  square-mobile-project
//
//  Created by Michael Duong on 8/12/20.
//

import UIKit

struct EmployeeViewModel {
    let uuid: String
    let name: String
    let phone: String?
    let email: String
    let bio: String?
    let team: String
    let type: String?
    var imageUrl: URL?
    
    init(employee: Employee) {
        self.uuid = employee.uuid
        self.name = employee.fullName
        self.phone = employee.phoneNumber?.toPhoneNumber()
        self.email = employee.emailAddress
        self.bio = employee.biography
        self.team = employee.team
        self.type = employee.employeeType?.rawValue
        
        if let employeeImageUrl = employee.photoUrlSmall {
            self.imageUrl = URL(string: employeeImageUrl)
        }
    }
}
