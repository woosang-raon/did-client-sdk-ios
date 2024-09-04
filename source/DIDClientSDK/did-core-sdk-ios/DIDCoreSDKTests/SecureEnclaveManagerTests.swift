//
//  SecureEnclaveManagerTests.swift
//
//  Copyright 2024 Raonsecure
//

import XCTest
import DIDUtilitySDK
@testable import DIDCoreSDK

final class SecureEnclaveManagerTests: XCTestCase {

    let groupName : String = "Test"
    let identifier: String = "myKey"
    
    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testGenerateKey() throws
    {
        let publicKey = try SecureEnclaveManager.generateKey(group: groupName,
                                                             identifier: identifier,
                                                             accessMethod: .none)
        print("publicKey - \(publicKey.toHex())")
    }
    
    func testSign() throws
    {
        if SecureEnclaveManager.isKeySaved(group: groupName,
                                           identifier: identifier)
        {
            try SecureEnclaveManager.deleteKey(group: groupName,
                                           identifier: identifier)
        }
        
        let publicKey = try SecureEnclaveManager.generateKey(group: groupName,
                                                             identifier: identifier,
                                                             accessMethod: .none)
        print("publicKey - \(publicKey.toHex())")
        
        let plainData = "Test".data(using: .utf8)!
        let digest = DigestUtils.getDigest(source: plainData, digestEnum: .sha256)
        
        let signature = try SecureEnclaveManager.sign(group: groupName,
                                                      identifier: identifier,
                                                      digest: digest)
        
        print("signature - \(signature.toHex())")
        let result = try SecureEnclaveManager.verify(publicKey: publicKey,
                                                     digest: digest,
                                                     signature: signature)
        print("result - \(result)")
        
    }
    

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}
