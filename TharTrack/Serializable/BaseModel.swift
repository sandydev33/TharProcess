//
//  BaseModel.swift
//  CampBell
//
//  Created by apple on 27/03/19.
//  Copyright © 2019 ESoft Technologies. All rights reserved.
//

import Foundation

struct BaseModel : Codable {
    
    let crewid: Int?
    let firstname: String?
    let lastname: String?
    let profileImage: String?
    let signatureImage: String?
    let count : Int?
    let data : [Esoft_Data]?
    let message : String?
    let responsecode : Int?
    let timestamp : String?
    let parentFolders : [ParentFolders]?
    let childFolders : [ChildFolders]?
    let formList : [FormList]?
    
    let section : [Section]?
    let fields : [Fields]?
    
    let status : Int?
    let error : String?
    let path : String?
    
    let form_description : [Form_description]?
   
    
    enum CodingKeys: String, CodingKey {

        case crewid = "crewid"
        case firstname = "firstname"
        case lastname = "lastname"
        case profileImage = "profileImage"
        case signatureImage = "signatureImage"
        
        case count = "count"
        case data = "data"
        case message = "message"
        case responsecode = "responsecode"
        case timestamp = "timestamp"
        case parentFolders = "parentFolders"
        case childFolders = "childFolders"
        case formList = "formList"
        
        case section = "section"
        case fields = "fields"
        
        case status = "status"
        case error = "error"
        case path = "path"
        case form_description = "form_description"
    }
    
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        
        crewid = try values.decodeIfPresent(Int.self, forKey: .crewid)
        firstname = try values.decodeIfPresent(String.self, forKey: .firstname)
         lastname = try values.decodeIfPresent(String.self, forKey: .lastname)
        profileImage = try values.decodeIfPresent(String.self, forKey: .profileImage)
        signatureImage = try values.decodeIfPresent(String.self, forKey: .signatureImage)
        
        count = try values.decodeIfPresent(Int.self, forKey: .count)
        data = try values.decodeIfPresent([Esoft_Data].self, forKey: .data)
        message = try values.decodeIfPresent(String.self, forKey: .message)
        responsecode = try values.decodeIfPresent(Int.self, forKey: .responsecode)
        timestamp = try values.decodeIfPresent(String.self, forKey: .timestamp)
        parentFolders = try values.decodeIfPresent([ParentFolders].self, forKey: .parentFolders)
        childFolders = try values.decodeIfPresent([ChildFolders].self, forKey: .childFolders)
        formList = try values.decodeIfPresent([FormList].self, forKey: .formList)
        
        section = try values.decodeIfPresent([Section].self, forKey: .section)
        fields = try values.decodeIfPresent([Fields].self, forKey: .fields)
        
        status = try values.decodeIfPresent(Int.self, forKey: .status)
        error = try values.decodeIfPresent(String.self, forKey: .error)
        path = try values.decodeIfPresent(String.self, forKey: .path)
        form_description = try values.decodeIfPresent([Form_description].self, forKey: .form_description)
    }
}

