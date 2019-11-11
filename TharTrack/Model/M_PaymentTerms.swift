//
//  M_PaymentTerms.swift
//  TharTrack
//
//  Created by Esoft on 04/11/19.
//  Copyright © 2019 Esoft. All rights reserved.
//

import Foundation
struct M_PaymentTerms : Codable {
        let createdBy : String?
        let createdDate : String?
        let modifiedBy : String?
        let modifiedDate : String?
        let isDeleted : Bool?
        let ipAddress : String?
        let id : Int?
        let paymentTerms : String?
        let paymentTermDescription : String?
        let isActive : Bool?
        
        enum CodingKeys: String, CodingKey {
            
            case createdBy = "createdBy"
            case createdDate = "createdDate"
            case modifiedBy = "modifiedBy"
            case modifiedDate = "modifiedDate"
            case isDeleted = "isDeleted"
            case ipAddress = "ipAddress"
            case id = "id"
            case paymentTerms = "paymentTerms"
            case paymentTermDescription = "paymentTermDescription"
            case isActive = "isActive"
        }
        
        init(from decoder: Decoder) throws {
            let values = try decoder.container(keyedBy: CodingKeys.self)
            createdBy = try values.decodeIfPresent(String.self, forKey: .createdBy)
            createdDate = try values.decodeIfPresent(String.self, forKey: .createdDate)
            modifiedBy = try values.decodeIfPresent(String.self, forKey: .modifiedBy)
            modifiedDate = try values.decodeIfPresent(String.self, forKey: .modifiedDate)
            isDeleted = try values.decodeIfPresent(Bool.self, forKey: .isDeleted)
            ipAddress = try values.decodeIfPresent(String.self, forKey: .ipAddress)
            id = try values.decodeIfPresent(Int.self, forKey: .id)
            paymentTerms = try values.decodeIfPresent(String.self, forKey: .paymentTerms)
            paymentTermDescription = try values.decodeIfPresent(String.self, forKey: .paymentTermDescription)
            isActive = try values.decodeIfPresent(Bool.self, forKey: .isActive)
        }
        
}
