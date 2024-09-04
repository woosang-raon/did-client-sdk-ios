//
//  SecureEncryptorTests.swift
//
//  Copyright 2024 Raonsecure
//

import XCTest
@testable import DIDCoreSDK

final class SecureEncryptorTests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testEncryptAndDecrypt() throws
    {
        let plainData = "Test".data(using: .utf8)!
        
        let encrypted = try SecureEncryptor.encrypt(plainData: plainData)
        let decrypted = try SecureEncryptor.decrypt(cipherData: encrypted)
        
        XCTAssertEqual(plainData, decrypted, "SecureEncryptor is working")
    }

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}
