//
//  M_DocumentDetail.swift
//  TharTrack
//
//  Created by Esoft on 04/11/19.
//  Copyright © 2019 Esoft. All rights reserved.
//

import Foundation
struct M_DocumentDetail : Codable {
    let createdBy : String?
    let createdDate : String?
    let modifiedBy : String?
    let modifiedDate : String?
    let isDeleted : Bool?
    let ipAddress : String?
    let modifiedByName : String?
    let documentId : Int?
    let documentName : String?
    let documentDesc : String?
    let documentSource : String?
    let visibleToCustomer : Bool?
    let isMandatory : Bool?
    let documentType : M_DocumentType?
    let inUse : String?
    
    enum CodingKeys: String, CodingKey {
        
        case createdBy = "createdBy"
        case createdDate = "createdDate"
        case modifiedBy = "modifiedBy"
        case modifiedDate = "modifiedDate"
        case isDeleted = "isDeleted"
        case ipAddress = "ipAddress"
        case modifiedByName = "modifiedByName"
        case documentId = "documentId"
        case documentName = "documentName"
        case documentDesc = "documentDesc"
        case documentSource = "documentSource"
        case visibleToCustomer = "visibleToCustomer"
        case isMandatory = "isMandatory"
        case documentType = "documentType"
        case inUse = "inUse"
    }
    
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        createdBy = try values.decodeIfPresent(String.self, forKey: .createdBy)
        createdDate = try values.decodeIfPresent(String.self, forKey: .createdDate)
        modifiedBy = try values.decodeIfPresent(String.self, forKey: .modifiedBy)
        modifiedDate = try values.decodeIfPresent(String.self, forKey: .modifiedDate)
        isDeleted = try values.decodeIfPresent(Bool.self, forKey: .isDeleted)
        ipAddress = try values.decodeIfPresent(String.self, forKey: .ipAddress)
        modifiedByName = try values.decodeIfPresent(String.self, forKey: .modifiedByName)
        documentId = try values.decodeIfPresent(Int.self, forKey: .documentId)
        documentName = try values.decodeIfPresent(String.self, forKey: .documentName)
        documentDesc = try values.decodeIfPresent(String.self, forKey: .documentDesc)
        documentSource = try values.decodeIfPresent(String.self, forKey: .documentSource)
        visibleToCustomer = try values.decodeIfPresent(Bool.self, forKey: .visibleToCustomer)
        isMandatory = try values.decodeIfPresent(Bool.self, forKey: .isMandatory)
        documentType = try values.decodeIfPresent(M_DocumentType.self, forKey: .documentType)
        inUse = try values.decodeIfPresent(String.self, forKey: .inUse)
    }
    
}
