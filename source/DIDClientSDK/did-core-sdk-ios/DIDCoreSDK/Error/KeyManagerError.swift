//
//  KeyManagerError.swift
//
//  Copyright 2024 Raonsecure
//

import Foundation

enum KeyManagerError : WalletCoreErrorProcotol
{
    case existKeyID
    case notConformToKeyGenRequest(detail : StorageOption)
    case newPinEqualsOldPin
    case notPinAuthType
    case evaluatePolicy(detail : Error)
    case domainStateNil
    case userBiometricsChanged
    case foundNoKeyByKeyType
    case insufficientResultByKeyType
    case unsupportedAlgorithm
    
    func getCodeAndMessage() -> (String, String)
    {
        switch self 
        {
            //Generate Key(001xx)
        case .existKeyID:
            return ("00100","Given key id already exists")
        case .notConformToKeyGenRequest(let detail):
            let detailName : String
            switch detail 
            {
            case .wallet:
                detailName = "Wallet"
            case .secureEnclave:
                detailName = "Secure"
            }
            return ("00101","Given keyGenRequest does not conform to \(detailName)KeyGenRequest")
            //Pin(002xx)
        case .newPinEqualsOldPin:
            return ("00200","Given new pin is equal to old pin")
        case .notPinAuthType:
            return ("00201","Given key id is not pin auth type")
            //Biometrics(003xx)
        case .evaluatePolicy(let detail):
            return ("00300","Error occurs while evaluate policy : \(detail)")
        case .domainStateNil:
            return ("00301","Cannot get domain state")
        case .userBiometricsChanged:
            return ("00302","User biometrics changed")
            //Get KeyInfo(004xx)
        case .foundNoKeyByKeyType:
            return ("00400","Found no key by given keyType")
        case .insufficientResultByKeyType:
            return ("00401","Insufficient result by given keyType")
            //ETC.(009xx)
        case .unsupportedAlgorithm:
            return ("00900","Given algorithm is unsupported")
        }
    }
}
