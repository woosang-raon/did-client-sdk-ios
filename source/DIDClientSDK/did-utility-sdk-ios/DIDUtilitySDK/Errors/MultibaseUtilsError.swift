//
//  MultibaseUtilsError.swift
//
//  Copyright 2024 Raonsecure
//

import Foundation

enum MultibaseUtilsError: UtilityErrorProtocol {
    // Decode (011xx)
    case failToDecode
    
    // ETC (019xx)
    case unsupportedEncodingType(prefix: String)
    
    func getCodeAndMessage() -> (String, String) {
        switch self {
            // Decode (011xx)
        case .failToDecode:
            return ("01100", "Fail to decode")
            // ETC (019xx)
        case .unsupportedEncodingType(let prefix):
            return ("01900", "Unsupported encoding type. prefix : \(prefix)")
        }
    }
}

