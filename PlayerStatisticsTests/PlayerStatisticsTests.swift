//
//  PlayerStatisticsTests.swift
//  PlayerStatisticsTests
//
//  Created by raman singh on 06/02/19.
//  Copyright © 2019 raman singh. All rights reserved.
//

import XCTest
@testable import PlayerStatistics
import ObjectMapper
@testable import Mocker

/// Contains all available Mocked data.
public final class MockedData {
    public static let exampleJSON: URL = Bundle(for: MockedData.self).url(forResource: "example", withExtension: "json")!
}

internal extension URL {
    /// Returns a `Data` representation of the current `URL`. Force unwrapping as it's only used for tests.
    var data: Data {
        return try! Data(contentsOf: self)
    }
}


class PlayerStatisticsTests: XCTestCase {

    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testStastics(){
        var stat = Stat()
        stat.statType = "tackles"
        MockAPIManager().requestAPI(url: "https://statsapi.foxsports.com.au/3.0/api/sports/league/matches/NRL20172101/topplayerstats.json;type=fantasy_points;type=tackles;type=runs;type=run_metres?limit=5&userkey=A00239D3-45F6-4A0A-810C-54A347F144C2", parameter: nil, httpMethodType: .GET) { (data, error) in
            do {
                let result = try JSONSerialization.jsonObject(with: data!, options: []) as? [[String:Any]]
                if let theJSONData = try? JSONSerialization.data(
                    withJSONObject: result ?? [],
                    options: []) {
                    let theJSONText = String(data: theJSONData,
                                             encoding: .ascii)
                    let statArray = Mapper<Stat>().mapArray(JSONString: theJSONText!)
                    XCTAssert(statArray?.first?.statType == stat.statType)
                    //We can Test The whole object by using Equatable protocol here.
                }
            } catch {
                XCTFail("Wrong data response")
            }
        }
    }
}

class MockAPIManager:XCTestCase, ServiceManager{
    func requestAPI(url: String, parameter: [String : AnyObject]?, httpMethodType: HTTPMethodType, completion: @escaping WebServiceCompletionBlock) {
        let expectation = self.expectation(description: "Data request should succeed")
        let originalURL = URL(string: url)!
        
        let mock = Mock(url: originalURL, contentType: .json, statusCode: 200, data: [
            .get : MockedData.exampleJSON.data // Data containing the JSON response
            ])
        mock.register()
        
        URLSession.shared.dataTask(with: originalURL) { (data, response, error) in
            
            guard let data = data else {
                XCTFail("Wrong data response")
                expectation.fulfill()
                return
            }
            if let httpStatus = response as? HTTPURLResponse, httpStatus.statusCode != 200 {           // check for http errors
                let error = NSError(domain:"", code:httpStatus.statusCode, userInfo:[ NSLocalizedDescriptionKey: httpStatus.description])
                completion(nil, error)
            }
            completion(data,nil)
            
            expectation.fulfill()
            }.resume()
        
        self.waitForExpectations(timeout: 35.0, handler: nil)
    }
}

