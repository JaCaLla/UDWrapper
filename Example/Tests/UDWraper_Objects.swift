//
//  UDWraper_Objects.swift
//  UDWrapper_Tests
//
//  Created by Javier Calatrava Llaveria on 13/04/2019.
//  Copyright © 2019 CocoaPods. All rights reserved.
//

import XCTest
@testable import UDWrapper

struct Person {

    enum CodingKeys: String, CodingKey {
        case email = "email"
        case name = "name"
    }

    var name:String
    var email:String
}

extension Person:Dictionable {

    func toDictionary() -> DictionableType {
        return [Person.CodingKeys.name.rawValue:self.name,
                Person.CodingKeys.email.rawValue:self.email]
    }

    init?(dictionary: DictionableType?) {
        guard let uwpDictionary = dictionary,
            let uwpName = uwpDictionary[Person.CodingKeys.name.rawValue] as? String,
            let uwpEmail = uwpDictionary[Person.CodingKeys.email.rawValue] as? String else {
                return nil
        }
        self.name = uwpName
        self.email = uwpEmail
    }
}

extension Person:Equatable {

    static func == (lhs: Person, rhs: Person) -> Bool {
        return lhs.email == rhs.email &&
            lhs.name == rhs.name
    }
}

class UDWraper_Objects: XCTestCase {

    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        UDWrappper.shared.reset()
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func test_Dictionable() {

        XCTAssertNil(UDWrappper.shared.getDictionary(userDefaultKeyValue: StoredKeyValue.attrPerson))
        let person1 = Person(name: "a", email: "b")
        UDWrappper.shared.set(userDefaultKeyValue: StoredKeyValue.attrPerson, dictionable: person1)
        let recPerson = Person(dictionary: UDWrappper.shared.getDictionary(userDefaultKeyValue: StoredKeyValue.attrPerson))
        XCTAssertEqual(recPerson, person1)

        UDWrappper.shared.reset()
        XCTAssertNil(UDWrappper.shared.getDictionary(userDefaultKeyValue: StoredKeyValue.attrPerson))
        let person2 = Person(name: "a", email: "b")
        UDWrappper.shared.set(userDefaultKeyValue: StoredKeyValue.attrPerson, dictionable: person2)
        let recPerson2 = Person(dictionary: UDWrappper.shared.getDictionary(userDefaultKeyValue: StoredKeyValue.attrPerson))
        XCTAssertEqual(recPerson2, person2)

    }

    func test_arrDictionable() {

        XCTAssertNil(UDWrappper.shared.getDictionary(userDefaultKeyValue: StoredKeyValue.attrArrPerson))
        let person1 = Person(name: "a", email: "b")
        UDWrappper.shared.set(userDefaultKeyValue: StoredKeyValue.attrArrPerson, value: [person1])

        guard let dictionablesArr:[DictionableType] = UDWrappper.shared.getArray(userDefaultKeyValue: StoredKeyValue.attrArrPerson) as? [DictionableType] else {
            XCTFail()
            return
        }
        let persons = dictionablesArr.map({ Person(dictionary: $0) })
        XCTAssertEqual(persons, [Person(name: "a", email: "b")])


        UDWrappper.shared.reset()
        XCTAssertNil(UDWrappper.shared.getDictionary(userDefaultKeyValue: StoredKeyValue.attrArrPerson))
        let person2 = Person(name: "c", email: "d")
        UDWrappper.shared.set(userDefaultKeyValue: StoredKeyValue.attrArrPerson, value: [person1,person2])
        guard let dictionablesArr2:[DictionableType] = UDWrappper.shared.getArray(userDefaultKeyValue: StoredKeyValue.attrArrPerson) as? [DictionableType] else {
            XCTFail()
            return
        }
        let persons2 = dictionablesArr2.map({ Person(dictionary: $0) })
        XCTAssertEqual(persons2, [person1,person2])


    }

}
