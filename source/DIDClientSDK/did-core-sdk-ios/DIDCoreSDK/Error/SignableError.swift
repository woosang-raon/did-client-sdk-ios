//
//  SignableError.swift
//
//  Copyright 2024 Raonsecure
//

import Foundation

enum SignableError : WalletCoreErrorProcotol
{
    case invalidPublicKey
    case invalidPrivateKey
    case notDerivedKeyFromPrivateKey
    case failToConvertCompactRepresentation
    case createSignature(detail : Error)
    case verifySignatureFailed(detail : Error)
    
    func getCodeAndMessage() -> (String, String) 
    {
        switch self
        {
            //KeyPair(111xx)
        case .invalidPublicKey:
            return ("11100", "Not proper public key format")
        case .invalidPrivateKey:
            return ("11101", "Not proper private key format")
        case .notDerivedKeyFromPrivateKey:
            return ("11102", "Private and public keys are not pair")
            //Signature(112xx)
        case .failToConvertCompactRepresentation:
            return ("11200", "Converting failed to compact representation")
        case .createSignature(let detail):
            return ("11201", "Signing failed : \(detail)")
        case .verifySignatureFailed(let detail):
            return ("11202", "Failed to verify signature : \(detail)")
        }
    }
}
