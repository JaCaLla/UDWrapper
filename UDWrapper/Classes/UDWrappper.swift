//
//  UDManager.swift
//  UDManager
//
//  Created by Javier Calatrava Llaveria on 15/03/2019.
//  Copyright © 2019 Javier Calatrava Llaveria. All rights reserved.
//

import Foundation
import os.log
import CryptoSwift

struct UDManagerKeyValue {
    static let cryptoKey = "cryptoKey"
    static let iv = "iv"
    static let initializated = "initializated"

}

class  UDWrappper {

    static let shared =  UDWrappper()

    private static let trueValue = "true"
    private static let falseValue = "false"

    private init() { 

        guard getBool(userDefaultKeyValue: UDManagerKeyValue.initializated) == nil else { return }

        SUDManager.shared.reset()
        set(userDefaultKeyValue: UDManagerKeyValue.initializated)
    }

    // MARK: - Bool
    func getBool(userDefaultKeyValue:String) -> Bool? {
        guard let data = self.getData(userDefaultKeyValue: userDefaultKeyValue),
            let dataToString = String(data: data, encoding: String.Encoding.utf8) else { return nil }
        return dataToString == UDWrappper.trueValue
    }

    func set(userDefaultKeyValue:String, value: Bool = true) {
        guard let data = String(value ? UDWrappper.trueValue : UDWrappper.falseValue).data(using: .utf8) else { return }
        self.set(userDefaultKeyValue: userDefaultKeyValue, dataValue: data)
    }

    // MARK: - Double
    func getDouble(userDefaultKeyValue:String) -> Double? {
        guard let data = self.getData(userDefaultKeyValue: userDefaultKeyValue),
            let dataToString = String(data: data, encoding: String.Encoding.utf8) else { return nil }
        return Double(dataToString)
    }

    func set(userDefaultKeyValue:String, value: Double) {
        guard let data = String(value).data(using: .utf8) else { return }
        self.set(userDefaultKeyValue: userDefaultKeyValue, dataValue: data)
    }

    // MARK: - Float
    func getFloat(userDefaultKeyValue:String) -> Float? {
        guard let data = self.getData(userDefaultKeyValue: userDefaultKeyValue),
            let dataToString = String(data: data, encoding: String.Encoding.utf8) else { return nil }
        return Float(dataToString)
    }

    func set(userDefaultKeyValue:String, value: Float) {
        guard let data = String(value).data(using: .utf8) else { return }
        self.set(userDefaultKeyValue: userDefaultKeyValue, dataValue: data)
    }

    // MARK: - Int
    func getInt(userDefaultKeyValue:String) -> Int? {
        guard let data = self.getData(userDefaultKeyValue: userDefaultKeyValue),
            let dataToString = String(data: data, encoding: String.Encoding.utf8) else { return nil }
        return Int(dataToString)
    }

    func set(userDefaultKeyValue:String, value: Int) {
        guard let data = String(value).data(using: .utf8) else { return }
        self.set(userDefaultKeyValue: userDefaultKeyValue, dataValue: data)
    }

    // MARK: - String
    func getString(userDefaultKeyValue:String) -> String? {
        guard let data = self.getData(userDefaultKeyValue: userDefaultKeyValue) else { return nil }
        return String(data: data, encoding: String.Encoding.utf8)
    }

    func set(userDefaultKeyValue:String, string: String) {
        guard let data = string.data(using: .utf8) else { return }
        self.set(userDefaultKeyValue: userDefaultKeyValue, dataValue: data)
    }

    // MARK: - Dictionable
    func getDictionary(userDefaultKeyValue:String) -> DictionableType? {
        guard let data = self.getData(userDefaultKeyValue: userDefaultKeyValue) else { return nil }

        return dataToDictionable(data: data)
    }

    func set(userDefaultKeyValue:String, dictionable: Dictionable) {
        guard let data = dictionableToData(dictionable: dictionable) else { return }
        self.set(userDefaultKeyValue: userDefaultKeyValue, dataValue: data)
    }

    // MARK: - Array
    func getArray<T>(userDefaultKeyValue:String) -> [T]? {
        guard let data = self.getData(userDefaultKeyValue: userDefaultKeyValue) else { return nil }
        return dataToArray(data: data)
    }

    func set<T>(userDefaultKeyValue:String, value: [T]) {
        guard let data = self.anyToData(value: value) else {
            return
        }
        self.set(userDefaultKeyValue: userDefaultKeyValue, dataValue: data)
    }

    func getArray(userDefaultKeyValue:String) -> [DictionableType]? {
        guard let data = self.getData(userDefaultKeyValue: userDefaultKeyValue) else { return nil }
        return dataToDictionaryArray(data: data)
    }

    func set(userDefaultKeyValue:String, value: [Dictionable]) {
        guard let data = self.anyToData(value: value) else {
            return
        }
        self.set(userDefaultKeyValue: userDefaultKeyValue, dataValue: data)
    }

    // MARK: - Data converters (Private)
    private func getData(userDefaultKeyValue:String) -> Data? {
        guard let cryptogramData = UserDefaults.standard.object(forKey: userDefaultKeyValue) as? Data else { return nil }

        do {
            let aes = try AES(key: SUDManager.shared.getKey(), iv: SUDManager.shared.getIv())
            let cryptogramByteArray = [UInt8](cryptogramData as Data)
            let plainByteArray = try aes.decrypt(cryptogramByteArray)

            return Data(plainByteArray)
        } catch {
            if #available(iOS 10.0, *) {
                os_log("Failed String persistance", log: OSLog.default, type: .error)
            } else {
                // Fallback on earlier versions
            }
            return nil
        }
    }

    private func set(userDefaultKeyValue:String, dataValue: Data) {

        do {
            let aes = try AES(key: SUDManager.shared.getKey(), iv: SUDManager.shared.getIv())
            let arrBytes = [UInt8](dataValue)
            let cryptogramByteArray = try aes.encrypt(arrBytes)
            let cryptogramData =  NSData(bytes: cryptogramByteArray, length: cryptogramByteArray.count)

            UserDefaults.standard.set(cryptogramData, forKey: userDefaultKeyValue)
            UserDefaults.standard.synchronize()
        } catch {
            if #available(iOS 10.0, *) {
                os_log("Failed String persistance", log: OSLog.default, type: .error)
            } else {
                // Fallback on earlier versions
            }
        }
    }

    private func anyToData(value: [Dictionable]) -> Data? {

        do {
            return try JSONSerialization.data(withJSONObject: value.map({ $0.toDictionary() }), options: [])
        } catch {
            return nil
        }
    }

    private func anyToData<T>(value: [T]) -> Data? {
        do {
            return try JSONSerialization.data(withJSONObject: value, options: [])
        } catch {
            return nil
        }
    }

    private func dataToArray<T>(data: Data) -> [T]? {
        do {
            return  try JSONSerialization.jsonObject(with: data, options: []) as? [T]
        } catch {
            return nil
        }
    }

    private func dictionableToData(dictionable: Dictionable) -> Data? {
        do {
            return try JSONSerialization.data(withJSONObject: dictionable.toDictionary(), options: [])
        } catch {
            return nil
        }
    }

    private func dataToDictionable(data: Data) -> DictionableType?  {
        do {
            return try JSONSerialization.jsonObject(with: data, options: []) as? DictionableType
        } catch {
            return nil
        }
    }
    private func dataToDictionaryArray(data: Data) -> [DictionableType]?  {
        do {
            return try JSONSerialization.jsonObject(with: data, options: []) as? [DictionableType]
        } catch {
            return nil
        }
    }
    
}

extension UDWrappper:Reseteable {
    func reset() {

        _ = Array(UserDefaults.standard.dictionaryRepresentation().keys).map({ UserDefaults.standard.removeObject(forKey: $0) })
        UserDefaults.standard.synchronize()
    }
}

