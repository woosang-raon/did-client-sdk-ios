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

@frozen public enum PredicateType : String, Codable
{
    case GE//>=
    case LE//<=
    case GT//>
    case LT//<
}

public struct ProofRequest : Jsonable
{
    public let nonRevoked : [String : String]
    public let name : String
//    public let version : String
    public let nonce : BigIntString
    public let requestedAttributes : [String : AttributeInfo]?
    public let requestedPredicates : [String : PredicateInfo]?
    
    enum CodingKeys: String, CodingKey {
        case nonRevoked
        case name
//        case version
        case nonce
        case requestedAttributes = "requested_attributes"
        case requestedPredicates = "requested_predicates"
    }
}

public struct AttributeInfo: Jsonable
{
    public let name: String
    public let restrictions : [[String : String]]
}

public struct PredicateInfo: Jsonable
{
    public let name: String
    public let pType : PredicateType
    public let pValue : Int
    public let restrictions : [[String : String]]
    
    enum CodingKeys: String, CodingKey {
        case name
        case pType = "p_type"
        case pValue = "p_value"
        case restrictions
    }
}


