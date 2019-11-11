//
//  M_PurchaseDateList.swift
//  TharTrack
//
//  Created by Esoft on 01/11/19.
//  Copyright © 2019 Esoft. All rights reserved.
//

import Foundation
struct M_PurchaseDateList : Codable {
    let orderId : Int?
    let orderDate : String?
    let orderDate1 : String?
    let orderStatus : String?
    let poNo : String?
    let company : M_PurchaseCompany?
    
    enum CodingKeys: String, CodingKey {
        
        case orderId = "orderId"
        case orderDate = "orderDate"
        case orderDate1 = "orderDate1"
        case orderStatus = "orderStatus"
        case company = "company"
        case poNo = "poNo"
    }
    
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        orderId = try values.decodeIfPresent(Int.self, forKey: .orderId)
        orderDate = try values.decodeIfPresent(String.self, forKey: .orderDate)
        orderDate1 = try values.decodeIfPresent(String.self, forKey: .orderDate1)
        orderStatus = try values.decodeIfPresent(String.self, forKey: .orderStatus)
        poNo = try values.decodeIfPresent(String.self, forKey: .poNo)
        company = try values.decodeIfPresent(M_PurchaseCompany.self, forKey: .company)
        
    }
    
}
