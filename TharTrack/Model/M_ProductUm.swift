//
//  M_ProductUm.swift
//  TharTrack
//
//  Created by Esoft on 04/11/19.
//  Copyright © 2019 Esoft. All rights reserved.
//

import Foundation
struct M_ProductUm : Codable {
    let createdBy : String?
    let createdDate : String?
    let modifiedBy : String?
    let modifiedDate : String?
    let isDeleted : Bool?
    let ipAddress : String?
    let pumId : Int?
    let pumName : String?
    let pumDesc : String?
    let active : Bool?
    
    enum CodingKeys: String, CodingKey {
        
        case createdBy = "createdBy"
        case createdDate = "createdDate"
        case modifiedBy = "modifiedBy"
        case modifiedDate = "modifiedDate"
        case isDeleted = "isDeleted"
        case ipAddress = "ipAddress"
        case pumId = "pumId"
        case pumName = "pumName"
        case pumDesc = "pumDesc"
        case active = "active"
    }
    
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        createdBy = try values.decodeIfPresent(String.self, forKey: .createdBy)
        createdDate = try values.decodeIfPresent(String.self, forKey: .createdDate)
        modifiedBy = try values.decodeIfPresent(String.self, forKey: .modifiedBy)
        modifiedDate = try values.decodeIfPresent(String.self, forKey: .modifiedDate)
        isDeleted = try values.decodeIfPresent(Bool.self, forKey: .isDeleted)
        ipAddress = try values.decodeIfPresent(String.self, forKey: .ipAddress)
        pumId = try values.decodeIfPresent(Int.self, forKey: .pumId)
        pumName = try values.decodeIfPresent(String.self, forKey: .pumName)
        pumDesc = try values.decodeIfPresent(String.self, forKey: .pumDesc)
        active = try values.decodeIfPresent(Bool.self, forKey: .active)
    }
    
}
