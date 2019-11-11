//
//  M_Product.swift
//  TharTrack
//
//  Created by Esoft on 04/11/19.
//  Copyright © 2019 Esoft. All rights reserved.
//

import Foundation
struct M_Product : Codable {
    let createdBy : String?
    let createdDate : String?
    let modifiedBy : String?
    let modifiedDate : String?
    let isDeleted : Bool?
    let ipAddress : String?
    let productId : Int?
    let productName : String?
    let shortDesc : String?
    let productPrice : Double?
    let active : Bool?
    let productUrl : String?
    let productType : M_ProductType?
    let productUm : M_ProductUm?
    let inUse : String?
    
    enum CodingKeys: String, CodingKey {
        
        case createdBy = "createdBy"
        case createdDate = "createdDate"
        case modifiedBy = "modifiedBy"
        case modifiedDate = "modifiedDate"
        case isDeleted = "isDeleted"
        case ipAddress = "ipAddress"
        case productId = "productId"
        case productName = "productName"
        case shortDesc = "shortDesc"
        case productPrice = "productPrice"
        case active = "active"
        case productUrl = "productUrl"
        case productType = "productType"
        case productUm = "productUm"
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
        productId = try values.decodeIfPresent(Int.self, forKey: .productId)
        productName = try values.decodeIfPresent(String.self, forKey: .productName)
        shortDesc = try values.decodeIfPresent(String.self, forKey: .shortDesc)
        productPrice = try values.decodeIfPresent(Double.self, forKey: .productPrice)
        active = try values.decodeIfPresent(Bool.self, forKey: .active)
        productUrl = try values.decodeIfPresent(String.self, forKey: .productUrl)
        productType = try values.decodeIfPresent(M_ProductType.self, forKey: .productType)
        productUm = try values.decodeIfPresent(M_ProductUm.self, forKey: .productUm)
        inUse = try values.decodeIfPresent(String.self, forKey: .inUse)
    }
    
}
