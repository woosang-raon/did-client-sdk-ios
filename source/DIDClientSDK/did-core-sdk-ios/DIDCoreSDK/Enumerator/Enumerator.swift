//
//  Enumerator.swift
//
//  Copyright 2024 Raonsecure
//

import Foundation

//MARK: KeyManager
/// Access method in Wallet
public enum WalletAccessMethod
{
    case none
    case pin(value : Data)
}

/// Access method in Secure Enclave
public enum SecureEnclaveAccessMethod : Int, Codable
{
    case none       = 0
    case currentSet = 1
    case any        = 2
}

/// Indicate key storage
public enum StorageOption : Int, Codable
{
    case wallet         = 0
    case secureEnclave  = 1
}

/// Indicate key storage and its access method
public enum KeyAccessMethod : Int, Codable
{
    case walletNone = 0
    case walletPin  = 1
    case secureEnclaveNone       = 8
    case secureEnclaveCurrentSet = 9
    case secureEnclaveAny        = 10
}


