//
//  DIDManagerError.swift
//
//  Copyright 2024 Raonsecure
//

import Foundation

enum DIDManagerError: WalletCoreErrorProcotol {
    // Generate random (011xx)
    case failToGenerateRandom       // Fail to generate random
    
    // Create document (012xx)
    case documentIsAlreadyExists    // Document is already exists
    
    // Edit document (013xx)
    case duplicateKeyIDExistsInVerificationMethod   // Duplicate key ID exists in verification method
    case notFoundKeyIDInVerificationMethod          // Not found key ID in verification method
    case duplicateServiceIDExistsInService          // Duplicate service ID exists in service
    case notFoundServiceIDInService                 // Not found service ID in service
    case dontCallResetChangesIfNoDocumentSaved      // Don't call 'resetChanges' if no document saved
    
    // ETC (019xx)
    case unexpectedCondition        // Unexpected condition occurred
    
    
    func getCodeAndMessage() -> (String, String) {
        switch self {
            // Generate random (011xx)
        case .failToGenerateRandom:
            return ("01100", "Fail to generate random")
            
            // Create document (012xx)
        case .documentIsAlreadyExists:
            return ("01200", "Document is already exists")
            
            // Edit document (013xx)
        case .duplicateKeyIDExistsInVerificationMethod:
            return ("01300", "Duplicate key ID exists in verification method")
        case .notFoundKeyIDInVerificationMethod:
            return ("01301", "Not found key ID in verification method")
        case .duplicateServiceIDExistsInService:
            return ("01302", "Duplicate service ID exists in service")
        case .notFoundServiceIDInService:
            return ("01303", "Not found service ID in service")
        case .dontCallResetChangesIfNoDocumentSaved:
            return ("01304", "Don't call 'resetChanges' if no document saved")
            
            // ETC (019xx)
        case .unexpectedCondition:
            return ("01900", "Unexpected condition occurred")
        }
    }
}
