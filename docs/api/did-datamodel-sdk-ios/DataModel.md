---
puppeteer:
    pdf:
        format: A4
        displayHeaderFooter: true
        landscape: false
        scale: 0.8
        margin:
            top: 1.2cm
            right: 1cm
            bottom: 1cm
            left: 1cm
    image:
        quality: 100
        fullPage: false
---

iOS DataModel
==

- Subject: DataModel
- Writer: JooHyun Park
- Date: 2024-08-28
- Version: v1.0.0

| Version          | Date       | History                 |
| ---------------- | ---------- | ------------------------|
| v1.0.0           | 2024-08-28 | Initial                 |


<div style="page-break-after: always;"></div>


# Contents
- [Models](#models)
    - [1. DIDDocument](#1-diddocument)
        - [1.1. VerificationMethod](#11-verificationmethod)
        - [1.2 Service](#12-service)
    - [2. VerifiableCredential](#2-verifiablecredential)
        - [2.1 Issuer](#21-issuer)
        - [2.2 DocumentVerificationEvidence](#22-documentverificationevidence)
        - [2.3 CredentialSchema](#23-credentialschema)
        - [2.4 CredentialSubject](#24-credentialsubject)
        - [2.5 Claim](#25-claim)
        - [2.6 Internationalization](#26-internationalization)
    - [3. VerifiablePresentation](#3-verifiablepresentation)
    - [4. Proof](#4-proof)
        - [4.1 VCProof](#41-vcproof)
    - [5. Profile](#5-profile)
        - [5.1. IssuerProfile](#51-issuerprofile)
            - [5.1.1. Profle](#511-profile)
                - [5.1.1.1. CredentialSchema](#5111-credentialschema)
                - [5.1.1.2. Process](#5112-process)
        - [5.2 VerifyProfile](#51-verifyprofile)
            - [5.2.1. Profile](#521-profile)
                - [5.2.1.1. ProfileFilter](#5211-profilefilter)
                    - [5.2.1.1.1. CredentialSchema](#52111-credentialschema)
                - [5.2.1.2. Process](#5212-process)
        - [5.3. LogoImage](#53-logoimage)
        - [5.4. ProviderDetail](#54-providerdetail)
        - [5.5. ReqE2e](#55-reqe2e)
    - [6. VCSchema](#6-vcschema)
        - [6.1. VCMetadata](#61-vcmetadata)
        - [6.2. CredentialSubject](#62-credentialsubject)
            - [6.2.1. Claim](#621-claim)
                - [6.2.1.1. Namespace](#6211-namespace)
                - [6.2.1.2. ClaimDef](#6212-claimdef)
- [OptionSet](#optionset)
    - [1. VerifyAuthType](#1-verifyauthtype)
- [Enumerators](#enumerators)
    - [1. DIDKeyType](#1-didkeytype)
    - [2. DIDServiceType](#2-didservicetype)
    - [3. ProofPurpose](#3-proofpurpose)
    - [4. ProofType](#4-prooftype)
    - [5. AuthType](#5-authtype)
    - [6. Evidence](#6-evidence)
    - [7. Presence](#7-presence)
    - [8. EvidenceType](#8-evidencetype)
    - [9. ProfileType](#9-profiletype)
    - [10. LogoImageType](#10-logoimagetype)
    - [11. ClaimType](#11-claimtype)
    - [12. ClaimFormat](#12-claimformat)
    - [13. Location](#13-location)
    - [14. SymmetricPaddingType](#14-symmetricpaddingtype)
    - [15. SymmetricCipherType](#15-symmetricciphertype)
    - [16. AlgorithmType](#16-algorithmtype)
    - [17. CredentialSchemaType](#17-credentialschematype)
    - [18. EllipticCurveType](#18-ellipticcurvetype)
- [Protocols](#protocols)
    - [1. Jsonable](#1-jsonable)
    - [2. ProofProtocol](#2-proofprotocol)
        - [2.1. ProofContainer](#21-proofcontainer)
    - [2.2. ProofsContainer](#22-proofscontainer)
    - [3. ConvertibleToAlgorithmType](#3-convertibletoalgorithmtype)
    - [4. ConvertibleFromAlgorithmType](#4-convertiblefromalgorithmtype)
    - [5. AlgorithmTypeConvertible](#5-algorithmtypeconvertible)
- [Property Wrapper](#property-wrapper)
    - [1. @UTCDatetime](#1-utcdatetime)
    - [2. @DIDVersionId](#2-didversionid)

# Models

## 1. DIDDocument

### Description

`Document for Decentralized Identifiers`

### Declaration

```swift
// Declaration in Swift
public struct DIDDocument : Jsonable, ProofsContainer
{
    public var context              : [String]
    public var id                   : String
    public var controller           : String
    public var verificationMethod   : [VerificationMethod]
    public var assertionMethod      : [String]?
    public var authentication       : [String]?
    public var keyAgreement         : [String]?
    public var capabilityInvocation : [String]?
    public var capabilityDelegation : [String]?
    public var service              : [Service]?
    @UTCDatetime  public var created   : String
    @UTCDatetime  public var updated   : String
    @DIDVersionId public var versionId : String
    public var deactivated          : Bool
    public var proof                : Proof?
    public var proofs               : [Proof]?
}
```

### Property

| Name                 | Type                 | Description                            | **M/O** | **Note**                    |
|----------------------|----------------------|----------------------------------------|---------|-----------------------------|
| context              | [String]             | JSON-LD context                        |    M    |   | 
| id                   | String               | DID owner's did                        |    M    |   | 
| controller           | String               | DID controller's did                   |    M    |   | 
| verificationMethod   | [VerificationMethod] | List of DID key with public key value  |    M    | [VerificationMethod](#11-verificationmethod) | 
| assertionMethod      | [String]             | List of Assertion key name             |    O    |   | 
| authentication       | [String]             | List of Authentication key name        |    O    |   | 
| keyAgreement         | [String]             | List of Key Agreement key name         |    O    |   | 
| capabilityInvocation | [String]             | List of Capability Invocation key name |    O    |   | 
| capabilityDelegation | [String]             | List of Capability Delegation key name |    O    |   | 
| service              | [Service]            | List of service                        |    O    |[Service](#12-service)  | 
| created              |  String              | Created datetime                       |    M    |[@UTCDatetime](#1-utcdatetime)| 
| updated              |  String              | Updated datetime                       |    M    | [@UTCDatetime](#1-utcdatetime)| 
| versionId            |  String              | DID version id                         |    M    | [@DIDVersionId](#2-didversionid) | 
| deactivated          |  Bool                | True: deactivated, False: activated    |    M    |   | 
| proof                |  Proof               | Owner proof                            |    O    |[Proof](#4-proof)| 
| proofs               |  [Proof]             | List of owner proof                    |    O    |[Proof](#4-proof)| 

<br>

## 1.1. VerificationMethod

### Description

`Sub Model / List of DID key with public key value`

### Declaration

```swift
// Declaration in Swift
public struct VerificationMethod : Jsonable
{
    public var id                  : String
    public var type                : DIDKeyType
    public var controller          : String
    public var publicKeyMultibase  : String
    public var authType            : AuthType
}
```

### Property

| Name               | Type       | Description                            | **M/O** | **Note**              |
|--------------------|------------|----------------------------------------|---------|-----------------------|
| id                 | String     | Key name                               |    M    |                       | 
| type               | DIDKeyType | Key type                               |    M    | [DIDKeyType](#1-didkeytype) | 
| controller         | String     | Key controller's did                   |    M    |                       | 
| publicKeyMultibase | String     | Public key value                       |    M    | Encoded by Multibase  | 
| authType           | AuthType   | Required authentication to use the key |    M    | [AuthType](#5-authtype) | 

<br>

## 1.2. Service

### Description

`Sub Model / List of service`

### Declaration

```swift
// Declaration in Swift
public struct Service : Jsonable
{
    public var id                  : String
    public var type                : DIDServiceType
    public var serviceEndpoint     : [String]
}
```

### Property

| Name            | Type           | Description                | **M/O** | **Note**                  |
|-----------------|----------------|----------------------------|---------|---------------------------|
| id              | String         | Service id                 |    M    |                           | 
| type            | DIDServiceType | Service type               |    M    | [DIDServiceType](#2-didservicetype)| 
| serviceEndpoint | [String]       | List of URL to the service |    M    |                           | 

<br>

## 2. VerifiableCredential

### Description

`Decentralized digital certificate, hereafter VC`

### Declaration

```swift
// Declaration in Swift
public struct VerifiableCredential : Jsonable, Identifiable
{
    public var context           : [String]
    public var id                : String
    public var type              : [String]
    public var issuer            : Issuer
    public var issuanceDate      : String
    @UTCDatetime public var validFrom         : String
    @UTCDatetime public var validUntil        : String
    public var encoding          : String
    public var formatVersion     : String
    public var language          : String
    public var evidence          : [Evidence]
    public var credentialSchema  : CredentialSchema
    public var credentialSubject : CredentialSubject
    public var proof             : VCProof
}
```

### Property

| Name              | Type              | Description                      | **M/O** | **Note**                    |
|-------------------|-------------------|----------------------------------|---------|-----------------------------|
| context           | [String]          | JSON-LD context                  |    M    |                             |
| id                | String            | VC id                            |    M    |                             |
| type              | [String]          | List of VC type                  |    M    |                             |
| issuer            | Issuer            | Issuer Information               |    M    | [Issuer](#21-issuer)         |
| issuanceDate      | String            | Issuance datetime                |    M    |                             |
| validFrom         | String            | This VC valid from the datetime  |    M    |                             |
| validUntil        | String            | This VC valid until the datetime |    M    |                             |
| encoding          | String            | VC encoding type                 |    M    | Default(UTF-8)              |
| formatVersion     | String            | VC format version                |    M    |                             |
| language          | String            | VC language code                 |    M    |                             |
| evidence          | [Evidence]        | Evidence                         |    M    | [Evidence](#6-evidence) <br> [DocumentVerificationEvidence](#22-documentverificationevidence) |
| credentialSchema  | CredentialSchema  | Credential schema                |    M    | [CredentialSchema](#23-credentialschema)                            |
| credentialSubject | CredentialSubject | Credential subject               |    M    | [CredentialSubject](#24-credentialsubject)                            |
| proof             | VCProof           | Issuer proof                     |    M    | [VCProof](#41-vcproof)                            |

<br>

## 2.1 Issuer

## Description

`Issuer information`

## Declaration

```swift
// Declaration in Swift
public struct Issuer : Jsonable
{
    public var id        : String
    public var name      : String?
    public var certVcRef : String?
}
```

## Property

| Name      | Type   | Description                       | **M/O** | **Note**                 |
|-----------|--------|-----------------------------------|---------|--------------------------|
| id        | String | Issuer's DID                      |    M    |                          |
| name      | String | Issuer's name                     |    O    |                          |
| certVcRef | String | URL for certificate of membership |    O    |                          |

<br>

## 2.2 DocumentVerificationEvidence

## Description

`Document verification for Evidence`

## Declaration

```swift
// Declaration in Swift
public struct DocumentVerificationEvidence : Jsonable
{
    public var id       : String?
    public var type     : EvidenceType
    public var verifier : String

    public var evidenceDocument : String
    public var subjectPresence  : Presence
    public var documentPresence : Presence
}
```

## Property

| Name             | Type         | Description                      | **M/O** | **Note**                 |
|------------------|--------------|----------------------------------|---------|--------------------------|
| id               | String       | URL for the evidence information |    O    |                          |
| type             | EvidenceType | Evidence type                    |    M    | [EvidenceType](#8-evidencetype) |
| verifier         | String       | Evidence verifier                |    M    |                          |
| evidenceDocument | String       | Name of Evidence document        |    M    |                          |
| subjectPresence  | Presence     | Subject presence type            |    M    | [Presence](#7-presence)        |
| documentPresence | Presence     | Document presence type           |    M    | [Presence](#7-presence)   |

<br>

## 2.3 CredentialSchema

## Description

`Credential schema`

## Declaration

```swift
// Declaration in Swift
public struct CredentialSchema : Jsonable
{
    public var id   : String
    public var type : CredentialSchemaType
}
```

## Property

| Name      | Type                 | Description           | **M/O** | **Note**                 |
|-----------|----------------------|-----------------------|---------|--------------------------|
| id        | String               | URL for VC schema     |    M    |                          |
| type      | CredentialSchemaType | VC Schema format type |    M    |  [CredentialSchemaType](#17-credentialschematype)   |

<br>

## 2.4 CredentialSubject

## Description

`Credential subject`

## Declaration

```swift
// Declaration in Swift
public struct CredentialSubject : Jsonable
{
    public var id     : String
    public var claims : [Claim]
}
```

## Property

| Name      | Type    | Description   | **M/O** | **Note**                 |
|-----------|---------|---------------|---------|--------------------------|
| id        | String  | Subject DID   |    M    |                          |
| claims    | [Claim] | List of claim |    M    | [Claim](#25-claim)           |

<br>

## 2.5 Claim

## Description

`Information for Subject`

## Declaration

```swift
// Declaration in Swift
public struct Claim : Jsonable
{   
    public var code     : String
    public var caption  : String
    public var value    : String
    public var type     : ClaimType
    public var format   : ClaimFormat
    public var hideValue: Bool? //default(false)
    public var location : Location? //default(inline)
    public var digestSRI: String?
    public var i18n     : [String : Internationalization]?
}
```

## Property

| Name      | Type                         | Description                  | **M/O** | **Note**                 |
|-----------|------------------------------|------------------------------|---------|--------------------------|
| code      | String                       | Claim code                   |    M    |                          |
| caption   | String                       | Claim name                   |    M    |                          |
| value     | String                       | Claim value                  |    M    |                          |
| type      | ClaimType                    | Claim type                   |    M    | [ClaimType](#11-claimtype)         |
| format    | ClaimFormat                  | Claim format                 |    M    | [ClaimFormat](#12-claimformat)           |
| hideValue | Bool                         | Hide value                   |    O    | Default(false)           |
| location  | Location                     | Value Location               |    O    | Default(inline) <br> [Location](#13-location) |
| digestSRI | String                       | Digest Subresource Integrity |    O    |                          |
| i18n      |[String:Internationalization] | Internationalization         |    O    | Hash value of the value <br> [Internationalization](#26-internationalization) |

<br>

## 2.6 Internationalization

## Description

`Internationalization`

## Declaration

```swift
// Declaration in Swift
public struct Internationalization : Jsonable
{
    public var caption  : String
    public var value    : String?
    public var digestSRI: String?
}
```

## Property

| Name      | Type   | Description                  | **M/O** | **Note**                 |
|-----------|--------|------------------------------|---------|--------------------------|
| caption   | String | Claim name                   |    M    |                          |
| value     | String | Claim value                  |    O    |                          |
| digestSRI | String | Digest Subresource Integrity |    O    | Hash value of the value  |

<br>

## 3. VerifiablePresentation

### Description

`A List of VCs signed with subject signatures, hereafter VP`

### Declaration

```swift
// Declaration in Swift
public struct VerifiablePresentation : Jsonable, ProofsContainer, Identifiable
{
    public var context              : [String]
    public var id                   : String
    public var type                 : [String]
    public var holder               : String
    @UTCDatetime public var validFrom  : String
    @UTCDatetime public var validUntil : String
    public var verifierNonce        : String
    public var verifiableCredential : [VerifiableCredential]
    public var proof                : Proof?
    public var proofs               : [Proof]?
}
```

### Property

| Name                 | Type                   | Description                      | **M/O** | **Note**                 |
|----------------------|------------------------|----------------------------------|---------|--------------------------|
| context              | [String]               | JSON-LD context                  |    M    |                          |
| id                   | String                 | VP ID                            |    M    |                          |
| type                 | [String]               | List of VP type                  |    M    |                          |
| holder               | String                 | Holder DID                       |    M    |                          |
| validFrom            | String                 | This VP valid from the datetime  |    M    |                          |
| validUntil           | String                 | This VP valid until the datetime |    M    |                          |
| verifierNonce        | String                 | Verifier nonce                   |    M    |                          |
| verifiableCredential | [VerifiableCredential] | List of VC                       |    M    | [VerifiableCredential](#2-verifiablecredential)   |
| proof                | Proof                  | Owner proof                      |    O    | [Proof](#4-proof) | 
| proofs               | [Proof]                | List of owner proof              |    O    | [Proof](#4-proof)    | 

<br>

## 4. Proof

### Description

`Owner proof`

### Declaration

```swift
// Declaration in Swift
public struct Proof : ProofProtocol
{
    @UTCDatetime public var created: String
    public var proofPurpose: ProofPurpose
    public var verificationMethod: String
    public var type: ProofType
    public var proofValue: String?
}
```

### Property

| Name               | Type         | Description                      | **M/O** | **Note**                 |
|--------------------|--------------|----------------------------------|---------|--------------------------|
| created            | String       | Created datetime                 |    M    | [@UTCDatetime](#1-utcdatetime)   | 
| proofPurpose       | ProofPurpose | Proof purpose                    |    M    | [ProofPurpose](#3-proofpurpose) | 
| verificationMethod | String       | Key URL used for Proof Signature |    M    |                          | 
| type               | ProofType    | Proof type                       |    M    | [ProofType](#4-prooftype)   |
| proofValue         | String       | Signature value                  |    O    |                          |

<br>

## 4.1 VCProof

### Description

`Issuer proof`

### Declaration

```swift
// Declaration in Swift
public struct Service : Jsonable
{
public struct VCProof : ProofProtocol, Jsonable
{
    @UTCDatetime public var created: String
    public var proofPurpose: ProofPurpose
    public var verificationMethod: String
    public var type: ProofType
    public var proofValue: String?
    public var proofValueList: [String]?
}
```

### Property

| Name               | Type         | Description                      | **M/O** | **Note**                 |
|--------------------|--------------|----------------------------------|---------|--------------------------|
| created            | String       | Created datetime                 |    M    | [@UTCDatetime](#1-utcdatetime)             | 
| proofPurpose       | ProofPurpose | Proof purpose                    |    M    | [ProofPurpose](#3-proofpurpose)  | 
| verificationMethod | String       | Key URL used for Proof Signature |    M    |                          | 
| type               | ProofType    | Proof type                       |    M    | [ProofType](#4-prooftype)   |
| proofValue         | String       | Signature value                  |    O    |                          |
| proofValueList     | [String]     | Signature value List             |    O    |                          |

<br>

## 5. Profile

## 5.1 IssuerProfile

### Description

`Issuer Profile`

### Declaration

```swift
// Declaration in Swift
public struct IssueProfile : Jsonable, ProofContainer
{
    public var id : String
    public var type : ProfileType
    public var title : String
    public var description : String?
    public var logo : LogoImage?
    public var encoding : String
    public var language : String
    public var profile : Profile
    public var proof : Proof?
}
```

### Property

| Name        | Type        | Description           | **M/O** | **Note**                 |
|-------------|-------------|-----------------------|---------|--------------------------|
| id          | String      | Profile ID            |    M    |                          |
| type        | ProfileType | Profile type          |    M    | [ProfileType](#9-profiletype)    |
| title       | String      | Profile title         |    M    |                          |
| description | String      | Profile description   |    O    |                          |
| logo        | LogoImage   | Logo image            |    O    | [LogoImage](#53-logoimage)         |
| encoding    | String      | Profile encoding type |    M    |                          |
| language    | String      | Profile language code |    M    |                          |
| profile     | Profile     | Profile contents      |    M    | [Profle](#511-profile)           |
| proof       | Proof       | Owner proof           |    O    | [Proof](#4-proof)      |

<br>

## 5.1.1 Profile

### Description

`Profile contents`

### Declaration

```swift
// Declaration in Swift
public struct Profile : Jsonable
{
    public var issuer : ProviderDetail
    public var credentialSchema : CredentialSchema
    public var process : Process
}
```

### Property

| Name             | Type             | Description           | **M/O** | **Note**                 |
|------------------|------------------|-----------------------|---------|--------------------------|
| issuer           | ProviderDetail   | Issuer information    |    M    | [ProviderDetail](#54-providerdetail)   |
| credentialSchema | CredentialSchema | VC schema information |    M    | [CredentialSchema](#5111-credentialschema)          |
| process          | Process          | Issuing process       |    M    |  [Process](#5112-process)     |

<br>

## 5.1.1.1 CredentialSchema

### Description

`VC schema information`

### Declaration

```swift
// Declaration in Swift
public struct CredentialSchema : Jsonable
{
    public var id : String
    public var type : CredentialSchemaType
    public var value : String?
}
```

### Property

| Name  | Type                 | Description           | **M/O** | **Note**                 |
|-------|----------------------|-----------------------|---------|--------------------------|
| id    | String               | URL for VC schema     |    M    |                          |
| type  | CredentialSchemaType | VC schema format type |    M    | [CredentialSchemaType](#17-credentialschematype)      |
| value | String               | VC schema             |    O    | Encoded by Multibase     |

<br>

## 5.1.1.2 Process

### Description

`Issuing process`

### Declaration

```swift
// Declaration in Swift
public struct Process : Jsonable
{
    public var endpoints : [String]
    public var reqE2e :  ReqE2e
    public var issuerNonce : String
}
```

### Property

| Name        | Type     | Description         | **M/O** | **Note**                 |
|-------------|----------|---------------------|---------|--------------------------|
| endpoints   | [String] | List of endpoint    |    M    |                          |
| reqE2e      | ReqE2e   | Request information |    M    | Proof not included <br> [ReqE2e](#55-reqe2e)     |
| issuerNonce | String   | Issuer nonce        |    M    |                          |

<br>

## 5.2 VerifyProfile

### Description

`Verify Profile`

### Declaration

```swift
// Declaration in Swift
public struct VerifyProfile : Jsonable, ProofContainer
{
    public var id : String
    public var type : ProfileType
    public var title : String
    public var description : String?
    public var logo : LogoImage?
    public var encoding : String
    public var language : String
    public var profile : Profile
    public var proof : Proof?
}
```

### Property

| Name        | Type        | Description           | **M/O** | **Note**                 |
|-------------|-------------|-----------------------|---------|--------------------------|
| id          | String      | Profile ID            |    M    |                          |
| type        | ProfileType | Profile type          |    M    | [ProfileType](#9-profiletype)         |
| title       | String      | Profile title         |    M    |                          |
| description | String      | Profile description   |    O    |                          |
| logo        | LogoImage   | Logo image            |    O    |  [LogoImage](#53-logoimage)        |
| encoding    | String      | Profile encoding type |    M    |                          |
| language    | String      | Profile language code |    M    |                          |
| profile     | Profile     | Profile contents      |    M    | [Profile](#521-profile)      |
| proof       | Proof       | Owner proof           |    O    | [Proof](#4-proof)       |

<br>

## 5.2.1 Profile

### Description

`Profile contents`

### Declaration

```swift
// Declaration in Swift
public struct Profile : Jsonable
{    
    public var verifier : ProviderDetail
    public var filter : ProfileFilter
    public var process : Process
}
```

### Property

| Name     | Type           | Description                | **M/O** | **Note**                 |
|----------|----------------|----------------------------|---------|--------------------------|
| verifier | ProviderDetail | Verifier information       |    M    |  [ProviderDetail](#54-providerdetail)       |
| filter   | ProfileFilter  | Filtering for presentation |    M    | [ProfileFilter](#5211-profilefilter)          |
| process  | Process        | Method for VP presentation |    M    |[Process](#5212-process)       |

<br>

## 5.2.1.1 ProfileFilter

### Description

`Filtering for presentation`

### Declaration

```swift
// Declaration in Swift
public struct ProfileFilter : Jsonable
{
    public var credentialSchemas : [CredentialSchema]
}
```

### Property

| Name              | Type               | Description                                | **M/O** | **Note**                 |
|-------------------|--------------------|--------------------------------------------|---------|--------------------------|
| credentialSchemas | [CredentialSchema] | Presentable claim and issuer  per VC schema|    M    | [CredentialSchema](#52111-credentialschema)      |

<br>

## 5.2.1.1.1 CredentialSchema

### Description

`Presentable claim and issuer  per VC schema`

### Declaration

```swift
// Declaration in Swift
public struct CredentialSchema : Jsonable
{
    public var id : String
    public var type : CredentialSchemaType
    public var value : String?
    public var displayClaims : [String]?
    public var requiredClaims : [String]?
    public var allowedIssuers : [String]?
}
```

### Property

| Name           | Type                 | Description           | **M/O** | **Note**                 |
|----------------|----------------------|-----------------------|---------|--------------------------|
| id             | String               | URL for VC schema     |    M    |                          |
| type           | CredentialSchemaType | VC schema format type |    M    | [CredentialSchemaType](#17-credentialschematype)    |
| value          | String               | VC schema             |    O    | Encoded by Multibase     |
| displayClaims  | [String]             | Display claims        |    O    |                          |
| requiredClaims | [String]             | Required claims       |    O    |                          |
| allowedIssuers | [String]             | List of allowed issuers' DID  |    O    |                          |

<br>

## 5.2.1.2 Process

### Description

`Method for VP presentation`

### Declaration

```swift
// Declaration in Swift
public struct Process : Jsonable
{
    public var endpoints : [String]?
    public var reqE2e :  ReqE2e
    public var verifierNonce : String
    public var authType : VerifyAuthType?
}
```

### Property

| Name          | Type           | Description                    | **M/O** | **Note**                 |
|---------------|----------------|--------------------------------|---------|--------------------------|
| endpoints     | [String]       | List of endpoint               |    O    |                          |
| reqE2e        | ReqE2e         | Request information            |    M    | Proof not included <br> [ReqE2e](#55-reqe2e)     |
| verifierNonce | String         | Verifier nonce                   |    M    |                          |
| authType      | VerifyAuthType | Indicate access method for Key |    O    | [VerifyAuthType](#1-verifyauthtype)   |

<br>

## 5.3. LogoImage

### Description

`Logo image`

### Declaration

```swift
// Declaration in Swift
public struct LogoImage : Jsonable
{
    public var format : LogoImageType
    public var link   : String?
    public var value  : String?
}
```

### Property

| Name   | Type          | Description         | **M/O** | **Note**                 |
|--------|---------------|---------------------|---------|--------------------------|
| format | LogoImageType | Image format        |    M    | [LogoImageType](#10-logoimagetype)     |
| link   | String        | URL for logo image  |    O    | Encoded by Multibase     |
| value  | String        | Image value         |    O    | Encoded by Multibase     |

<br>

## 5.4. ProviderDetail

### Description

`Provider detail information`

### Declaration

```swift
// Declaration in Swift
public struct ProviderDetail : Jsonable
{
    public var did : String
    public var certVcRef : String
    
    public var name : String
    public var description : String?
    public var logo : LogoImage?
    public var ref : String?
}
```

### Property

| Name        | Type      | Description                       | **M/O** | **Note**                 |
|-------------|-----------|-----------------------------------|---------|--------------------------|
| did         | String    | Provider DID                      |    M    |                          |
| certVcRef   | String    | URL for Certificate of membership |    M    |                          |
| name        | String    | Provider name                     |    M    |                          |
| description | String    | Provider description              |    O    |                          |
| logo        | LogoImage | Logo Image                        |    O    | [LogoImage](#53-logoimage)          |
| ref         | String    | URL for reference                 |    O    |                          |

<br>

## 5.5. ReqE2e

### Description

`End to end request data`

### Declaration

```swift
// Declaration in Swift
public struct ReqE2e : Jsonable, ProofContainer
{
    public var nonce : String
    public var curve : EllipticCurveType
    public var publicKey : String
    public var cipher : SymmetricCipherType
    public var padding : SymmetricPaddingType
    public var proof : Proof?
}
```

### Property

| Name      | Type      | Description                                   | **M/O** | **Note**                 |
|-----------|-----------|-----------------------------------------------|---------|--------------------------|
| nonce     | String               | Value for symmetric key creation   |    M    | Encoded by Multibase     |
| curve     | EllipticCurveType    | Elliptic curve type                |    M    | [EllipticCurveType](#18-ellipticcurvetype)   |
| publicKey | String               | Server's public key for encryption |    M    | Encoded by Multibase     |
| cipher    | SymmetricCipherType  | Cipher type                        |    M    | [SymmetricCipherType](#15-symmetricciphertype)  |
| padding   | SymmetricPaddingType | Padding type                       |    M    | [SymmetricPaddingType](#14-symmetricpaddingtype)   |
| proof     | Proof                | Key aggreement proof               |    O    | [Proof](#4-proof)    |

<br>

## 6. VCSchema

### Description

`VC schema`

### Declaration

```swift
// Declaration in Swift
public struct VCSchema : Jsonable
{   
    public var id                : String
    public var schema            : String
    public var title             : String
    public var description       : String
    public var metadata          : VCMetadata
    public var credentialSubject : CredentialSubject
}
```

### Property

| Name              | Type              | Description              | **M/O** | **Note**                 |
|-------------------|-------------------|--------------------------|---------|--------------------------|
| id                | String            | URL for VC schema        |    M    |                          |
| schema            | String            | URL for VC schema format |    M    |                          |
| title             | String            | VC schema name           |    M    |                          |
| description       | String            | VC schema decription     |    M    |                          |
| metadata          | VCMetadata        | VC metadata              |    M    |  [VCMetadata](#61-vcmetadata)   |
| credentialSubject | CredentialSubject | Credential subject       |    M    |  [CredentialSubject](#62-credentialsubject)   |

<br>

## 6.1. VCMetadata

### Description

`VC Metadata`

### Declaration

```swift
// Declaration in Swift
public struct VCMetadata : Jsonable
{
    public var language      : String
    public var formatVersion : String
}
```

### Property

| Name          | Type   | Description         | **M/O** | **Note**                 |
|---------------|--------|---------------------|---------|--------------------------|
| language      | String | VC default language |    M    |                          |
| formatVersion | String | VC format version   |    M    |                          |

<br>

## 6.2. CredentialSubject

### Description

`Credential Subject`

### Declaration

```swift
// Declaration in Swift
public struct CredentialSubject : Jsonable
{
    public var claims : [Claim]
}
```

### Property

| Name   | Type    | Description          | **M/O** | **Note**                 |
|--------|---------|----------------------|---------|--------------------------|
| claims | [Claim] | Claim per namespace  |    M    | [Claim](#621-claim)                         |

<br>

## 6.2.1. Claim

### Description

`Claim`

### Declaration

```swift
// Declaration in Swift
public struct Claim : Jsonable
{
   public var namespace : Namespace
   public var items     : [ClaimDef]
}

```

### Property

| Name      | Type       | Description              | **M/O** | **Note**                 |
|-----------|------------|--------------------------|---------|--------------------------|
| namespace | Namespace  | Claim namespace          |    M    |  [Namespace](#6211-namespace)      |
| items     | [ClaimDef] | List of Claim definition |    M    | [ClaimDef](#6212-claimdef)  |

<br>

## 6.2.1.1. Namespace

### Description

`Claim namespace`

### Declaration

```swift
// Declaration in Swift
public struct Namespace : Jsonable
{
    public var id   : String
    public var name : String
    public var ref  : String?
    
}
```

### Property

| Name | Type   | Description                   | **M/O** | **Note**                 |
|------|--------|-------------------------------|---------|--------------------------|
| id   | String | Claim namespace               |    M    |                          |
| name | String | Namespace name                |    M    |                          |
| ref  | String | URL for namespace information |    O    |                          |

<br>

## 6.2.1.2. ClaimDef

### Description

`Claim Definition`

### Declaration

```swift
// Declaration in Swift

public struct ClaimDef : Jsonable
{
    public var id          : String
    public var caption     : String
    public var type        : ClaimType
    public var format      : ClaimFormat
    public var hideValue   : Bool? // default(false)
    public var location    : Location? // default(inline)
    public var required    : Bool? // default(true)
    public var description : String? //default("")
    public var i18n        : [String : String]?
}
```

### Property

| Name        | Type            | Description          | **M/O** | **Note**                 |
|-------------|-----------------|----------------------|---------|--------------------------|
| id          | String          | Claim identifier     |    M    |                          |
| caption     | String          | Claim name           |    M    |                          |
| type        | ClaimType       | Claim type           |    M    | [ClaimType](#11-claimtype)         |
| format      | ClaimFormat     | Claim format         |    M    |  [ClaimFormat](#12-claimformat)       |
| hideValue   | Bool            | Hide value           |    O    | Default(false)           |
| location    | Location        | Value Location       |    O    | Default(inline) <br> [Location](#13-location)        |
| required    | Bool            | Requirement          |    O    | Default(true)            |
| description | String          | Claim description    |    O    | Default("")              |
| i18n        | [String:String] | Internationalization |    O    |                          |

<br>

# OptionSet
## 1. VerifyAuthType

### Description

`Indicate access method for Key and presentation option. Similar to AuthType`

### Declaration

```cpp
public struct VerifyAuthType : OptionSet, Sequence, Codable
{
    public let rawValue: Int
    
    public static let free = VerifyAuthType(rawValue: 1 << 0)
    public static let pin  = VerifyAuthType(rawValue: 1 << 1)
    public static let bio  = VerifyAuthType(rawValue: 1 << 2)
    
    public static let and  = VerifyAuthType(rawValue: 1 << 15)
}
```

<br>

# Enumerators

## 1. DIDKeyType

### Description

`DID key type`

### Declaration

```swift
// Declaration in Swift
public enum DIDKeyType : String, Codable, AlgorithmTypeConvertible
{
    public static var commonString: String
    {
        "VerificationKey2018"
    }
   
    case rsaVerificationKey2018        = "RsaVerificationKey2018"
    case secp256k1VerificationKey2018  = "Secp256k1VerificationKey2018"
    case secp256r1VerificationKey2018  = "Secp256r1VerificationKey2018"
}
```

<br>

## 2. DIDServiceType

### Description

`Service type`

### Declaration

```swift
// Declaration in Swift
public enum DIDServiceType : String, Codable
{
    case linkedDomains      = "LinkedDomains"
    case credentialRegistry = "CredentialRegistry"
}
```

<br>

## 3. ProofPurpose

### Description

`Proof purpose`

### Declaration

```swift
public enum ProofPurpose : String, Codable
{
    case assertionMethod      = "assertionMethod"
    case authentication       = "authentication"
    case keyAgreement         = "keyAgreement"
    case capabilityInvocation = "capabilityInvocation"
    case capabilityDelegation = "capabilityDelegation"
}
```

<br>

## 4. ProofType

### Description

`Proof type`

### Declaration

```swift
public enum ProofType : String, Codable, AlgorithmTypeConvertible
{
    public static var commonString: String
    {
        "Signature2018"
    }
    
    case rsaSignature2018       = "RsaSignature2018"
    case secp256k1Signature2018 = "Secp256k1Signature2018"
    case secp256r1Signature2018 = "Secp256r1Signature2018"
}
```

<br>

## 5. AuthType

### Description

`Indicate access method for Key`

### Declaration

```swift
// Declaration in Swift
public enum AuthType : Int, Codable
{
    case free = 1
    case pin  = 2
    case bio  = 4
}
```

<br>

## 6. Evidence

### Description

`Evidence Enumerator for Multitype array`

### Declaration

```swift
// Declaration in Swift
public enum Evidence
{
    case documentVerification(DocumentVerificationEvidence)
}
```

<br>

## 7. Presence

### Description

`Presence type`

### Declaration

```swift
// Declaration in Swift
public enum Presence : String, Codable
{
    case physical = "Physical"
    case digital  = "Digital"
}
```

<br>

## 8. EvidenceType

### Description

`Evidence type`

### Declaration

```swift
// Declaration in Swift
public enum EvidenceType : String, Codable
{
    case documentVerification = "DocumentVerification"
}
```

<br>

## 9. ProfileType

### Description

`Profile type`

### Declaration

```swift
// Declaration in Swift
public enum ProfileType : String, Codable
{
    case IssueProfile
    case VerifyProfile
}
```

<br>

## 10. LogoImageType

### Description

`Logo image type`

### Declaration

```swift
// Declaration in Swift
public enum LogoImageType : String, Codable
{
    case jpg
    case png
}
```

<br>

## 11. ClaimType

### Description

`Claim type`

### Declaration

```swift
// Declaration in Swift
public enum ClaimType : String, Codable
{
    case text
    case image
    case document
}
```

<br>

## 12. ClaimFormat

### Description

`Claim format`

### Declaration

```swift
// Declaration in Swift
public enum ClaimFormat : String, Codable
{
    //text
    case plain
    case html
    case xml
    case csv
    //image
    case png
    case jpg
    case gif
    //document
    case txt
    case pdf
    case word
}
```

<br>

## 13. Location

### Description

`Value Location`

### Declaration

```swift
// Declaration in Swift
public enum Location : String, Codable
{
    case inline
    case remote
    case attach
}
```

<br>

## 14. SymmetricPaddingType

### Description

`Symmetric padding type`

### Declaration

```swift
// Declaration in Swift
public enum SymmetricPaddingType : String , Codable
{
    case noPad = "NOPAD"
    case pkcs5 = "PKCS5"
}
```

<br>

## 15. SymmetricCipherType

### Description

`Symmetric cipher type`

### Declaration

```swift
// Declaration in Swift
public enum SymmetricCipherType : String, Codable
{
    case aes128CBC = "AES-128-CBC"
    case aes128ECB = "AES-128-ECB"
    case aes256CBC = "AES-256-CBC"
    case aes256ECB = "AES-256-ECB"
}
```

<br>

## 16. AlgorithmType

### Description

`Algorithm type`

### Declaration

```swift
// Declaration in Swift
public enum AlgorithmType : String, Codable
{
    case rsa       = "Rsa"
    case secp256k1 = "Secp256k1"
    case secp256r1 = "Secp256r1"
}
```

<br>

## 17. CredentialSchemaType

### Description

`Credential schema type`

### Declaration

```swift
// Declaration in Swift
public enum CredentialSchemaType : String, Codable
{
    case osdSchemaCredential = "OsdSchemaCredential"
}
```

<br>

## 18. EllipticCurveType

### Description

`Elliptic curve type`

### Declaration

```swift
// Declaration in Swift
public enum EllipticCurveType: String, Codable, ConvertibleToAlgorithmType
{
    public static var commonString: String
    {
        emptyString
    }
    
    case secp256k1 = "Secp256k1"
    case secp256r1 = "Secp256r1"
}
```

<br>

# Protocols

## 1. Jsonable

### Description

`Model to Json, and vice versa`

### Declaration

```swift
// Declaration in Swift
public protocol Jsonable : Codable
{
    init(from jsonData: Data) throws
    init(from jsonString: String) throws
    func toJsonData(isPretty: Bool) throws -> Data
    func toJson(isPretty: Bool) throws -> String
}
```

<br>

## 2. ProofProtocol

### Description

`General proof protocol`

### Declaration

```swift
// Declaration in Swift
public protocol ProofProtocol : Jsonable
{
    var created : String { get set }
    var verificationMethod : String { get set }
    var proofPurpose : ProofPurpose { get set }
    var type : ProofType? { get set }
    var proofValue : String? { get set }
}
```

<br>

## 2.1. ProofContainer

### Description

`Protocol contains proof`

### Declaration

```swift
// Declaration in Swift
public protocol ProofContainer : Jsonable
{
    var proof : Proof? { get set }
}
```

<br>

## 2.2. ProofsContainer

### Description

`Protocol contains multi proofs`

### Declaration

```swift
// Declaration in Swift
public protocol ProofsContainer : Jsonable
{
    var proof  : Proof? { get set }
    var proofs : [Proof]? { get set }
}
```

<br>

## 3. ConvertibleToAlgorithmType

### Description

`Convertible to AlgorithmType protocol`

### Declaration

```swift
// Declaration in Swift
public protocol ConvertibleToAlgorithmType : RawRepresentable where RawValue == String
{
    static var commonString : String { get }
    /// Convert to AlgorithmType
    ///
    /// - Returns: AlgorithmType
    func convertTo() -> AlgorithmType
}
```

<br>

## 4. ConvertibleFromAlgorithmType

### Description

`Convertible from AlgorithmType protocol`

### Declaration

```swift
// Declaration in Swift
public protocol ConvertibleFromAlgorithmType : RawRepresentable where RawValue == String
{
    static var commonString : String { get }
    
    /// Convert from AlgorithmType
    ///
    /// - Parameters:
    ///   - algorithmType: AlgorithmType value
    /// - Returns: Self type value
    static func convertFrom(algorithmType : AlgorithmType) -> Self
}
```

<br>

## 5. AlgorithmTypeConvertible

### Description

`Convertible from AlgorithmType protocol, and vice versa`

### Declaration

```swift
// Declaration in Swift
public typealias AlgorithmTypeConvertible = ConvertibleToAlgorithmType & ConvertibleFromAlgorithmType
```

<br>

# Property Wrapper

## 1. @UTCDatetime

### Description

`TBD`

### Declaration

```swift
// Declaration in Swift
@UTCDatetime
```

<br>

## 2. @DIDVersionId

### Description

`TBD`

### Declaration

```swift
// Declaration in Swift
@DIDVersionId
```
