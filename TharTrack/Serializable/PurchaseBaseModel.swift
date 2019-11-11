//
//  PurchaseBaseModel.swift
//  TharTrack
//
//  Created by Esoft on 01/11/19.
//  Copyright © 2019 Esoft. All rights reserved.
//

import Foundation
struct PurchaseBaseModel : Codable {
    let status : String?
    let message : String?
    let result : [M_PurchaseDateList]?
    
    enum CodingKeys: String, CodingKey {
        
        case status = "status"
        case message = "message"
        case result = "result"
    }
    
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        status = try values.decodeIfPresent(String.self, forKey: .status)
        message = try values.decodeIfPresent(String.self, forKey: .message)
        result = try values.decodeIfPresent([M_PurchaseDateList].self, forKey: .result)
    }
    
}
