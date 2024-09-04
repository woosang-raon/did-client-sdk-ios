//
//  UtilityError.swift
//
//  Copyright 2024 Raonsecure
//

import Foundation

public struct UtilityError: Error {
    public var code: String
    public var message: String
}

protocol UtilityErrorProtocol {
    func getCodeAndMessage() -> (String, String)
    func getError() -> UtilityError
}

extension UtilityErrorProtocol {
    func getError() -> UtilityError {
        let (code, message) = getCodeAndMessage()
        return .init(code: "MSDKUTL" + code, message: message)
    }
}
