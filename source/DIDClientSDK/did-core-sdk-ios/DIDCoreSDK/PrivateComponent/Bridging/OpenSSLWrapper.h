//
//  OpenSSLWrapper.h
//
//  Copyright 2024 Raonsecure
//

#import <Foundation/Foundation.h>

typedef NS_CLOSED_ENUM(NSInteger, OSWSignError) {
    OSWFailToConvertDataToObject = 1,
    OSWFailToSign,
    OSWFailToConvertFormatToCompact,
};

typedef NS_CLOSED_ENUM(NSInteger, OSWVerifyError) {
    OSWVerifyInvalidParameter = 1,
    OSWVerifyInvalidRecoveryId,
    OSWVerifyFailToRecoverPublicKey,
};

NS_ASSUME_NONNULL_BEGIN

@interface OpenSSLWrapper : NSObject

+ (nullable NSData *)toCompactRepresentationFromX962Signature:(NSData *)x962
                                                       digest:(NSData *)digest
                                                    publicKey:(NSData *)publicKey;

+ (nullable NSData *)sign:(NSData *)digest
               privateKey:(NSData *)privateKey
                publicKey:(NSData *)publicKey
                    error:(NSError *_Nullable *_Nullable)error;

//https://stackoverflow.com/questions/45565960/ns-refined-for-swift-and-return-value
//https://github.com/apple/swift-clang/blob/383859a9c4b964af3d127b5cc8abd0a8f11dd164/include/clang/Basic/AttrDocs.td#L1800-L1819
+ (BOOL)verify:(NSData *)signature
        digest:(NSData *)digest
     publicKey:(NSData *)publicKey
         error:(NSError *_Nullable *_Nullable)error __attribute__((swift_error(nonnull_error)));

@end

NS_ASSUME_NONNULL_END
