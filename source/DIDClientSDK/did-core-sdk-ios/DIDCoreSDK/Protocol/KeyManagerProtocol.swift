//
//  KeyManagerProtocol.swift
//
//  Copyright 2024 Raonsecure
//

import Foundation
import DIDDataModelSDK

//MARK: Public
/// General KeyGenRequest Protocol
public protocol KeyGenRequestProtocol
{
    /// Algorithm type for Key
    var algorithmType : AlgorithmType { get }
    /// Key name
    var id : String { get }
    /// Key storage
    var storage : StorageOption { get }
}

/// KeyGenRequest Protocol for Wallet Storage
public protocol WalletKeyGenRequestProtocol : KeyGenRequestProtocol
{
    /// Access method for Wallet
    var accessMethod : WalletAccessMethod { get }
}

/// KeyGenRequest Protocol for Secure Enclave
public protocol SecureKeyGenRequestProtocol : KeyGenRequestProtocol
{
    /// Access method for Secure Enclave
    var accessMethod : SecureEnclaveAccessMethod { get }
    /// Description for Touch ID usage
    var prompt : String { get }
}

//MARK: Private
protocol SignableProtocol
{
    typealias RawKeyPair = (privateKey : Data, publicKey : Data)
    
    func generateKey() throws -> RawKeyPair
    func sign(privateKey : Data, digest : Data) throws -> Data
    func verify(publicKey : Data, digest : Data, signature : Data) throws -> Bool
    func checkKeyPairMatch(privateKey : Data, publicKey : Data) throws
}
