//
//  StringExtension.swift
//  UDManager
//
//  Created by Javier Calatrava Llaveria on 18/03/2019.
//  Copyright © 2019 Javier Calatrava Llaveria. All rights reserved.
//

import Foundation
import  CryptoSwift

extension String {

    static func random(length: Int) -> String {

        let letters = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789"
        return String((0..<length).map{ _ in letters.randomElement()! })
    }
}
