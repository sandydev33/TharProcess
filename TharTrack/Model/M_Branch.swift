//
//  M_Branch.swift
//  TharTrack
//
//  Created by Esoft on 06/11/19.
//  Copyright © 2019 Esoft. All rights reserved.
//

import Foundation

struct M_Branch : Codable {
    let createdBy : String?
    let createdDate : String?
    let modifiedBy : String?
    let modifiedDate : String?
    let isDeleted : Bool?
    let ipAddress : String?
    let modifiedByName : String?
    let id : Int?
    let branchName : String?
    let branchCode : String?
    let description : String?
    let contactPerson : String?
    let email : String?
    let title : String?
    let phone : String?
    let street : String?
    let city : String?
    let state : String?
    let country : String?
    let zipCode : String?
    let active : Bool?
    let isPoBranch : Bool?
    let modifedTime : String?
    
    enum CodingKeys: String, CodingKey {
        
        case createdBy = "createdBy"
        case createdDate = "createdDate"
        case modifiedBy = "modifiedBy"
        case modifiedDate = "modifiedDate"
        case isDeleted = "isDeleted"
        case ipAddress = "ipAddress"
        case modifiedByName = "modifiedByName"
        case id = "id"
        case branchName = "branchName"
        case branchCode = "branchCode"
        case description = "description"
        case contactPerson = "contactPerson"
        case email = "email"
        case title = "title"
        case phone = "phone"
        case street = "street"
        case city = "city"
        case state = "state"
        case country = "country"
        case zipCode = "zipCode"
        case active = "active"
        case isPoBranch = "isPoBranch"
        case modifedTime = "modifedTime"
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
        branchName = try values.decodeIfPresent(String.self, forKey: .branchName)
        branchCode = try values.decodeIfPresent(String.self, forKey: .branchCode)
        description = try values.decodeIfPresent(String.self, forKey: .description)
        contactPerson = try values.decodeIfPresent(String.self, forKey: .contactPerson)
        email = try values.decodeIfPresent(String.self, forKey: .email)
        title = try values.decodeIfPresent(String.self, forKey: .title)
        phone = try values.decodeIfPresent(String.self, forKey: .phone)
        street = try values.decodeIfPresent(String.self, forKey: .street)
        city = try values.decodeIfPresent(String.self, forKey: .city)
        state = try values.decodeIfPresent(String.self, forKey: .state)
        country = try values.decodeIfPresent(String.self, forKey: .country)
        zipCode = try values.decodeIfPresent(String.self, forKey: .zipCode)
        active = try values.decodeIfPresent(Bool.self, forKey: .active)
        isPoBranch = try values.decodeIfPresent(Bool.self, forKey: .isPoBranch)
        modifedTime = try values.decodeIfPresent(String.self, forKey: .modifedTime)
    }
    
}
