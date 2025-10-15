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

public struct ZKPCredentialRequest : Jsonable
{
    public let proverDID: String
    public let credDefId: String
    public let nonce    : BigIntString
    public let blindedMs : BlindedCredentialSecrets
    public let blindedMsCorrectnessProof : BlindedCredentialSecretsCorrectnessProof
    
    enum CodingKeys: String, CodingKey {
        case proverDID = "prover_did"
        case credDefId = "cred_def_id"
        case nonce
        case blindedMs = "blinded_ms"
        case blindedMsCorrectnessProof = "blinded_ms_correctness_proof"
    }
}

public struct BlindedCredentialSecrets: Jsonable
{
    public let u : BigIntString
    public let hiddenAttributes : [String]
    public let committedAttrs : [String : String] = [:]
    
    enum CodingKeys: String, CodingKey {
        case u
        case hiddenAttributes = "hidden_attributes"
        case committedAttrs = "committed_attrs"
    }
}

public struct BlindedCredentialSecretsCorrectnessProof : Jsonable
{
    public let c : BigIntString
    public let vDashCap : BigIntString
    public var mCaps : BigIntStringDictionary
    public var rCaps : [String : String] = [:]
    
    enum CodingKeys: String, CodingKey {
        case c
        case vDashCap = "v_dash_cap"
        case mCaps = "m_caps"
        case rCaps = "r_caps"
    }
}
