//
//  PropertyWrapper.swift
//
//  Copyright 2024 Raonsecure
//

import Foundation

/// TBD
@propertyWrapper
public struct UTCDatetime {
//    private let regEx : String = "[0-9a-zA-Z_\\-\\.]+"
    private var value : String
    public var wrappedValue : String
    {
        get{ self.value }
        set{ self.value = newValue }
    }
    
    public init(wrappedValue : String)
    {
//        precondition(wrappedValue.matches(regEx: regEx))
        self.value = wrappedValue
    }
}

/// TBD
@propertyWrapper
public struct DIDVersionId {
    private let regEx : String = "[0-9]+"
    private var value : String

    public var wrappedValue : String
    {
        get{ self.value }
        set{
            precondition(newValue.matches(regEx: regEx), "\(regEx) does not match the regex")
            self.value = newValue
        }
    }
    
    public init(wrappedValue : String)
    {
        precondition(wrappedValue.matches(regEx: regEx), "\(regEx) does not match the regex")
        self.value = wrappedValue
    }
}

//MARK: - Private

fileprivate extension String
{
    func matches(regEx : String) ->Bool
    {
        let pred = NSPredicate(format: "SELF MATCHES %@", regEx)
        return pred.evaluate(with: self)
    }
}
