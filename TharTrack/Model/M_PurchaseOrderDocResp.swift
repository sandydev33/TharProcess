//
//  M_PurchaseOrderDocResp.swift
//  TharTrack
//
//  Created by Esoft on 04/11/19.
//  Copyright © 2019 Esoft. All rights reserved.
//

import Foundation
struct M_PurchaseOrderDocResp : Codable {
    let purchaseOrderDocumentId : Int?
    let comment : String?
    let filePath : String?
    let isCheck : Bool?
    let isDocumentUploaded : Bool?
    let company : M_PurchaseCompany?
    let isdeleted : Bool?
    let documentDetail : M_DocumentDetail?
    
    enum CodingKeys: String, CodingKey {
        
        case purchaseOrderDocumentId = "purchaseOrderDocumentId"
        case comment = "comment"
        case filePath = "filePath"
        case isCheck = "isCheck"
        case isDocumentUploaded = "isDocumentUploaded"
        case company = "company"
        case isdeleted = "isdeleted"
        case documentDetail = "documentDetail"
    }
    
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        purchaseOrderDocumentId = try values.decodeIfPresent(Int.self, forKey: .purchaseOrderDocumentId)
        comment = try values.decodeIfPresent(String.self, forKey: .comment)
        filePath = try values.decodeIfPresent(String.self, forKey: .filePath)
        isCheck = try values.decodeIfPresent(Bool.self, forKey: .isCheck)
        isDocumentUploaded = try values.decodeIfPresent(Bool.self, forKey: .isDocumentUploaded)
        company = try values.decodeIfPresent(M_PurchaseCompany.self, forKey: .company)
        isdeleted = try values.decodeIfPresent(Bool.self, forKey: .isdeleted)
        documentDetail = try values.decodeIfPresent(M_DocumentDetail.self, forKey: .documentDetail)
    }
    
}
