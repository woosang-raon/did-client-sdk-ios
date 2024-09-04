//
//  Data+Extension.swift
//
//  Copyright 2024 Raonsecure
//

import Foundation

extension Data {
    
    //MARK: - Encode
    
    var base16Encoded: String {
        return self.reduce(into: "", { $0.append(String(format: "%02x", $1)) })
    }
    
    var base16UpperEncoded: String {
        return self.reduce(into: "", { $0.append(String(format: "%02X", $1)) })
    }
    
    var base58BTCEncoded: String {
        return Base58BTC.encode(input: self)
    }
    
    var base64Encoded: String {
        return self.base64EncodedString().replacingOccurrences(of: "=", with: "")
    }
    
    var base64URLEncoded: String {
        return self.base64Encoded
                    .replacingOccurrences(of: "+", with: "-")
                    .replacingOccurrences(of: "/", with: "_")
    }
    
}
