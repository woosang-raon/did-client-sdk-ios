//
//  StorageManagerTests.swift
//
//  Copyright 2024 Raonsecure
//

import XCTest
@testable import DIDCoreSDK

final class StorageManagerTests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    
    func testTest() throws {
        var path = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first!
        path.append(path: "test.txt")
        
        var data = "test file".data(using: .utf8)!
        
        try data.write(to: path)
        
        print("path : \(path.path)")
    }

    func testExample() throws {
        
//        print("document dir : \(NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true)[0])")
        
        struct Meta: MetaProtocol {
            var id: String
            var name: String
        }
        
        struct Item: Codable {
            var id: String
            var name: String
            var value: String
        }
        
        let meta = Meta(id: "a", name: "b")
        let item = Item(id: "a", name: "b", value: "c")
        
        let sm = try StorageManager<Meta, Item>(fileName: "myWallet", fileExtension: .key, isEncrypted: true)
        
        print("sm.isSaved : \(sm.isSaved())")
        
//        if let items = try sm.getAllItems(identifiers: nil) {
//            XCTAssert(false)
//        }
//        
//        try sm.addItem(walletItem: .init(meta: meta, item: item))
//        
//        guard let items = try sm.getAllItems(identifiers: nil) else {
//            XCTAssert(false)
//            return
//        }
//        
//        print("items.. \(items)")
    }

}
