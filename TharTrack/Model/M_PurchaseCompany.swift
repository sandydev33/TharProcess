//
//  M_PurchaseCompany.swift
//  TharTrack
//
//  Created by Esoft on 01/11/19.
//  Copyright © 2019 Esoft. All rights reserved.
//

import Foundation
struct M_PurchaseCompany : Codable {
    let createdBy : String?
    let createdDate : String?
    let modifiedBy : String?
    let modifiedDate : String?
    let isDeleted : Bool?
    let ipAddress : String?
    let modifiedByName : String?
    let id : Int?
    let companyName : String?
    let companyUrl : String?
    let contactPerson : String?
    let phoneNumber : String?
    let email : String?
    let street : String?
    let city : String?
    let state : String?
    let country : String?
    let zipCode : String?
    let logoUrl : String?
    let approvalStatus : String?
    let title : String?
    let isApproved : Bool?
    let maxUsers : Int?
    let comments : String?
    let active : Bool?
    let timeZone : String?
    let maxUserModifiedBy : String?
    let maxUserModifiedDate : String?
    let maxUserModifedTime : String?
    let maxUserModifiedByName : String?
    
    enum CodingKeys: String, CodingKey {
        
        case createdBy = "createdBy"
        case createdDate = "createdDate"
        case modifiedBy = "modifiedBy"
        case modifiedDate = "modifiedDate"
        case isDeleted = "isDeleted"
        case ipAddress = "ipAddress"
        case modifiedByName = "modifiedByName"
        case id = "id"
        case companyName = "companyName"
        case companyUrl = "companyUrl"
        case contactPerson = "contactPerson"
        case phoneNumber = "phoneNumber"
        case email = "email"
        case street = "street"
        case city = "city"
        case state = "state"
        case country = "country"
        case zipCode = "zipCode"
        case logoUrl = "logoUrl"
        case approvalStatus = "approvalStatus"
        case title = "title"
        case isApproved = "isApproved"
        case maxUsers = "maxUsers"
        case comments = "comments"
        case active = "active"
        case timeZone = "timeZone"
        case maxUserModifiedBy = "maxUserModifiedBy"
        case maxUserModifiedDate = "maxUserModifiedDate"
        case maxUserModifedTime = "maxUserModifedTime"
        case maxUserModifiedByName = "maxUserModifiedByName"
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
        companyName = try values.decodeIfPresent(String.self, forKey: .companyName)
        companyUrl = try values.decodeIfPresent(String.self, forKey: .companyUrl)
        contactPerson = try values.decodeIfPresent(String.self, forKey: .contactPerson)
        phoneNumber = try values.decodeIfPresent(String.self, forKey: .phoneNumber)
        email = try values.decodeIfPresent(String.self, forKey: .email)
        street = try values.decodeIfPresent(String.self, forKey: .street)
        city = try values.decodeIfPresent(String.self, forKey: .city)
        state = try values.decodeIfPresent(String.self, forKey: .state)
        country = try values.decodeIfPresent(String.self, forKey: .country)
        zipCode = try values.decodeIfPresent(String.self, forKey: .zipCode)
        logoUrl = try values.decodeIfPresent(String.self, forKey: .logoUrl)
        approvalStatus = try values.decodeIfPresent(String.self, forKey: .approvalStatus)
        title = try values.decodeIfPresent(String.self, forKey: .title)
        isApproved = try values.decodeIfPresent(Bool.self, forKey: .isApproved)
        maxUsers = try values.decodeIfPresent(Int.self, forKey: .maxUsers)
        comments = try values.decodeIfPresent(String.self, forKey: .comments)
        active = try values.decodeIfPresent(Bool.self, forKey: .active)
        timeZone = try values.decodeIfPresent(String.self, forKey: .timeZone)
        maxUserModifiedBy = try values.decodeIfPresent(String.self, forKey: .maxUserModifiedBy)
        maxUserModifiedDate = try values.decodeIfPresent(String.self, forKey: .maxUserModifiedDate)
        maxUserModifedTime = try values.decodeIfPresent(String.self, forKey: .maxUserModifedTime)
        maxUserModifiedByName = try values.decodeIfPresent(String.self, forKey: .maxUserModifiedByName)
    }
    
}
