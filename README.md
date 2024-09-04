# iOS Client SDK

Welcome to the iOS Client SDK Repository. <br>
This repository provides an SDK for developing an iOS mobile wallet.

## Folder Structure
```
did-client-sdk-ios
├── CLA.md
├── CODE_OF_CONDUCT.md
├── CONTRIBUTING.md
├── MAINTAINERS.md
├── README_ko.md
├── README.md
├── RELEASE-PROCESS.md
├── docs
│   ├── api
│   │   ├── did-core-sdk-ios
│   │   │   ├── DIDManager_ko.md
│   │   │   ├── DIDManager.md
│   │   │   ├── KeyManager_ko.md
│   │   │   ├── KeyManager.md
│   │   │   ├── SecureEncryptor_ko.md
│   │   │   ├── SecureEncryptor.md
│   │   │   ├── VCManager_ko.md
│   │   │   ├── VCManager.md
│   │   │   └── WalletCoreError.md
│   │   ├── did-datamodel-sdk-ios
│   │   │   └── DataModel.md
│   │   └── did-utility-sdk-ios
│   │       ├── Utility_ko.md
│   │       ├── Utility.md
│   │       └── UtilityError.md
│   └── design
├── sample
└── source
    └── DIDClientSDK
        ├── DIDClientSDK.xcworkspace
        ├── did-core-sdk-ios
        │   ├── build_xcframework.sh
        │   ├── CHANGELOG.md
        │   ├── DIDCoreSDK.xcodeproj
        │   ├── LICENSE-dependencies.md
        │   ├── README_ko.md
        │   ├── README.md
        │   ├── SECURITY.md
        │   ├── DIDCoreSDK
        │   ├── DIDCoreSDKTests
        │   └── HostApp
        ├── did-datamodel-sdk-ios
        │   ├── build_xcframework.sh
        │   ├── CHANGELOG.md
        │   ├── DIDDataModelSDK.xcodeproj
        │   ├── LICENSE-dependencies.md
        │   ├── README_ko.md
        │   ├── README.md
        │   ├── SECURITY.md
        │   ├── DIDDataModelSDK
        │   └── DIDDataModelSDKTests
        ├── did-utility-sdk-ios
        │   ├── build_xcframework.sh
        │   ├── CHANGELOG.md
        │   ├── DIDUtilitySDK.xcodeproj        
        │   ├── LICENSE-dependencies.md
        │   ├── README_ko.md
        │   ├── README.md
        │   ├── SECURITY.md
        │   ├── DIDUtilitySDK
        │   └── DIDUtilitySDKTests
        └── release
            ├── did-core-sdk-ios-1.0.0
            │   └── DIDCoreSDK.xcframework
            ├── did-datamodel-sdk-ios-1.0.0
            │   └── DIDDataModelSDK.xcframework
            └── did-utility-sdk-ios-1.0.0
                └── DIDUtilitySDK.xcframework
```

| Name                    | Description                                     |
| ----------------------- | ----------------------------------------------- |
| source                  | SDK source code project                         |
| docs                    | Documentation                                   |
| ┖ api                   | API guide documentation                         |
| ┖ design                | Design documentation                            |
| sample                  | Samples and data                                |
| README.md               | Overview and description of the project         |
| CLA.md                  | Contributor License Agreement                   |
| CHANGELOG.md            | Version-specific changes in the project         |
| CODE_OF_CONDUCT.md      | Code of conduct for contributors                |
| CONTRIBUTING.md         | Contribution guidelines and procedures          |
| LICENSE-dependencies.md | Licenses for the project’s dependency libraries |
| MAINTAINERS.md          | General guidelines for maintaining              |
| RELEASE-PROCESS.md      | Release process                                 |
| SECURITY.md             | Security policies and vulnerability reporting   |

## Libraries

Libraries can be found in the [releases folder](source/DIDClientSDK/release).

### Core SDK

1. Copy the `DIDCoreSDK.xcframework` file to the framework directory of the app project.
2. Add the framework to the app project dependencies.
3. Set the framework to `Embede & Sign`.

### DataModel SDK

1. Copy the `DIDDataModelSDK.xcframework` file to the framework directory of the app project.
2. Add the framework to the app project dependencies.
3. Set the framework to `Embede & Sign`.

### Utility SDK

1. Copy the `DIDUtilitySDK.xcframework` file to the framework directory of the app project.
2. Add the framework to the app project dependencies.
3. Set the framework to `Embede & Sign`.

## API Reference

API Reference can be found : 
<br>
- [Core SDK](source/DIDClientSDK/did-core-sdk-ios/README.md)  
- [DataModel SDK](source/DIDClientSDK/did-datamodel-sdk-ios/README.md)  
- [Utility SDK](source/DIDClientSDK/did-utility-sdk-ios/README.md)  

## Change Log

ChangeLog can be found : 
<br>
- [Core SDK](source/DIDClientSDK/did-core-sdk-ios/CHANGELOG.md)  
- [DataModel SDK](source/DIDClientSDK/did-datamodel-sdk-ios/CHANGELOG.md)
- [Utility SDK](source/DIDClientSDK/did-utility-sdk-ios/CHANGELOG.md)  

## Contributing

Please read [CONTRIBUTING.md](CONTRIBUTING.md) and [CODE_OF_CONDUCT.md](CODE_OF_CONDUCT.md) for details on our code of conduct, and the process for submitting pull requests to us.


## License
Copyright 2024 Raonsecure
