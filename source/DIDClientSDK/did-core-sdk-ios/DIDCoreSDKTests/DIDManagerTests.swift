//
//  DIDManagerTests.swift
//
//  Copyright 2024 Raonsecure
//

import XCTest
@testable import DIDCoreSDK

final class DIDManagerTests: XCTestCase {
    
    let fileName = "test"

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    
    func testCreateDocument() throws {
        var didManager = try DIDManager(fileName: fileName)
        
        guard didManager.isSaved else {
            print("DID Document is already exists")
            return
        }
        
        let did = try DIDManager.genDID(methodName: "omn")
        
        var keyInfos: [DIDKeyInfo] = .init()
        
        let keyInfo = KeyInfo(algorithmType: .secp256r1, id: "pin", accessMethod: .walletPin, authType: .pin, publicKey: "asdf")
        
        keyInfos.append(.init(keyInfo: keyInfo, methodType: [.assertionMethod, .authentication]))
        
        try didManager.createDocument(did: did, keyInfos: keyInfos, controller: nil, service: nil)
        
        var didDoc = try didManager.getDocument()
        print("getDocument after createDocument: \n\n\(try didDoc.toJson(isPretty: true))")
        
        didDoc.proofs = [.init(created: "test", proofPurpose: .assertionMethod, verificationMethod: "test", type: .secp256r1Signature2018, proofValue: "test")]
        
        didManager.replaceDocument(didDocument: didDoc, needUpdate: false)
        
        try didManager.saveDocument()
        
        let didDoc2 = try didManager.getDocument()
        print("getDocument after saveDocument: \n\n\(try didDoc2.toJson(isPretty: true))")
        
    }
    
    func testGetDocument() throws {
        var didManager = try DIDManager(fileName: fileName)
        
        if didManager.isSaved {
            let didDoc = try didManager.getDocument()
            print("getDocument from wallet : \n\n\(try didDoc.toJson(isPretty: true))")
        } else {
            print("No DID Document from wallet")
        }
        
    }
    
    func testDeleteFile() throws {
        var didManager = try DIDManager(fileName: fileName)
        
        if didManager.isSaved {
            try didManager.deleteDocument()
            print("DID Document is removed")
        } else {
            print("No DID Document from wallet")
        }
    }

}
