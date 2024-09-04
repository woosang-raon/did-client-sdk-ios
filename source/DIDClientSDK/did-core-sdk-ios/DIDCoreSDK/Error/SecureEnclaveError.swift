//
//  SecureError.swift
//
//  Copyright 2024 Raonsecure
//

import Foundation

enum SecureEnclaveError : WalletCoreErrorProcotol
{
    case createKey(detail : Error)
    case copyPublicKey
    case publicKeyRepresentation(detail : Error)
    case notExistKey
    case failToDeleteKey
    case createSignature(detail : Error)
    case createEncryptedData(detail : Error)
    case createDecryptedData(detail : Error)
    
    func getCodeAndMessage() -> (String, String) {
        switch self 
        {
            //KeyPair(121xx)
        case .createKey(let detail):
            return ("12100", "Failed to create secure key : \(detail)")
        case .copyPublicKey:
            return ("12101", "Failed to copy public key")
        case .publicKeyRepresentation(let detail):
            return ("12102", "Failed to get public key representation : \(detail)")
        case .notExistKey:
            return ("12103", "Cannot find secure key by given conditions")
        case .failToDeleteKey:
            return ("12104", "Failed to delete secure key")
            //Signature(122xx)
        case .createSignature(let detail):
            return ("12200", "Signing failed : \(detail)")
            //Encryption(123xx)
        case .createEncryptedData(let detail):
            return ("12300", "Cannot create encrypted data : \(detail)")
        case .createDecryptedData(let detail):
            return ("12301", "Cannot create decrypted data : \(detail)")
        }
    }
}
