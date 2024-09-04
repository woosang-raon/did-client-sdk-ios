//
//  DIDManagerDataModel.swift
//
//  Copyright 2024 Raonsecure
//

import Foundation

/// An object containing public key information to register in the DID document.
public struct DIDKeyInfo {
    /// Public key information object returned by KeyManager
    public var keyInfo: KeyInfo
    /// Type specifying the purpose of the public key registered in the DID document
    public var methodType: DIDMethodType
    /// DID to be registered as the controller of the public key in the DID document. If nil, the DID document's id will be registered as the controller.
    public var controller: String?
    
    /// Initializer
    /// - Parameters:
    ///   - keyInfo: Public key information object returned by KeyManager
    ///   - methodType: Type specifying the purpose of the public key registered in the DID document
    ///   - controller: DID to be registered as the controller of the public key in the DID document. If nil, the DID document's id will be registered as the controller.
    public init(keyInfo: KeyInfo, methodType: DIDMethodType, controller: String? = nil) {
        self.keyInfo = keyInfo
        self.methodType = methodType
        self.controller = controller
    }
}

/// A type that specifies the purpose of the keys to register in the DID document.
public struct DIDMethodType : OptionSet
{
    public let rawValue: Int
    
    public static let assertionMethod       = DIDMethodType(rawValue: 1 << 0)
    public static let authentication        = DIDMethodType(rawValue: 1 << 1)
    public static let keyAgreement          = DIDMethodType(rawValue: 1 << 2)
    public static let capabilityInvocation  = DIDMethodType(rawValue: 1 << 3)
    public static let capabilityDelegation  = DIDMethodType(rawValue: 1 << 4)
    
    /// Initializer
    /// - Parameter rawValue: Raw value of DIDMethodType
    public init(rawValue: Int) {
        self.rawValue = rawValue
    }
}

struct DIDMeta: MetaProtocol {
    var id: String
}
