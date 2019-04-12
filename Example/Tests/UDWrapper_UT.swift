//
//  UDWrapper_UT.swift
//  UDWrapper_Tests
//
//  Created by Javier Calatrava Llaveria on 12/04/2019.
//  Copyright © 2019 CocoaPods. All rights reserved.
//

import XCTest
@testable import UDWrapper

class UDWrapper_UT: XCTestCase {

    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        UDManager.shared.reset()
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func test_bool() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        XCTAssertNil(UDManager.shared.getBool(userDefaultKeyValue: StoredKeyValue.attrBool))
        UDManager.shared.set(userDefaultKeyValue: StoredKeyValue.attrBool, value: true)
        XCTAssertEqual(UDManager.shared.getBool(userDefaultKeyValue: StoredKeyValue.attrBool), true)
        UDManager.shared.set(userDefaultKeyValue: StoredKeyValue.attrBool, value: false)
        XCTAssertEqual(UDManager.shared.getBool(userDefaultKeyValue: StoredKeyValue.attrBool), false)

        UDManager.shared.reset()

        XCTAssertNil(UDManager.shared.getBool(userDefaultKeyValue: StoredKeyValue.attrBool))
        UDManager.shared.set(userDefaultKeyValue: StoredKeyValue.attrBool, value: true)
        XCTAssertEqual(UDManager.shared.getBool(userDefaultKeyValue: StoredKeyValue.attrBool), true)
        UDManager.shared.set(userDefaultKeyValue: StoredKeyValue.attrBool, value: false)
        XCTAssertEqual(UDManager.shared.getBool(userDefaultKeyValue: StoredKeyValue.attrBool) , false)
    }

    func test_int() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        XCTAssertNil(UDManager.shared.getInt(userDefaultKeyValue: StoredKeyValue.attrInt))
        UDManager.shared.set(userDefaultKeyValue: StoredKeyValue.attrInt, value: 8)
        XCTAssertEqual(UDManager.shared.getInt(userDefaultKeyValue: StoredKeyValue.attrInt), 8)
        UDManager.shared.set(userDefaultKeyValue: StoredKeyValue.attrInt, value: -1)
        XCTAssertEqual(UDManager.shared.getInt(userDefaultKeyValue: StoredKeyValue.attrInt), -1)

        UDManager.shared.reset()

        XCTAssertNil(UDManager.shared.getInt(userDefaultKeyValue: StoredKeyValue.attrInt))
        UDManager.shared.set(userDefaultKeyValue: StoredKeyValue.attrInt, value: 22)
        XCTAssertEqual(UDManager.shared.getInt(userDefaultKeyValue: StoredKeyValue.attrInt), 22)
        UDManager.shared.set(userDefaultKeyValue: StoredKeyValue.attrInt, value: 0)
        XCTAssertEqual(UDManager.shared.getInt(userDefaultKeyValue: StoredKeyValue.attrInt) , 0)
    }

    func test_double() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        XCTAssertNil(UDManager.shared.getDouble(userDefaultKeyValue: StoredKeyValue.attrDouble))
        UDManager.shared.set(userDefaultKeyValue: StoredKeyValue.attrDouble, value: 8.5)
        XCTAssertEqual(UDManager.shared.getDouble(userDefaultKeyValue: StoredKeyValue.attrDouble), 8.5)
        UDManager.shared.set(userDefaultKeyValue: StoredKeyValue.attrDouble, value: -1.2)
        XCTAssertEqual(UDManager.shared.getDouble(userDefaultKeyValue: StoredKeyValue.attrDouble), -1.2)

        UDManager.shared.reset()

        XCTAssertNil(UDManager.shared.getDouble(userDefaultKeyValue: StoredKeyValue.attrDouble))
        UDManager.shared.set(userDefaultKeyValue: StoredKeyValue.attrDouble, value: 22.0)
        XCTAssertEqual(UDManager.shared.getDouble(userDefaultKeyValue: StoredKeyValue.attrDouble), 22.0)
        UDManager.shared.set(userDefaultKeyValue: StoredKeyValue.attrDouble, value: 0.9999999)
        XCTAssertEqual(UDManager.shared.getDouble(userDefaultKeyValue: StoredKeyValue.attrDouble) , 0.9999999)
    }

    func test_float() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        XCTAssertNil(UDManager.shared.getFloat(userDefaultKeyValue: StoredKeyValue.attrFloat))
        UDManager.shared.set(userDefaultKeyValue: StoredKeyValue.attrFloat, value: Float(8.5))
        XCTAssertEqual(UDManager.shared.getFloat(userDefaultKeyValue: StoredKeyValue.attrFloat), Float(8.5))
        UDManager.shared.set(userDefaultKeyValue: StoredKeyValue.attrFloat, value: -1.2)
        XCTAssertEqual(UDManager.shared.getFloat(userDefaultKeyValue: StoredKeyValue.attrFloat), -1.2)

        UDManager.shared.reset()

        XCTAssertNil(UDManager.shared.getFloat(userDefaultKeyValue: StoredKeyValue.attrFloat))
        UDManager.shared.set(userDefaultKeyValue: StoredKeyValue.attrFloat, value: 22.0)
        XCTAssertEqual(UDManager.shared.getFloat(userDefaultKeyValue: StoredKeyValue.attrFloat), 22.0)
        UDManager.shared.set(userDefaultKeyValue: StoredKeyValue.attrFloat, value: 0.9999999)
        XCTAssertEqual(UDManager.shared.getFloat(userDefaultKeyValue: StoredKeyValue.attrFloat) , 0.9999999)
    }

    func test_String() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        XCTAssertNil(UDManager.shared.getString(userDefaultKeyValue: StoredKeyValue.attrString))
        UDManager.shared.set(userDefaultKeyValue: StoredKeyValue.attrString, string: "Hello Worlkd!")
        XCTAssertEqual(UDManager.shared.getString(userDefaultKeyValue: StoredKeyValue.attrString), "Hello Worlkd!")
        UDManager.shared.set(userDefaultKeyValue: StoredKeyValue.attrString, string: "HJola")
        XCTAssertEqual(UDManager.shared.getString(userDefaultKeyValue: StoredKeyValue.attrString), "HJola")

        UDManager.shared.reset()

        XCTAssertNil(UDManager.shared.getString(userDefaultKeyValue: StoredKeyValue.attrString))
        UDManager.shared.set(userDefaultKeyValue: StoredKeyValue.attrString, string: "Hello Worlkd!")
        XCTAssertEqual(UDManager.shared.getString(userDefaultKeyValue: StoredKeyValue.attrString), "Hello Worlkd!")
        UDManager.shared.set(userDefaultKeyValue: StoredKeyValue.attrString, string: "HJola")
        XCTAssertEqual(UDManager.shared.getString(userDefaultKeyValue: StoredKeyValue.attrString), "HJola")
    }

    func test_Dictionable() {

        XCTAssertNil(UDManager.shared.getDictionary(userDefaultKeyValue: StoredKeyValue.attrPerson))
        let person1 = Person(name: "a", email: "b")
        UDManager.shared.set(userDefaultKeyValue: StoredKeyValue.attrPerson, dictionable: person1)
        let recPerson = Person(dictionary: UDManager.shared.getDictionary(userDefaultKeyValue: StoredKeyValue.attrPerson))
        XCTAssertEqual(recPerson, person1)

        UDManager.shared.reset()
        XCTAssertNil(UDManager.shared.getDictionary(userDefaultKeyValue: StoredKeyValue.attrPerson))
        let person2 = Person(name: "a", email: "b")
        UDManager.shared.set(userDefaultKeyValue: StoredKeyValue.attrPerson, dictionable: person2)
        let recPerson2 = Person(dictionary: UDManager.shared.getDictionary(userDefaultKeyValue: StoredKeyValue.attrPerson))
        XCTAssertEqual(recPerson2, person2)

    }

    func test_arrBool() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        XCTAssertNil(UDManager.shared.getArray(userDefaultKeyValue: StoredKeyValue.attrArrBool) as [Bool]?)
        UDManager.shared.set(userDefaultKeyValue: StoredKeyValue.attrArrBool, value: [])
        XCTAssertEqual(UDManager.shared.getArray(userDefaultKeyValue: StoredKeyValue.attrArrBool) as [Bool]?, [])
        UDManager.shared.set(userDefaultKeyValue: StoredKeyValue.attrArrBool, value: [true,false])
        XCTAssertEqual(UDManager.shared.getArray(userDefaultKeyValue: StoredKeyValue.attrArrBool) as [Bool]?, [true,false])
        UDManager.shared.reset()

        XCTAssertNil(UDManager.shared.getArray(userDefaultKeyValue: StoredKeyValue.attrArrBool) as [Bool]?)
        UDManager.shared.set(userDefaultKeyValue: StoredKeyValue.attrArrBool, value: [false,true])
        XCTAssertEqual(UDManager.shared.getArray(userDefaultKeyValue: StoredKeyValue.attrArrBool) as [Bool]?, [false,true])
        UDManager.shared.set(userDefaultKeyValue: StoredKeyValue.attrArrBool, value: [true,true])
        XCTAssertEqual(UDManager.shared.getArray(userDefaultKeyValue: StoredKeyValue.attrArrBool) as [Bool]?, [true,true])
    }

    func test_arrInt() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        XCTAssertNil(UDManager.shared.getArray(userDefaultKeyValue: StoredKeyValue.attrArrInt) as [Int]? )
        UDManager.shared.set(userDefaultKeyValue: StoredKeyValue.attrArrInt, value: [1,2,3])
        XCTAssertEqual(UDManager.shared.getArray(userDefaultKeyValue: StoredKeyValue.attrArrInt) as [Int]?, [1,2,3])
        UDManager.shared.set(userDefaultKeyValue: StoredKeyValue.attrArrInt, value: [1,2])
        XCTAssertEqual(UDManager.shared.getArray(userDefaultKeyValue: StoredKeyValue.attrArrInt) as [Int]?, [1,2])
        UDManager.shared.reset()

        XCTAssertNil(UDManager.shared.getArray(userDefaultKeyValue: StoredKeyValue.attrArrInt) as [Int]?)
        UDManager.shared.set(userDefaultKeyValue: StoredKeyValue.attrArrInt, value: [1,2,3])
        XCTAssertEqual(UDManager.shared.getArray(userDefaultKeyValue: StoredKeyValue.attrArrInt) as [Int]?, [1,2,3])
        UDManager.shared.set(userDefaultKeyValue: StoredKeyValue.attrArrInt, value: [1,2])
        XCTAssertEqual(UDManager.shared.getArray(userDefaultKeyValue: StoredKeyValue.attrArrInt) as [Int]?, [1,2])
    }

    func test_arrFloat() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        XCTAssertNil(UDManager.shared.getArray(userDefaultKeyValue: StoredKeyValue.attrArrFloat) as [Float]? )
        UDManager.shared.set(userDefaultKeyValue: StoredKeyValue.attrArrFloat, value: [1.1,2.2,3.3] as [Float])
        XCTAssertEqual(UDManager.shared.getArray(userDefaultKeyValue: StoredKeyValue.attrArrFloat) as [Float]?, [1.1,2.2,3.3])
        UDManager.shared.set(userDefaultKeyValue: StoredKeyValue.attrArrFloat, value: [0.1,0.2] as [Float])
        XCTAssertEqual(UDManager.shared.getArray(userDefaultKeyValue: StoredKeyValue.attrArrFloat) as [Float]?, [0.1,0.2])
        UDManager.shared.reset()

        XCTAssertNil(UDManager.shared.getArray(userDefaultKeyValue: StoredKeyValue.attrArrFloat) as [Float]?)
        UDManager.shared.set(userDefaultKeyValue: StoredKeyValue.attrArrFloat, value: [1.0,2.0,3.0])
        XCTAssertEqual(UDManager.shared.getArray(userDefaultKeyValue: StoredKeyValue.attrArrFloat) as [Float]?, [1.0,2.0,3.0])
        UDManager.shared.set(userDefaultKeyValue: StoredKeyValue.attrArrFloat, value: [10.0,20.0])
        XCTAssertEqual(UDManager.shared.getArray(userDefaultKeyValue: StoredKeyValue.attrArrFloat) as [Float]?, [10.0,20.0])
    }

    func test_arrDouble() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        XCTAssertNil(UDManager.shared.getArray(userDefaultKeyValue: StoredKeyValue.attrArrDouble) as [Double]? )
        UDManager.shared.set(userDefaultKeyValue: StoredKeyValue.attrArrDouble, value: [1.1,2.2,3.3])
        XCTAssertEqual(UDManager.shared.getArray(userDefaultKeyValue: StoredKeyValue.attrArrDouble) as [Double]?, [1.1,2.2,3.3])
        UDManager.shared.set(userDefaultKeyValue: StoredKeyValue.attrArrDouble, value: [0.1,0.2])
        XCTAssertEqual(UDManager.shared.getArray(userDefaultKeyValue: StoredKeyValue.attrArrDouble) as [Double]?, [0.1,0.2])
        UDManager.shared.reset()

        XCTAssertNil(UDManager.shared.getArray(userDefaultKeyValue: StoredKeyValue.attrArrDouble) as [Double]?)
        UDManager.shared.set(userDefaultKeyValue: StoredKeyValue.attrArrDouble, value: [1.0,2.0,3.0])
        XCTAssertEqual(UDManager.shared.getArray(userDefaultKeyValue: StoredKeyValue.attrArrDouble) as [Double]?, [1.0,2.0,3.0])
        UDManager.shared.set(userDefaultKeyValue: StoredKeyValue.attrArrDouble, value: [10.0,20.0])
        XCTAssertEqual(UDManager.shared.getArray(userDefaultKeyValue: StoredKeyValue.attrArrDouble) as [Double]?, [10.0,20.0])
    }

    func test_arrString() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        XCTAssertNil(UDManager.shared.getArray(userDefaultKeyValue: StoredKeyValue.attrArrStr) as [String]? )
        UDManager.shared.set(userDefaultKeyValue: StoredKeyValue.attrArrStr, value: ["1","2,3"])
        XCTAssertEqual(UDManager.shared.getArray(userDefaultKeyValue: StoredKeyValue.attrArrStr) as [String]?, ["1","2,3"])
        UDManager.shared.set(userDefaultKeyValue: StoredKeyValue.attrArrStr, value: ["1","2"])
        XCTAssertEqual(UDManager.shared.getArray(userDefaultKeyValue: StoredKeyValue.attrArrStr) as [String]?, ["1","2"])
        UDManager.shared.reset()

        XCTAssertNil(UDManager.shared.getArray(userDefaultKeyValue: StoredKeyValue.attrArrStr) as [String]?)
        UDManager.shared.set(userDefaultKeyValue: StoredKeyValue.attrArrStr, value: ["1,2","3"])
        XCTAssertEqual(UDManager.shared.getArray(userDefaultKeyValue: StoredKeyValue.attrArrStr) as [String]?, ["1,2","3"])
        UDManager.shared.set(userDefaultKeyValue: StoredKeyValue.attrArrStr, value: ["1","2"])
        XCTAssertEqual(UDManager.shared.getArray(userDefaultKeyValue: StoredKeyValue.attrArrStr) as [String]?, ["1","2"])
    }

    func test_arrDictionable() {

        XCTAssertNil(UDManager.shared.getDictionary(userDefaultKeyValue: StoredKeyValue.attrArrPerson))
        let person1 = Person(name: "a", email: "b")
        UDManager.shared.set(userDefaultKeyValue: StoredKeyValue.attrArrPerson, value: [person1])

        guard let dictionablesArr:[DictionableType] = UDManager.shared.getArray(userDefaultKeyValue: StoredKeyValue.attrArrPerson) as? [DictionableType] else {
            XCTFail()
            return
        }
        let persons = dictionablesArr.map({ Person(dictionary: $0) })
        XCTAssertEqual(persons, [Person(name: "a", email: "b")])


        UDManager.shared.reset()
        XCTAssertNil(UDManager.shared.getDictionary(userDefaultKeyValue: StoredKeyValue.attrArrPerson))
        let person2 = Person(name: "c", email: "d")
        UDManager.shared.set(userDefaultKeyValue: StoredKeyValue.attrArrPerson, value: [person1,person2])
        guard let dictionablesArr2:[DictionableType] = UDManager.shared.getArray(userDefaultKeyValue: StoredKeyValue.attrArrPerson) as? [DictionableType] else {
            XCTFail()
            return
        }
        let persons2 = dictionablesArr2.map({ Person(dictionary: $0) })
        XCTAssertEqual(persons2, [person1,person2])


    }

}
