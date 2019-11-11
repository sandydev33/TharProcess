//
//  M_ProductType.swift
//  TharTrack
//
//  Created by Esoft on 04/11/19.
//  Copyright © 2019 Esoft. All rights reserved.
//

import Foundation
struct M_ProductType : Codable {
    let createdBy : String?
    let createdDate : String?
    let modifiedBy : String?
    let modifiedDate : String?
    let isDeleted : Bool?
    let ipAddress : String?
    let typeId : Int?
    let productType : String?
    let typeDesc : String?
    let active : Bool?
    let inUse : String?
    
    enum CodingKeys: String, CodingKey {
        
        case createdBy = "createdBy"
        case createdDate = "createdDate"
        case modifiedBy = "modifiedBy"
        case modifiedDate = "modifiedDate"
        case isDeleted = "isDeleted"
        case ipAddress = "ipAddress"
        case typeId = "typeId"
        case productType = "productType"
        case typeDesc = "typeDesc"
        case active = "active"
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
        typeId = try values.decodeIfPresent(Int.self, forKey: .typeId)
        productType = try values.decodeIfPresent(String.self, forKey: .productType)
        typeDesc = try values.decodeIfPresent(String.self, forKey: .typeDesc)
        active = try values.decodeIfPresent(Bool.self, forKey: .active)
        inUse = try values.decodeIfPresent(String.self, forKey: .inUse)
    }
    
}
