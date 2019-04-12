//
//  Person.swift
//  UDManager
//
//  Created by Javier Calatrava Llaveria on 15/03/2019.
//  Copyright © 2019 Javier Calatrava Llaveria. All rights reserved.
//

import Foundation

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


extension Person:Decodable, Encodable {

    init(from decoder:Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        let name = try container.decode(String.self, forKey: .name)
        let email  = try container.decode(String.self, forKey: .email)

        self.init(name: name, email: email)
    }

    func encode(to encoder: Encoder) throws
    {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(name, forKey: .name)
        try container.encode(email, forKey: .email)
    }
}

extension Person:Equatable {
    
    static func == (lhs: Person, rhs: Person) -> Bool {
        return lhs.email == rhs.email &&
               lhs.name == rhs.name
    }
}
