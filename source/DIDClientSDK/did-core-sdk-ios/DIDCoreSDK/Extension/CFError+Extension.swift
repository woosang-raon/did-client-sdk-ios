//
//  CFError+Extension.swift
//
//  Copyright 2024 Raonsecure
//

import Foundation

extension Unmanaged<CFError> {
    func toError() -> Error
    {
        self.takeRetainedValue() as Error
    }
}
