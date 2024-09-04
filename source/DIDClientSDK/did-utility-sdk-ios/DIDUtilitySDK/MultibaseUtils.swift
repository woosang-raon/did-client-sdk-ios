//
//  MultibaseUtils.swift
//
//  Copyright 2024 Raonsecure
//

import Foundation

/// Utility class for encoding/decoding using Multibase.
public class MultibaseUtils {

    typealias C = CommonError
    typealias E = MultibaseUtilsError
    
    /// Encodes the input data using Multibase encoding.
    /// - Parameters:
    ///   - type: Multibase encoding type
    ///   - data: Data to be encoded
    /// - Returns: Encoded data
    public static func encode(type: MultibaseType, data: Data) -> String {
        if data.count == 0 {
            return ""
        }
        
        var result = type.rawValue
        
        switch type {
        case .base16:
            result.append(data.base16Encoded)
        case .base16Upper:
            result.append(data.base16UpperEncoded)
        case .base58BTC:
            result.append(data.base58BTCEncoded)
        case .base64:
            result.append(data.base64Encoded)
        case .base64URL:
            result.append(data.base64URLEncoded)
        }
        
        return result
    }
    
    /// Decodes the given Multibase encoded string.
    /// - Parameters:
    ///   - encoded: Multibase encoded string to be decoded
    /// - Returns: Decoded data
    public static func decode(encoded: String) throws -> Data {

        if encoded.count < 2 {
            throw C.invalidParameter(code: .multibaseUtils, name: "encoded").getError()
        }
        
        let prefix = String(encoded.prefix(1))
        let startIndex = encoded.index(encoded.startIndex, offsetBy: 1)
        let value = String(encoded[startIndex...])
        
        guard let type = MultibaseType(rawValue: prefix) else {
            throw E.unsupportedEncodingType(prefix: prefix).getError()
        }
        
        let result: Data?
        
        switch type {
        case .base16, .base16Upper:
            result = value.base16Decoded
        case .base58BTC:
            result = value.base58BTCDecoded
        case .base64:
            result = value.base64Decoded
        case .base64URL:
            result = value.base64URLDecoded
        }
        
        guard let result = result else {
            throw E.failToDecode.getError()
        }
        
        return result
        
    }
    
}
