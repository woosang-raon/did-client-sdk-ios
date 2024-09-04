//
//  Enums.swift
//
//  Copyright 2024 Raonsecure
//

import Foundation

//MARK: - CryptoUtils

/// Elliptic Curve Key Algorithm Type
public enum ECType: String {
    case secp256r1 = "Secp256r1"
    case secp256k1 = "Secp256k1"
}

/// Symmetric key encryption algorithm type
public enum EncryptionType: String {
    case aes = "AES"
}

/// Symmetric key encryption algorithm operation mode
public enum EncryptionMode: String {
    case cbc = "CBC"
    case ecb = "ECB"
}

/// Symmetric key size.
public enum SymmetricKeySize: UInt {
    case size128 = 128
    case size256 = 256
}

/// Integrated definition type for symmetric key encryption algorithm/size/mode of operation.
/// This type is composed of three types. Those types are EncryptionType/SymmetricKeySize/EncryptionMode.
public enum SymmetricCipherType: String {
    case aes128CBC = "AES-128-CBC"
    case aes128ECB = "AES-128-ECB"
    case aes256CBC = "AES-256-CBC"
    case aes256ECB = "AES-256-ECB"
}

/// Symmetric key encryption padding type.
public enum SymmetricPaddingType: String {
    case noPad = "NOPAD"
    case pkcs5 = "PKCS5"
}

//MARK: - MultibaseUtils

/// Multibase encoding type.
public enum MultibaseType: String {
    case base16         = "f"
    case base16Upper    = "F"
    case base58BTC      = "z"
    case base64         = "m"
    case base64URL      = "u"
}

//MARK: - DigestUtils

/// Hash algorithm type.
public enum DigestEnum: String {
    case sha256 = "sha256"
    case sha384 = "sha384"
    case sha512 = "sha512"
}
