//
//  EmployeeViewModel.swift
//  square-mobile-project
//
//  Created by Michael Duong on 8/12/20.
//

import UIKit

protocol EmployeeViewModelDelegate: AnyObject {
    func populateTableView()
    func displayErrorAlert(of errorType: RequestError)
    func displayEmptyAlert()
}

protocol EmployeeViewModelInterface {
    var employees: [Employee] { get set }
    var delegate: EmployeeViewModelDelegate? { get set }
    
    func employeeName(at index: Int) -> String
    func employeePhone(at index: Int) -> String?
    func employeeTeam(at index: Int) -> String
    func employeeEmail(at index: Int) -> String
    func employeePicture(at index: Int) -> URL?
    func fetchEmployees(_ completionHandler: @escaping ([Employee]) -> Void)
}

class EmployeeViewModel: EmployeeViewModelInterface {
    private let api: EmployeeProvider
    public weak var delegate: EmployeeViewModelDelegate?
    var employees: [Employee] = []

    func employeeName(at index: Int) -> String {
        return employees[index].fullName
    }
    
    func employeePhone(at index: Int) -> String? {
        return employees[index].phoneNumber?.toPhoneNumber()
    }
    
    func employeeTeam(at index: Int) -> String {
        return employees[index].team
    }
    
    func employeeEmail(at index: Int) -> String {
        return employees[index].emailAddress
    }
    
    func employeePicture(at index: Int) -> URL? {
        if let employeeImageUrl = employees[index].photoUrlSmall {
            return URL(string: employeeImageUrl)!
        }
        
        return nil
    }
    
    func fetchEmployees(_ completionHandler: @escaping ([Employee]) -> Void) {
        api.fetchEmployees { [weak self] result in
            guard let self = self else { return }
            
            switch result {
            case .success(let employees):
                let employeeObjects = employees.employees
                self.employees = employeeObjects.compactMap { $0 }
                if self.employees.isEmpty {
                    DispatchQueue.main.async {
                        self.delegate?.displayEmptyAlert()
                    }
                } else {
                    DispatchQueue.main.async {
                        self.delegate?.populateTableView()
                    }
                }
            case .failure(let error):
                DispatchQueue.main.async {
                    self.delegate?.displayErrorAlert(of: error)
                }
            }
        }
    }
    
    func employee(at index: Int) -> Employee {
        return employees[index]
    }
    
    init(api: EmployeeProvider) {
        self.api = api
                
        fetchEmployees { [weak self] employees in
            self?.employees = employees
            self?.delegate?.populateTableView()
        }
    }
}
