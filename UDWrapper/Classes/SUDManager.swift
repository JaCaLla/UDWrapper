//
//  UDManager.swift
//  UDManager
//
//  Created by Javier Calatrava Llaveria on 15/03/2019.
//  Copyright © 2019 Javier Calatrava Llaveria. All rights reserved.
//

import Foundation
import os.log
import SwiftKeychainWrapper


class  SUDManager {

    struct Key {
        static let cryptoKey        = "cryptoKey"
        static let cryptoInitVector    = "cryptoInitVector"
    }

    static let shared =  SUDManager()

    private init() { /*This prevents others from using the default '()' initializer for this class. */ }


    // MARK: - Private/Internal
    func getKey() -> String {
        
        if KeychainWrapper.standard.string(forKey: Key.cryptoKey) == nil  {
            let key = String.random(length: 16)
            KeychainWrapper.standard.set(key, forKey: Key.cryptoKey)
        }
        guard let key = KeychainWrapper.standard.string(forKey: Key.cryptoKey) else {
            return ""
        }
        return key
    }

    func getIv() -> String {

        if KeychainWrapper.standard.string(forKey: Key.cryptoInitVector) == nil  {
            let key = String.random(length: 16)
            KeychainWrapper.standard.set(key, forKey: Key.cryptoInitVector)
        }
        guard let key = KeychainWrapper.standard.string(forKey: Key.cryptoInitVector)  else {
            return ""
        }
        return key
    }

    
}

extension SUDManager:Reseteable {

    func reset() {
        KeychainWrapper.standard.removeObject(forKey: Key.cryptoKey)
        KeychainWrapper.standard.removeObject(forKey: Key.cryptoInitVector)
    }
}

