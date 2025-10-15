//
/*
 * Copyright 2025 OmniOne.
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *      http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */
    
import Foundation

public struct ZKPCredential : Jsonable
{
    public let credentialId              : String
    public let schemaId                  : String
    public let credDefId                 : String
    public let values                    : [String : AttributeValue]
    public var signature                 : CredentialSignature
    public let signatureCorrectnessProof : SignatureCorrectnessProof
    
    enum CodingKeys: String, CodingKey {
        case credentialId
        case schemaId = "schema_id"
        case credDefId = "cred_def_id"
        case values
        case signature
        case signatureCorrectnessProof = "signature_correctness_proof"
    }
    
    public struct CredentialSignature : Jsonable
    {
        public var pCredential : PrimaryCredentialSignature
        
        enum CodingKeys: String, CodingKey {
            case pCredential = "p_credential"
        }
        
        public struct PrimaryCredentialSignature : Jsonable
        {
            public let a : BigIntString
            public let e : BigIntString
            public let m2 : BigIntString
            public let q : BigIntString
            public var v : BigIntString
        }
    }
    
    public struct SignatureCorrectnessProof : Jsonable
    {
        public let se : BigIntString
        public let c  : BigIntString
    }
    
    public init(mdlZKPVCJson: String) throws {
        let jsonData = mdlZKPVCJson.data(using: .utf8)!
        guard let jsonObject: [String : Any] = try JSONSerialization.jsonObject(with: jsonData) as? [String : Any],
              let credentialId: String = jsonObject["credentialId"] as? String,
              var credentialObject: [String : Any] = jsonObject["credential"] as? [String : Any] else {
            throw DecodingError.dataCorrupted(DecodingError.Context(codingPath: [], debugDescription: "Invalid JSON format"))
        }
        
        credentialObject["credentialId"] = credentialId
        
        self = try JSONDecoder().decode(ZKPCredential.self, from: JSONSerialization.data(withJSONObject: credentialObject, options: []))
    }
}





