//
//  KeychainService.swift
//  HomeBakery
//
//  Created by Bohdan Borysenko on 08.04.2025.
//

import Foundation
import Security

class KeychainService {
    static let shared = KeychainService()
    
    private init() {}
    
    func set(key: String, value: String) {
        if let data = value.data(using: .utf8) {
            let query: [String: Any] = [
                kSecClass as String: kSecClassGenericPassword,
                kSecAttrAccount as String: key,
                kSecValueData as String: data
            ]
            
            SecItemDelete(query as CFDictionary) // удалим, если уже существует
            SecItemAdd(query as CFDictionary, nil)
        }
    }

    func get(key: String) -> String? {
        let query: [String: Any] = [
            kSecClass as String: kSecClassGenericPassword,
            kSecAttrAccount as String: key,
            kSecReturnData as String: true,
            kSecMatchLimit as String: kSecMatchLimitOne
        ]

        var result: AnyObject?
        if SecItemCopyMatching(query as CFDictionary, &result) == noErr {
            if let data = result as? Data {
                return String(data: data, encoding: .utf8)
            }
        }
        return nil
    }

    func delete(key: String) {
        let query: [String: Any] = [
            kSecClass as String: kSecClassGenericPassword,
            kSecAttrAccount as String: key
        ]

        SecItemDelete(query as CFDictionary)
    }
}
