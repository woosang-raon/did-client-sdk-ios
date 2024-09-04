//
//  String+Extension.swift
//
//  Copyright 2024 Raonsecure
//

import Foundation

extension String
{
    //MARK: - HexDecimal(base16)
    func hexToData() -> Data?
    {
        let hexString = self
        let length = hexString.count / 2
        var data = Data(capacity: length)
        for i in 0 ..< length {
            let j = hexString.index(hexString.startIndex, offsetBy: i * 2)
            let k = hexString.index(j, offsetBy: 2)
            let bytes = hexString[j..<k]
            if var byte = UInt8(bytes, radix: 16) {
                data.append(&byte, count: 1)
            } else {
                return nil
            }
        }
        return data
    }
    
    func decodeBase64() -> Data? {
        return Data(base64Encoded: self)
    }
    
    func isMatched(with pattern: String) throws -> Bool {
        if #available(iOS 16.0, *) {
            let regEx = try Regex(pattern)
            return self.contains(regEx)
        } else {
            let regEx = try NSRegularExpression(pattern: pattern)
            let output = regEx.numberOfMatches(in: self, range: .init(location: 0, length: self.count))
            return output > 0
        }
    }
}
