//
//  Character+Extension.swift
//
//  Copyright 2024 Raonsecure
//

import Foundation

extension Character {
    func toUInt8() -> UInt8 {
        return String(self).utf8.map{UInt8($0)}[0]
    }
}

