//
//  EmployeeTableViewController.swift
//  square-mobile-project
//
//  Created by Michael Duong on 8/12/20.
//

import UIKit

final class EmployeeTableViewController: UITableViewController {
    
    // MARK: - Properties & Outlets
    private let dataSource = EmployeeDataSource()
    private var api: EmployeeProvider
    
    // MARK: - View Lifecycle Methods
    init(style: UITableView.Style, api: EmployeeProvider) {
        self.api = api
        super.init(style: style)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        populateTableView()
    }
    
    // MARK: - UI Functions
    private func setupUI() {
        tableView.backgroundColor = UIColor.backgroundGray
        title = NSLocalizedString(Constants.Strings.screenTitle, comment: "")
        setupTableView()
    }
    
    private func setupTableView() {
        tableView.register(EmployeeTableViewCell.self, forCellReuseIdentifier: Constants.Strings.employeeCellId)
        tableView.dataSource = dataSource
        tableView.estimatedRowHeight = 134
        tableView.rowHeight = 134
    }
    
    // MARK: - Network Call
    private func populateTableView() {
        api.fetchEmployees { [weak self] result in
            switch result {
            case .success(let employees):
                let employeeObjects = employees.employees
                let employeeViewModelArray = employeeObjects.compactMap { EmployeeViewModel(employee: $0) }
                if employeeViewModelArray.isEmpty {
                    DispatchQueue.main.async {
                        self?.displayEmptyAlert()
                    }
                } else {
                    DispatchQueue.main.async {
                        self?.dataSource.employeeViewModels = employeeViewModelArray
                        self?.tableView.reloadData()
                    }                    
                }
            case .failure(let error):
                DispatchQueue.main.async {
                    self?.displayErrorAlert(of: error)
                }
            }
        }
    }
    
    // MARK: - Alert
    private func displayErrorAlert(of errorType: RequestError) {
        var message = ""
        switch errorType {
        case .badURL:
            message = NSLocalizedString(Constants.Strings.badUrlMessage, comment: "")
        case .invalidJson:
            message = NSLocalizedString(Constants.Strings.invalidJsonMessage, comment: "")
        case .noNetwork:
            message = NSLocalizedString(Constants.Strings.noNetworkMessage, comment: "")
        case .badRequest:
            message = NSLocalizedString(Constants.Strings.badRequestMessage, comment: "")
        }
        
        let ac = UIAlertController(title: NSLocalizedString("Error", comment: ""), message: message, preferredStyle: .alert)
        let okAction = UIAlertAction(title: NSLocalizedString("Ok", comment: ""), style: .default)
        ac.addAction(okAction)
        present(ac, animated: true)
    }
    
    private func displayEmptyAlert() {
        let ac = UIAlertController(title: NSLocalizedString("Empty", comment: ""), message: NSLocalizedString("The network request returned an empty list/JSON data.", comment: ""), preferredStyle: .alert)
        let okAction = UIAlertAction(title: NSLocalizedString("Ok", comment: ""), style: .default)
        ac.addAction(okAction)
        present(ac, animated: true)
    }
}
