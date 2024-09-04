//
//  PrivateKey+Extension.swift
//
//  Copyright 2024 Raonsecure
//

import Foundation
import CryptoKit

extension P256.Signing.PrivateKey
{
    func derivePublicKeyData() throws -> Data
    {
        let publicKey = self.publicKey
        if #available(iOS 16.0, *)
        {
            return publicKey.compressedRepresentation
        }
        else
        {
            return try publicKey.x963Representation.toCompressedRepresentationFromRawPublicKey()
        }
    }
}




