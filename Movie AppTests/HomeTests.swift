//
//  HomeTests.swift
//  Movie AppTests
//
//  Created by Rufan Abdurahmanov on 07.07.22.
//

import XCTest
@testable import Movie_App

class HomeTests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testWebService () {
        WebService.shared.getGenres { genres in
            let genre = genres.first
            XCTAssertNil(genre)
            XCTAssertNotNil(genres)
        }
    }
    
    func testGenreModel() {
        let data = dummyGenre()
        XCTAssertNotNil(data.first)
        XCTAssertEqual(data.first?.id, 0)
    }
}

extension HomeTests {
    func dummyGenre() -> [Genre] {
        [Genre(id: 00, name: "Action"),
         Genre(id: 10, name: "Comedy"),
         Genre(id: 20, name: "Drama"),
         Genre(id: 30, name: "Family")]
    }
}
