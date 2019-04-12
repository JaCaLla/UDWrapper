//
//  ResetableProtocol.swift
//  UDManager
//
//  Created by Javier Calatrava Llaveria on 15/03/2019.
//  Copyright © 2019 Javier Calatrava Llaveria. All rights reserved.
//


import Foundation

typealias DictionableType = [String: Any]

protocol Dictionable {
    func toDictionary() -> DictionableType
    init?(dictionary: DictionableType?)
}

func decode<T: Dictionable>(_ dictionary: DictionableType) -> T? {
    return T(dictionary: dictionary)
}
