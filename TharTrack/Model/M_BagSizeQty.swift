//
//  M_BagSizeQty.swift
//  TharTrack
//
//  Created by Esoft on 05/11/19.
//  Copyright © 2019 Esoft. All rights reserved.
//

import Foundation
struct M_BagSizeQty : Codable {
    let createdBy : String?
    let createdDate : String?
    let modifiedBy : String?
    let modifiedDate : String?
    let isDeleted : Bool?
    let ipAddress : String?
    let modifiedByName : String?
    let id : Int?
    let bagSize : String?
    let description : String?
    let active : Bool?
    let isDefaultBagSize : Bool?
    let inUse : String?
    var value : String?
    
    enum CodingKeys: String, CodingKey {
        
        case createdBy = "createdBy"
        case createdDate = "createdDate"
        case modifiedBy = "modifiedBy"
        case modifiedDate = "modifiedDate"
        case isDeleted = "isDeleted"
        case ipAddress = "ipAddress"
        case modifiedByName = "modifiedByName"
        case id = "id"
        case bagSize = "bagSize"
        case description = "description"
        case active = "active"
        case isDefaultBagSize = "isDefaultBagSize"
        case inUse = "inUse"
        case value = "value"
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
        id = try values.decodeIfPresent(Int.self, forKey: .id)
        bagSize = try values.decodeIfPresent(String.self, forKey: .bagSize)
        description = try values.decodeIfPresent(String.self, forKey: .description)
        active = try values.decodeIfPresent(Bool.self, forKey: .active)
        isDefaultBagSize = try values.decodeIfPresent(Bool.self, forKey: .isDefaultBagSize)
        inUse = try values.decodeIfPresent(String.self, forKey: .inUse)
        value = try values.decodeIfPresent(String.self, forKey: .value)
    }
    
}
