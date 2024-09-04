//
//  CommonError.swift
//
//  Copyright 2024 Raonsecure
//

import Foundation

enum CommonError: UtilityErrorProtocol {
    enum FunctionCode: String {
        case cryptoUtils    = "00"
        case multibaseUtils = "01"
        case digestUtils    = "02"
    }
    
    case invalidParameter(code: FunctionCode, name: String)     // Parameter delivered from function is invalid

    func getCodeAndMessage() -> (String, String) {
        switch self {
        case .invalidParameter(let code, let name):
            return ("\(code.rawValue)000", "Invalid parameter : \(name)")
        }
    }
}
