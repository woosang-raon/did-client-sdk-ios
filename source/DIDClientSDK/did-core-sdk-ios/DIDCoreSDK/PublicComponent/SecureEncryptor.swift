//
//  SecureEncryptor.swift
//
//  Copyright 2024 Raonsecure
//

import Foundation

public struct SecureEncryptor
{
    typealias C = CommonError
    
    static let group : String = "SecureEncryptor"
    static let identifier : String = "encryptKey"
    
    /// Encrypt the plainData via SecureEnclave
    ///
    /// - Parameters:
    ///   - plainData : Data to encrypt
    /// - Returns: Encrypted data
    public static func encrypt(plainData : Data) throws -> Data
    {
        if plainData.isEmpty
        {
            throw C.invalidParameter(code: .secureEncryptor,
                                     name: "plainData").getError()
        }
        
        if !SecureEnclaveManager.isKeySaved(group: group,
                                            identifier: identifier)
        {
            try SecureEnclaveManager.generateKey(group: group,
                                                 identifier: identifier,
                                                 accessMethod: .none)
        }
        return try SecureEnclaveManager.encrypt(group: group,
                                                identifier: identifier,
                                                plainData: plainData)
    }
    
    /// Decrypt the cipherData that encrypted via SecureEnclave
    ///
    /// - Parameters:
    ///   - cipherData Encrypted data via Secure Enclave
    /// - Returns: Plain data
    public static func decrypt(cipherData : Data) throws -> Data
    {
        if cipherData.isEmpty
        {
            throw C.invalidParameter(code: .secureEncryptor,
                                     name: "cipherData").getError()
        }
        
        return try SecureEnclaveManager.decrypt(group: group,
                                                identifier: identifier,
                                                cipherData: cipherData)
    }
}
