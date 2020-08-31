//
//  MockTask.swift
//  square-mobile-projectTests
//
//  Created by Michael Duong on 8/14/20.
//

import Foundation

class MockTask: URLSessionDataTask {
    
    typealias Response = (data: Data?, URLResponse: URLResponse?, error: Error?)
        var mockResponse: Response
        let completionHandler: ((Data?, URLResponse?, Error?) -> Void)?
        
        init(response: Response, completionHandler: ((Data?, URLResponse?, Error?) -> Void)?) {
            self.mockResponse = response
            self.completionHandler = completionHandler
        }
        
        override func resume() {
            completionHandler!(mockResponse.data, mockResponse.URLResponse, mockResponse.error)
        }
}
