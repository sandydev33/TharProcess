//
//  M_ContainersQrDetails.swift
//  TharTrack
//
//  Created by Esoft on 04/11/19.
//  Copyright © 2019 Esoft. All rights reserved.
//

import Foundation
struct M_ContainersQrDetails : Codable {
    let containerId : Int?
    let capacity : Int?
    let fillingQuantity : Int?
    let poNo : String?
    let clientName : String?
    let rmDesc : String?
    let qrCodeValue : String?
    let qrImagePath : String?
    let status : String?
    let location : String?
    let comment : String?
    let person : String?
    let dateTime : String?
    
    enum CodingKeys: String, CodingKey {
        
        case containerId = "containerId"
        case capacity = "capacity"
        case fillingQuantity = "fillingQuantity"
        case poNo = "poNo"
        case clientName = "clientName"
        case rmDesc = "rmDesc"
        case qrCodeValue = "qrCodeValue"
        case qrImagePath = "qrImagePath"
        case status = "status"
        case location = "location"
        case comment = "comment"
        case person = "person"
        case dateTime = "dateTime"
    }
    
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        containerId = try values.decodeIfPresent(Int.self, forKey: .containerId)
        capacity = try values.decodeIfPresent(Int.self, forKey: .capacity)
        fillingQuantity = try values.decodeIfPresent(Int.self, forKey: .fillingQuantity)
        poNo = try values.decodeIfPresent(String.self, forKey: .poNo)
        clientName = try values.decodeIfPresent(String.self, forKey: .clientName)
        rmDesc = try values.decodeIfPresent(String.self, forKey: .rmDesc)
        qrCodeValue = try values.decodeIfPresent(String.self, forKey: .qrCodeValue)
        qrImagePath = try values.decodeIfPresent(String.self, forKey: .qrImagePath)
        status = try values.decodeIfPresent(String.self, forKey: .status)
        location = try values.decodeIfPresent(String.self, forKey: .location)
        comment = try values.decodeIfPresent(String.self, forKey: .comment)
        person = try values.decodeIfPresent(String.self, forKey: .person)
        dateTime = try values.decodeIfPresent(String.self, forKey: .dateTime)
    }
    
}
