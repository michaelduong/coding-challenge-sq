//
//  NetworkManagerTests.swift
//  square-mobile-projectTests
//
//  Created by Michael Duong on 8/14/20.
//

import Foundation
import XCTest
@testable import square_mobile_project

class NetworkManagerTests: XCTestCase {
    var api: SquareAPI!
    let mockNetworkManager = NetworkManager(session: MockSession.shared)
    
    override func setUpWithError() throws {
        self.api = SquareAPI(network: mockNetworkManager)
    }

    override func tearDownWithError() throws {

    }

    func test_Valid_Data() {
        let data = try! Data(contentsOf: MockedData.cleanJSON)
        
        let urlResponse = HTTPURLResponse(url: URL(string: "http://")!, statusCode: 200, httpVersion: nil, headerFields: nil)
        
        MockSession.mockResponse = (data: data, URLResponse: urlResponse, error: nil)
        
        let expectation = self.expectation(description: "ready")
        
        api.fetchEmployees { result in
            switch result {
            case .success(let employees):
                XCTAssertTrue(employees.employees.count > 0)
                expectation.fulfill()
            case .failure(let error):
                XCTAssertNil(error)
                expectation.fulfill()
            }
        }
        waitForExpectations(timeout: 3.0, handler: nil)
    }
    
    func test_Bad_Data() {
        let data = try! Data(contentsOf: MockedData.badJSON)
        
        let urlResponse = HTTPURLResponse(url: URL(string: "http://")!, statusCode: 200, httpVersion: nil, headerFields: nil)
        
        MockSession.mockResponse = (data: data, URLResponse: urlResponse, error: nil)
        
        let expectation = self.expectation(description: "ready")
        
        api.fetchEmployees { result in
            switch result {
            case .success(let employees):
                XCTAssertNil(employees)
            case .failure(let error):
                XCTAssertTrue(error == RequestError.invalidJson, "Parsing error")
                expectation.fulfill()
            }
        }
        waitForExpectations(timeout: 3.0, handler: nil)
    }
    
    func test_Empty_Data() {
        let data = try! Data(contentsOf: MockedData.emptyJSON)
        
        let urlResponse = HTTPURLResponse(url: URL(string: "http://")!, statusCode: 200, httpVersion: nil, headerFields: nil)
        
        MockSession.mockResponse = (data: data, URLResponse: urlResponse, error: nil)
        
        let expectation = self.expectation(description: "ready")
        
        api.fetchEmployees { result in
            switch result {
            case .success(let employees):
                XCTAssertTrue(employees.employees.count == 0)
                expectation.fulfill()
            case .failure(let error):
                XCTAssertNil(error)
                expectation.fulfill()
            }
        }
        waitForExpectations(timeout: 3.0, handler: nil)
    }
    
    func test_Bad_Network_Request() {
        let urlResponse = HTTPURLResponse(url: URL(string: "http://")!, statusCode: 400, httpVersion: nil, headerFields: nil)
        
        MockSession.mockResponse = (data: nil, URLResponse: urlResponse, error: nil)
       
        let expectation = self.expectation(description: "ready")
        
        api.fetchEmployees { result in
            switch result {
            case .success(_):
                expectation.fulfill()
            case .failure(let error):
                XCTAssertTrue(error == RequestError.badRequest, "Bad network request")
                expectation.fulfill()
            }
        }
        waitForExpectations(timeout: 3.0, handler: nil)
    }
}
