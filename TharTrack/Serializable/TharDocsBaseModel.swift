//
//  TharDocsBaseModel.swift
//  TharTrack
//
//  Created by Esoft on 06/11/19.
//  Copyright © 2019 Esoft. All rights reserved.
//

import Foundation

struct TharDocsBaseModel : Codable {
    let status : String?
    let message : String?
    let result : [M_DocumentDetail]?
    
    enum CodingKeys: String, CodingKey {
        
        case status = "status"
        case message = "message"
        case result = "result"
    }
    
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        status = try values.decodeIfPresent(String.self, forKey: .status)
        message = try values.decodeIfPresent(String.self, forKey: .message)
        result = try values.decodeIfPresent([M_DocumentDetail].self, forKey: .result)
    }
    
}
