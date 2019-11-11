//
//  ApproveOrderModel.swift
//  TharTrack
//
//  Created by Esoft on 07/11/19.
//  Copyright © 2019 Esoft. All rights reserved.
//

import Foundation
struct ApproveOrderModel : Codable {
    var branchId : Int?
    var dataval : String?
    var orderIdD : Int?
    
    enum CodingKeys: String, CodingKey {
        
        case branchId = "branchId"
        case dataval = "dataval"
        case orderIdD = "orderIdD"
    }
    init() {
        
    }
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        branchId = try values.decodeIfPresent(Int.self, forKey: .branchId)
        dataval = try values.decodeIfPresent(String.self, forKey: .dataval)
        orderIdD = try values.decodeIfPresent(Int.self, forKey: .orderIdD)
    }
    
}
