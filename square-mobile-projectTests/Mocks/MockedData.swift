//
//  MockedData.swift
//  square-mobile-projectTests
//
//  Created by Michael Duong on 8/14/20.
//

import Foundation

public final class MockedData {
    public static let cleanJSON: URL = Bundle(for: MockedData.self).url(forResource: "employees", withExtension: "json")!
    public static let badJSON: URL = Bundle(for: MockedData.self).url(forResource: "employees_malformed", withExtension: "json")!
    public static let emptyJSON: URL = Bundle(for: MockedData.self).url(forResource: "employees_empty", withExtension: "json")!
}
