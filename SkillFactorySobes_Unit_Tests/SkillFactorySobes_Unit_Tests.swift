//
//  SkillFactorySobes_Unit_Tests.swift
//  SkillFactorySobes_Unit_Tests
//
//  Created by Иван Тарасенко on 30.05.2023.
//

import XCTest
import Moya
@testable import SkillFactorySobes

final class SkillFactorySobes_Unit_Tests: XCTestCase {
    
    private let requester = MoyaProvider<RickEnum.rick>()

    override func setUpWithError() throws {
        try super.setUpWithError()
    }

    override func tearDownWithError() throws {
        try super.tearDownWithError()
    }

    func testGetData() throws {
        
        let expectation = expectation(description: "api.test")
        
        requester.request(.rickUrl) { (result) in
            switch result {
            case .success(let response):
                let result = try? JSONSerialization.jsonObject(with: response.data, options: [])
                
                guard let jsonData = result as? [String: Any] else { return }

                XCTAssertNotNil(jsonData)
                
                
            case .failure(let error):
                print("error \(error)")
                
            }
            
            expectation.fulfill()
        }
        
        wait(for: [expectation], timeout: 10)
    }

}
