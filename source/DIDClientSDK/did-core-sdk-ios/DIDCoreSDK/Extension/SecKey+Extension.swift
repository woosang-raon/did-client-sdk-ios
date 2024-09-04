//
//  SecKey+Extension.swift
//
//  Copyright 2024 Raonsecure
//

import Foundation

extension SecKey {
    /// Get public key from SecKey
    /// self must have private key
    /// - Returns: Public key object
    func toPublicKey() throws -> SecKey
    {
        guard let pubKey = SecKeyCopyPublicKey(self)
        else
        {
            throw SecureEnclaveError.copyPublicKey.getError()
        }
        
        return pubKey
    }
    
    /// Get compressed public key data from SecKey
    /// - Returns: Compressed public key data
    func toCompressedPublicKeyData() throws -> Data
    {
        var error: Unmanaged<CFError>?
        
        guard let pubKeyData = SecKeyCopyExternalRepresentation(self,
                                                                &error) as? Data
        else
        {
            throw SecureEnclaveError.publicKeyRepresentation(detail: error!.toError()).getError()
        }
        
        return try pubKeyData.toCompressedRepresentationFromRawPublicKey()
    }
}
