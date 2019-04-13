//
//  UDWrapper_UT.swift
//  UDWrapper_Tests
//
//  Created by Javier Calatrava Llaveria on 12/04/2019.
//  Copyright © 2019 CocoaPods. All rights reserved.
//

import XCTest

@testable import UDWrapper


struct StoredKeyValue {
    static let cryptoKey = "cryptoKey"
    static let iv = "iv"

    static let attrBool = "attrBool"
    static let attrDate = "attrDate"
    static let attrInt = "attrInt"
    static let attrDouble = "attrDouble"
    static let attrFloat = "attrFloat"
    static let attrString = "attrString"
    static let attrDictionable = "attrString"
    static let attrArrBool = "attrArrBool"
    static let attrArrDouble = "attrArrDouble"
    static let attrArrFloat = "attrArrFloat"
    static let attrArrInt = "attrArrInt"
    static let attrArrStr = "attrStrInt"
    static let attrPerson = "attrPerson"
    static let attrArrPerson = "attrArrPerson"

}

class UT_UDWrapper_Primitives: XCTestCase {

    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        UDWrappper.shared.reset()
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func test_date() {
        XCTAssertNil(UDWrappper.shared.getDate(userDefaultKeyValue: StoredKeyValue.attrDate))
        let date = Date(timeIntervalSince1970: 978307200.0)
        UDWrappper.shared.set(userDefaultKeyValue: StoredKeyValue.attrDate, value: date)
        let redDate = UDWrappper.shared.getDate(userDefaultKeyValue: StoredKeyValue.attrDate)
       XCTAssertEqual(date.timeIntervalSince1970, redDate?.timeIntervalSince1970)
        XCTAssertEqual(978307200.0, redDate?.timeIntervalSince1970)

    }

    func test_bool() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        XCTAssertNil(UDWrappper.shared.getBool(userDefaultKeyValue: StoredKeyValue.attrBool))
        UDWrappper.shared.set(userDefaultKeyValue: StoredKeyValue.attrBool, value: true)
        XCTAssertEqual(UDWrappper.shared.getBool(userDefaultKeyValue: StoredKeyValue.attrBool), true)
        UDWrappper.shared.set(userDefaultKeyValue: StoredKeyValue.attrBool, value: false)
        XCTAssertEqual(UDWrappper.shared.getBool(userDefaultKeyValue: StoredKeyValue.attrBool), false)

        UDWrappper.shared.reset()

        XCTAssertNil(UDWrappper.shared.getBool(userDefaultKeyValue: StoredKeyValue.attrBool))
        UDWrappper.shared.set(userDefaultKeyValue: StoredKeyValue.attrBool, value: true)
        XCTAssertEqual(UDWrappper.shared.getBool(userDefaultKeyValue: StoredKeyValue.attrBool), true)
        UDWrappper.shared.set(userDefaultKeyValue: StoredKeyValue.attrBool, value: false)
        XCTAssertEqual(UDWrappper.shared.getBool(userDefaultKeyValue: StoredKeyValue.attrBool) , false)
    }

    func test_int() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        XCTAssertNil(UDWrappper.shared.getInt(userDefaultKeyValue: StoredKeyValue.attrInt))
        UDWrappper.shared.set(userDefaultKeyValue: StoredKeyValue.attrInt, value: 8)
        XCTAssertEqual(UDWrappper.shared.getInt(userDefaultKeyValue: StoredKeyValue.attrInt), 8)
        UDWrappper.shared.set(userDefaultKeyValue: StoredKeyValue.attrInt, value: -1)
        XCTAssertEqual(UDWrappper.shared.getInt(userDefaultKeyValue: StoredKeyValue.attrInt), -1)

        UDWrappper.shared.reset()

        XCTAssertNil(UDWrappper.shared.getInt(userDefaultKeyValue: StoredKeyValue.attrInt))
        UDWrappper.shared.set(userDefaultKeyValue: StoredKeyValue.attrInt, value: 22)
        XCTAssertEqual(UDWrappper.shared.getInt(userDefaultKeyValue: StoredKeyValue.attrInt), 22)
        UDWrappper.shared.set(userDefaultKeyValue: StoredKeyValue.attrInt, value: 0)
        XCTAssertEqual(UDWrappper.shared.getInt(userDefaultKeyValue: StoredKeyValue.attrInt) , 0)
    }

    func test_double() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        XCTAssertNil(UDWrappper.shared.getDouble(userDefaultKeyValue: StoredKeyValue.attrDouble))
        UDWrappper.shared.set(userDefaultKeyValue: StoredKeyValue.attrDouble, value: 8.5)
        XCTAssertEqual(UDWrappper.shared.getDouble(userDefaultKeyValue: StoredKeyValue.attrDouble), 8.5)
        UDWrappper.shared.set(userDefaultKeyValue: StoredKeyValue.attrDouble, value: -1.2)
        XCTAssertEqual(UDWrappper.shared.getDouble(userDefaultKeyValue: StoredKeyValue.attrDouble), -1.2)

        UDWrappper.shared.reset()

        XCTAssertNil(UDWrappper.shared.getDouble(userDefaultKeyValue: StoredKeyValue.attrDouble))
        UDWrappper.shared.set(userDefaultKeyValue: StoredKeyValue.attrDouble, value: 22.0)
        XCTAssertEqual(UDWrappper.shared.getDouble(userDefaultKeyValue: StoredKeyValue.attrDouble), 22.0)
        UDWrappper.shared.set(userDefaultKeyValue: StoredKeyValue.attrDouble, value: 0.9999999)
        XCTAssertEqual(UDWrappper.shared.getDouble(userDefaultKeyValue: StoredKeyValue.attrDouble) , 0.9999999)
    }

    func test_float() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        XCTAssertNil(UDWrappper.shared.getFloat(userDefaultKeyValue: StoredKeyValue.attrFloat))
        UDWrappper.shared.set(userDefaultKeyValue: StoredKeyValue.attrFloat, value: Float(8.5))
        XCTAssertEqual(UDWrappper.shared.getFloat(userDefaultKeyValue: StoredKeyValue.attrFloat), Float(8.5))
        UDWrappper.shared.set(userDefaultKeyValue: StoredKeyValue.attrFloat, value: -1.2)
        XCTAssertEqual(UDWrappper.shared.getFloat(userDefaultKeyValue: StoredKeyValue.attrFloat), -1.2)

        UDWrappper.shared.reset()

        XCTAssertNil(UDWrappper.shared.getFloat(userDefaultKeyValue: StoredKeyValue.attrFloat))
        UDWrappper.shared.set(userDefaultKeyValue: StoredKeyValue.attrFloat, value: 22.0)
        XCTAssertEqual(UDWrappper.shared.getFloat(userDefaultKeyValue: StoredKeyValue.attrFloat), 22.0)
        UDWrappper.shared.set(userDefaultKeyValue: StoredKeyValue.attrFloat, value: 0.9999999)
        XCTAssertEqual(UDWrappper.shared.getFloat(userDefaultKeyValue: StoredKeyValue.attrFloat) , 0.9999999)
    }

    func test_String() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        XCTAssertNil(UDWrappper.shared.getString(userDefaultKeyValue: StoredKeyValue.attrString))
        UDWrappper.shared.set(userDefaultKeyValue: StoredKeyValue.attrString, string: "Hello Worlkd!")
        XCTAssertEqual(UDWrappper.shared.getString(userDefaultKeyValue: StoredKeyValue.attrString), "Hello Worlkd!")
        UDWrappper.shared.set(userDefaultKeyValue: StoredKeyValue.attrString, string: "HJola")
        XCTAssertEqual(UDWrappper.shared.getString(userDefaultKeyValue: StoredKeyValue.attrString), "HJola")

        UDWrappper.shared.reset()

        XCTAssertNil(UDWrappper.shared.getString(userDefaultKeyValue: StoredKeyValue.attrString))
        UDWrappper.shared.set(userDefaultKeyValue: StoredKeyValue.attrString, string: "Hello Worlkd!")
        XCTAssertEqual(UDWrappper.shared.getString(userDefaultKeyValue: StoredKeyValue.attrString), "Hello Worlkd!")
        UDWrappper.shared.set(userDefaultKeyValue: StoredKeyValue.attrString, string: "HJola")
        XCTAssertEqual(UDWrappper.shared.getString(userDefaultKeyValue: StoredKeyValue.attrString), "HJola")
    }

    

    func test_arrBool() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        XCTAssertNil(UDWrappper.shared.getArray(userDefaultKeyValue: StoredKeyValue.attrArrBool) as [Bool]?)
        UDWrappper.shared.set(userDefaultKeyValue: StoredKeyValue.attrArrBool, value: [])
        XCTAssertEqual(UDWrappper.shared.getArray(userDefaultKeyValue: StoredKeyValue.attrArrBool) as [Bool]?, [])
        UDWrappper.shared.set(userDefaultKeyValue: StoredKeyValue.attrArrBool, value: [true,false])
        XCTAssertEqual(UDWrappper.shared.getArray(userDefaultKeyValue: StoredKeyValue.attrArrBool) as [Bool]?, [true,false])
        UDWrappper.shared.reset()

        XCTAssertNil(UDWrappper.shared.getArray(userDefaultKeyValue: StoredKeyValue.attrArrBool) as [Bool]?)
        UDWrappper.shared.set(userDefaultKeyValue: StoredKeyValue.attrArrBool, value: [false,true])
        XCTAssertEqual(UDWrappper.shared.getArray(userDefaultKeyValue: StoredKeyValue.attrArrBool) as [Bool]?, [false,true])
        UDWrappper.shared.set(userDefaultKeyValue: StoredKeyValue.attrArrBool, value: [true,true])
        XCTAssertEqual(UDWrappper.shared.getArray(userDefaultKeyValue: StoredKeyValue.attrArrBool) as [Bool]?, [true,true])
    }

    func test_arrInt() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        XCTAssertNil(UDWrappper.shared.getArray(userDefaultKeyValue: StoredKeyValue.attrArrInt) as [Int]? )
        UDWrappper.shared.set(userDefaultKeyValue: StoredKeyValue.attrArrInt, value: [1,2,3])
        XCTAssertEqual(UDWrappper.shared.getArray(userDefaultKeyValue: StoredKeyValue.attrArrInt) as [Int]?, [1,2,3])
        UDWrappper.shared.set(userDefaultKeyValue: StoredKeyValue.attrArrInt, value: [1,2])
        XCTAssertEqual(UDWrappper.shared.getArray(userDefaultKeyValue: StoredKeyValue.attrArrInt) as [Int]?, [1,2])
        UDWrappper.shared.reset()

        XCTAssertNil(UDWrappper.shared.getArray(userDefaultKeyValue: StoredKeyValue.attrArrInt) as [Int]?)
        UDWrappper.shared.set(userDefaultKeyValue: StoredKeyValue.attrArrInt, value: [1,2,3])
        XCTAssertEqual(UDWrappper.shared.getArray(userDefaultKeyValue: StoredKeyValue.attrArrInt) as [Int]?, [1,2,3])
        UDWrappper.shared.set(userDefaultKeyValue: StoredKeyValue.attrArrInt, value: [1,2])
        XCTAssertEqual(UDWrappper.shared.getArray(userDefaultKeyValue: StoredKeyValue.attrArrInt) as [Int]?, [1,2])
    }

    func test_arrFloat() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        XCTAssertNil(UDWrappper.shared.getArray(userDefaultKeyValue: StoredKeyValue.attrArrFloat) as [Float]? )
        UDWrappper.shared.set(userDefaultKeyValue: StoredKeyValue.attrArrFloat, value: [1.1,2.2,3.3] as [Float])
        XCTAssertEqual(UDWrappper.shared.getArray(userDefaultKeyValue: StoredKeyValue.attrArrFloat) as [Float]?, [1.1,2.2,3.3])
        UDWrappper.shared.set(userDefaultKeyValue: StoredKeyValue.attrArrFloat, value: [0.1,0.2] as [Float])
        XCTAssertEqual(UDWrappper.shared.getArray(userDefaultKeyValue: StoredKeyValue.attrArrFloat) as [Float]?, [0.1,0.2])
        UDWrappper.shared.reset()

        XCTAssertNil(UDWrappper.shared.getArray(userDefaultKeyValue: StoredKeyValue.attrArrFloat) as [Float]?)
        UDWrappper.shared.set(userDefaultKeyValue: StoredKeyValue.attrArrFloat, value: [1.0,2.0,3.0])
        XCTAssertEqual(UDWrappper.shared.getArray(userDefaultKeyValue: StoredKeyValue.attrArrFloat) as [Float]?, [1.0,2.0,3.0])
        UDWrappper.shared.set(userDefaultKeyValue: StoredKeyValue.attrArrFloat, value: [10.0,20.0])
        XCTAssertEqual(UDWrappper.shared.getArray(userDefaultKeyValue: StoredKeyValue.attrArrFloat) as [Float]?, [10.0,20.0])
    }

    func test_arrDouble() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        XCTAssertNil(UDWrappper.shared.getArray(userDefaultKeyValue: StoredKeyValue.attrArrDouble) as [Double]? )
        UDWrappper.shared.set(userDefaultKeyValue: StoredKeyValue.attrArrDouble, value: [1.1,2.2,3.3])
        XCTAssertEqual(UDWrappper.shared.getArray(userDefaultKeyValue: StoredKeyValue.attrArrDouble) as [Double]?, [1.1,2.2,3.3])
        UDWrappper.shared.set(userDefaultKeyValue: StoredKeyValue.attrArrDouble, value: [0.1,0.2])
        XCTAssertEqual(UDWrappper.shared.getArray(userDefaultKeyValue: StoredKeyValue.attrArrDouble) as [Double]?, [0.1,0.2])
        UDWrappper.shared.reset()

        XCTAssertNil(UDWrappper.shared.getArray(userDefaultKeyValue: StoredKeyValue.attrArrDouble) as [Double]?)
        UDWrappper.shared.set(userDefaultKeyValue: StoredKeyValue.attrArrDouble, value: [1.0,2.0,3.0])
        XCTAssertEqual(UDWrappper.shared.getArray(userDefaultKeyValue: StoredKeyValue.attrArrDouble) as [Double]?, [1.0,2.0,3.0])
        UDWrappper.shared.set(userDefaultKeyValue: StoredKeyValue.attrArrDouble, value: [10.0,20.0])
        XCTAssertEqual(UDWrappper.shared.getArray(userDefaultKeyValue: StoredKeyValue.attrArrDouble) as [Double]?, [10.0,20.0])
    }

    func test_arrString() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        XCTAssertNil(UDWrappper.shared.getArray(userDefaultKeyValue: StoredKeyValue.attrArrStr) as [String]? )
        UDWrappper.shared.set(userDefaultKeyValue: StoredKeyValue.attrArrStr, value: ["1","2,3"])
        XCTAssertEqual(UDWrappper.shared.getArray(userDefaultKeyValue: StoredKeyValue.attrArrStr) as [String]?, ["1","2,3"])
        UDWrappper.shared.set(userDefaultKeyValue: StoredKeyValue.attrArrStr, value: ["1","2"])
        XCTAssertEqual(UDWrappper.shared.getArray(userDefaultKeyValue: StoredKeyValue.attrArrStr) as [String]?, ["1","2"])
        UDWrappper.shared.reset()

        XCTAssertNil(UDWrappper.shared.getArray(userDefaultKeyValue: StoredKeyValue.attrArrStr) as [String]?)
        UDWrappper.shared.set(userDefaultKeyValue: StoredKeyValue.attrArrStr, value: ["1,2","3"])
        XCTAssertEqual(UDWrappper.shared.getArray(userDefaultKeyValue: StoredKeyValue.attrArrStr) as [String]?, ["1,2","3"])
        UDWrappper.shared.set(userDefaultKeyValue: StoredKeyValue.attrArrStr, value: ["1","2"])
        XCTAssertEqual(UDWrappper.shared.getArray(userDefaultKeyValue: StoredKeyValue.attrArrStr) as [String]?, ["1","2"])
    }

    

}
