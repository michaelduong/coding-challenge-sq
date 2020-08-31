//
//  square_mobile_projectTests.swift
//  square-mobile-projectTests
//
//  Created by Michael Duong on 8/12/20.
//

import XCTest
@testable import square_mobile_project

class square_mobile_projectTests: XCTestCase {
    
    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        super.setUp()
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testEmployeeViewModel() {
        let employee = Employee(uuid: "1337", fullName: "Michael Duong", phoneNumber: "9494236366", emailAddress: "michaelduong@my.com", biography: "Soon to be Cash App Team's newest iOS engineer.", photoUrlSmall: nil, photoUrlLarge: nil, team: "Banking", employeeType: .FULL_TIME)
        let employeeViewModel = EmployeeViewModel(employee: employee)
        
        XCTAssertEqual(employee.fullName, employeeViewModel.name)
        XCTAssertEqual("(949) 423-6366", employeeViewModel.phone)
    }
}
