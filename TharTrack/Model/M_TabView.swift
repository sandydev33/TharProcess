//
//  M_TabView.swift
//  TharTrack
//
//  Created by Esoft on 22/10/19.
//  Copyright © 2019 Esoft. All rights reserved.
//

import Foundation


final class M_TabView: Codable {
    
    var formId: Int?
    var formName: String?
    
    
    enum CodingKeys: String, CodingKey {
     
        case formId = "formId"
        case formName = "formName"
       
    }
    
    init() {
    }
    
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        formId = try values.decodeIfPresent(Int.self, forKey: .formId)
        formName = try values.decodeIfPresent(String.self, forKey: .formName)
   
    }
    
  
}
