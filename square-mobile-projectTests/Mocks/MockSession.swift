//
//  MockSession.swift
//  square-mobile-projectTests
//
//  Created by Michael Duong on 8/14/20.
//

import Foundation
@testable import square_mobile_project

class MockSession: URLSession {
    var lastURL: URL?
    var completionHandler: ((Data, URLResponse, Error) -> Void)?
    static var mockResponse: (data: Data?, URLResponse: URLResponse?, error: Error?)
    
    override class var shared: URLSession {
        return MockSession()
    }
    
    override func dataTask(with request: URLRequest, completionHandler: @escaping (Data?, URLResponse?, Error?) -> Void) -> URLSessionDataTask {
        lastURL = request.url
        self.completionHandler = completionHandler
        return MockTask(response: MockSession.mockResponse, completionHandler: completionHandler)
    }
}
