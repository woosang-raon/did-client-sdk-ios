//
//  VCManagerDataModel.swift
//
//  Copyright 2024 Raonsecure
//

import Foundation

/// VC information object to be used for VP generation.
public struct ClaimInfo {
    /// VC ID
    public var credentialId: String
    /// Array of claim codes to include in VP from VC
    public var claimCodes: [String]
    
    /// Initializer
    /// - Parameters:
    ///   - credentialId: VC ID
    ///   - claimCodes: Array of claim codes to include in VP from VC
    public init(credentialId: String, claimCodes: [String]) {
        self.credentialId = credentialId
        self.claimCodes = claimCodes
    }
}

/// Meta information for creating VP
public struct PresentationInfo {
    /// DID of the VC holder
    public var holder: String
    /// Start date and time of VC validity period
    public var validFrom: String
    /// End date and time of VC validity period
    public var validUntil: String
    /// Nonce received from the verifier
    public var verifierNonce: String
    
    /// Initializer
    /// - Parameters:
    ///   - holder: DID of the VC holder
    ///   - validFrom: Start date and time of VC validity period
    ///   - validUntil: End date and time of VC validity period
    ///   - verifierNonce: Nonce received from the verifier
    public init(holder: String, validFrom: String, validUntil: String, verifierNonce: String) {
        self.holder = holder
        self.validFrom = validFrom
        self.validUntil = validUntil
        self.verifierNonce = verifierNonce
    }
}

struct VCMeta: MetaProtocol {
    var id: String
}
