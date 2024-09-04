//
//  WalletCoreError.swift
//
//  Copyright 2024 Raonsecure
//

import Foundation

protocol WalletCoreErrorProcotol {
    func getCodeAndMessage() -> (String, String)
    func getError() -> WalletCoreError
}

extension WalletCoreErrorProcotol {
    func getError() -> WalletCoreError {
        return .init(error: self)
    }
}

public struct WalletCoreError: Error {
    public let code: String
    public let message: String
    
    init(error: WalletCoreErrorProcotol) {
        code = "MSDKWLT" + error.getCodeAndMessage().0
        message = error.getCodeAndMessage().1
    }
}
