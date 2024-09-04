//
//  CommonError.swift
//
//  Copyright 2024 Raonsecure
//

import Foundation

enum CommonError: WalletCoreErrorProcotol {
    enum FunctionCode: String {
        case keyManager      = "00"
        case didManager      = "01"
        case vcManager       = "02"
        case secureEncryptor = "03"

        case storageMaanger  = "10"
        case signable        = "11"
        case secureEnclave   = "12"
    }
    
    case invalidParameter(code: FunctionCode, name: String)     // Parameter delivered from function is invalid
    case duplicateParameter(code: FunctionCode, name: String)   // Parameter delivered from function has duplicated
    case failToDecode(code: FunctionCode, name: String)         // Fail to decode some data

    func getCodeAndMessage() -> (String, String) {
        switch self {
        case .invalidParameter(let code, let name):
            return ("\(code.rawValue)000", "Invalid parameter : \(name)")
        case .duplicateParameter(let code, let name):
            return ("\(code.rawValue)001", "Duplicate parameter : \(name)")
        case .failToDecode(let code, let name):
            return ("\(code.rawValue)002", "Fail to decode : \(name)")
        }
    }
}
