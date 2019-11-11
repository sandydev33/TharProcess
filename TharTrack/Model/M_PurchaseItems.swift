//
//  M_PurchaseItems.swift
//  TharTrack
//
//  Created by Esoft on 04/11/19.
//  Copyright © 2019 Esoft. All rights reserved.
//

import Foundation
struct M_PurchaseItems : Codable {
    let createdBy : String?
    let createdDate : String?
    let modifiedBy : String?
    let modifiedDate : String?
    let isDeleted : Bool?
    let ipAddress : String?
    let purchaseItemId : Int?
    let productPrice : Double?
    let quantity : Int?
    let totalPrice : Double?
    let shortDesc : String?
    let product : M_Product?
    
    enum CodingKeys: String, CodingKey {
        
        case createdBy = "createdBy"
        case createdDate = "createdDate"
        case modifiedBy = "modifiedBy"
        case modifiedDate = "modifiedDate"
        case isDeleted = "isDeleted"
        case ipAddress = "ipAddress"
        case purchaseItemId = "purchaseItemId"
        case productPrice = "productPrice"
        case quantity = "quantity"
        case totalPrice = "totalPrice"
        case shortDesc = "shortDesc"
        case product = "product"
    }
    
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        createdBy = try values.decodeIfPresent(String.self, forKey: .createdBy)
        createdDate = try values.decodeIfPresent(String.self, forKey: .createdDate)
        modifiedBy = try values.decodeIfPresent(String.self, forKey: .modifiedBy)
        modifiedDate = try values.decodeIfPresent(String.self, forKey: .modifiedDate)
        isDeleted = try values.decodeIfPresent(Bool.self, forKey: .isDeleted)
        ipAddress = try values.decodeIfPresent(String.self, forKey: .ipAddress)
        purchaseItemId = try values.decodeIfPresent(Int.self, forKey: .purchaseItemId)
        productPrice = try values.decodeIfPresent(Double.self, forKey: .productPrice)
        quantity = try values.decodeIfPresent(Int.self, forKey: .quantity)
        totalPrice = try values.decodeIfPresent(Double.self, forKey: .totalPrice)
        shortDesc = try values.decodeIfPresent(String.self, forKey: .shortDesc)
        product = try values.decodeIfPresent(M_Product.self, forKey: .product)
    }
    
}
