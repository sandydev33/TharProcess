//
//  OnHoldValue.swift
//  TharTrack
//
//  Created by Esoft on 05/11/19.
//  Copyright © 2019 Esoft. All rights reserved.
//

import Foundation
struct OnHoldValue : Codable {
    let comment : String?
    let companyId : Int?
    let docCheckId : [Int]?
    let documentId : Int?
    let filePath : String?
    let isCheck : Bool?
    let isDocumentUploaded : Bool?
    let poDocumentId : Int?
    let poId : Int?
    let reason : String?
    
    enum CodingKeys: String, CodingKey {
        
        case comment = "comment"
        case companyId = "companyId"
        case docCheckId = "docCheckId"
        case documentId = "documentId"
        case filePath = "filePath"
        case isCheck = "isCheck"
        case isDocumentUploaded = "isDocumentUploaded"
        case poDocumentId = "poDocumentId"
        case poId = "poId"
        case reason = "reason"
    }
    
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        comment = try values.decodeIfPresent(String.self, forKey: .comment)
        companyId = try values.decodeIfPresent(Int.self, forKey: .companyId)
        docCheckId = try values.decodeIfPresent([Int].self, forKey: .docCheckId)
        documentId = try values.decodeIfPresent(Int.self, forKey: .documentId)
        filePath = try values.decodeIfPresent(String.self, forKey: .filePath)
        isCheck = try values.decodeIfPresent(Bool.self, forKey: .isCheck)
        isDocumentUploaded = try values.decodeIfPresent(Bool.self, forKey: .isDocumentUploaded)
        poDocumentId = try values.decodeIfPresent(Int.self, forKey: .poDocumentId)
        poId = try values.decodeIfPresent(Int.self, forKey: .poId)
        reason = try values.decodeIfPresent(String.self, forKey: .reason)
    }
    
}
