//
//  CryptoUtilsError.swift
//
//  Copyright 2024 Raonsecure
//

import Foundation

enum CryptoUtilsError: UtilityErrorProtocol {
    // Create (001xx)
    case failToCreateRandomKey(Error)
    case failToDerivePublicKey
    case failToGenerateSharedSecretUsingECDH(Error)
    case failToDeriveKeyUsingPBKDF2

    // Convert Type (002xx)
    case failToConvertPublicKeyToExternalRepresentation(Error)
    case failToConvertPrivateKeyToExternalRepresentation(Error)
    case failToConvertPrivateKeyToObject(Error)
    case failToConvertPublicKeyToObject(Error)
    
    // Encryption (003xx)
    case failToEncryptUsingAES
    case failToDecryptUsingAES
    
    // ETC (009xx)
    case unsupprotedECType(typeName: String)
    
    func getCodeAndMessage() -> (String, String) {
        switch self {
            // Create (001xx)
        case .failToCreateRandomKey(let error):
            return ("00100", "Fail to create random key. error : \(String(describing: error))")
        case .failToDerivePublicKey:
            return ("00101", "Fail to derive public key")
        case .failToGenerateSharedSecretUsingECDH(let error):
            return ("00102", "Fail to generate shared secret using ECDH. error : \(String(describing: error))")
        case .failToDeriveKeyUsingPBKDF2:
            return ("00103", "Fail to derive key using PBKDF2")
            // Convert Type (002xx)
        case .failToConvertPublicKeyToExternalRepresentation(let error):
            return ("00200", "Fail to convert public key to external representation. error : \(String(describing: error))")
        case .failToConvertPrivateKeyToExternalRepresentation(let error):
            return ("00201", "Fail to convert private key to external representation. error : \(String(describing: error))")
        case .failToConvertPrivateKeyToObject(let error):
            return ("00202", "Fail to convert private key to object. error : \(String(describing: error))")
        case .failToConvertPublicKeyToObject(let error):
            return ("00203", "Fail to convert public key to object. error : \(String(describing: error))")
            // Encryption (003xx)
        case .failToEncryptUsingAES:
            return ("00300", "Fail to encrypt using AES")
        case .failToDecryptUsingAES:
            return ("00301", "Fail to decrypt using AES")
            // ETC (009xx)
        case .unsupprotedECType(let typeName):
            return ("00900", "Unsupported ECType : \(typeName)")
        }
    }
}
