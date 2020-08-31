//
//  EmployeeDataSource.swift
//  square-mobile-project
//
//  Created by Michael Duong on 8/13/20.
//

import UIKit

final class EmployeeDataSource: NSObject, UITableViewDataSource {
    
    // MARK: - Properties
    var employeeViewModel: EmployeeViewModelInterface!
    
    // MARK: - Data Source Functions
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return employeeViewModel.employees.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: Constants.Strings.employeeCellId, for: indexPath) as? EmployeeTableViewCell else { return UITableViewCell() }
        
        cell.bind(employeeViewModel: employeeViewModel, for: indexPath.row)
        
        return cell
    }
}
