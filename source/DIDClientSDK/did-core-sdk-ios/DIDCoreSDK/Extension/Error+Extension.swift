//
//  Error+Extension.swift
//
//  Copyright 2024 Raonsecure
//

import Foundation

extension Error {
    func toString() -> String {
        return String(describing: self)
    }
}
