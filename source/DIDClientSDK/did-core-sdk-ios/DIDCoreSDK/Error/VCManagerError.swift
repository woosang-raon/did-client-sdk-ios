//
//  VCManagerError.swift
//
//  Copyright 2024 Raonsecure
//

import Foundation

enum VCManagerError: WalletCoreErrorProcotol {
    case noClaimCodeInCredentialForPresentation(code: String)     // No claim code in credential(VC) for presentation
    
    func getCodeAndMessage() -> (String, String) {
        switch self {
        case .noClaimCodeInCredentialForPresentation(let code):
            return ("02100", "No claim code in credential(VC) for presentation. Not found code(s) : \(code)")
        }
    }
}
