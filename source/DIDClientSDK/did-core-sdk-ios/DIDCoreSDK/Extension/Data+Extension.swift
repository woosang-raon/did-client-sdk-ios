//
//  Data+Extension.swift
//
//  Copyright 2024 Raonsecure
//

import Foundation
import CryptoKit
import DIDUtilitySDK

//MARK: HexDecimal(base16)
extension Data
{
    func toHex() -> String
    {
        return self.reduce("", {String(format: "\($0)%02x", $1)})
    }
}

//MARK: Secp256R1
extension Data
{
    func derivePublicKeyFromPrivateKeyData() throws -> Data
    {
        let privateKey : P256.Signing.PrivateKey
        do
        {
            privateKey = try P256.Signing.PrivateKey(rawRepresentation: self)
        }
        catch
        {
            throw SignableError.invalidPrivateKey.getError()
        }
        
        return try privateKey.derivePublicKeyData()
    }
    
    func toCompressedRepresentationFromRawPublicKey() throws -> Data
    {
        if count != 65 || self[0] != 0x04
        {
            throw SignableError.invalidPublicKey.getError()
        }
        
        let offsetX = 1
        let offsetY = 33
        
        let x = self[offsetX..<offsetY]
        let y = self[offsetY...]
        
        var tag: Data!
        
        if y.last! & 0x01 == 0x01
        {
            tag = Data(repeating: 0x03, count: 1)
        } else
        {
            tag = Data(repeating: 0x02, count: 1)
        }
        return tag + x
    }
}

//MARK: Hash

extension Data {
    func sha256() -> Data {
        return DigestUtils.getDigest(source: self, digestEnum: .sha256)
    }
}
