//
//  DigestUtils.swift
//
//  Copyright 2024 Raonsecure
//

import Foundation
import CryptoKit

/// Utility class for hash function.
public class DigestUtils {
    
    /// Hashes the input data.
    /// - Parameters:
    ///   - source: Data to be hashed
    ///   - digestEnum: Type of hash
    /// - Returns: Hashed data
    public static func getDigest(source: Data, digestEnum: DigestEnum) -> Data {
        
        switch digestEnum {
        case .sha256:
            return SHA256.hash(data: source).withUnsafeBytes({ Data(bytes: $0.baseAddress!, count: SHA256Digest.byteCount) })

        case .sha384:
            return SHA384.hash(data: source).withUnsafeBytes({ Data(bytes: $0.baseAddress!, count: SHA384Digest.byteCount) })
            
        case .sha512:
            return SHA512.hash(data: source).withUnsafeBytes({ Data(bytes: $0.baseAddress!, count: SHA512Digest.byteCount) })
        }
        
    }
    
}
