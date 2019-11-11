
//
//  Result.swift
//  TharTrack
//
//  Created by Esoft on 22/10/19.
//  Copyright © 2019 Esoft. All rights reserved.
//
import Foundation

struct Result : Codable {
	let token : String?
	let username : String?
	let profileImage : String?
	let roles : [String]?

	enum CodingKeys: String, CodingKey {

		case token = "token"
		case username = "username"
		case profileImage = "profileImage"
		case roles = "roles"
	}

	init(from decoder: Decoder) throws {
		let values = try decoder.container(keyedBy: CodingKeys.self)
		token = try values.decodeIfPresent(String.self, forKey: .token)
		username = try values.decodeIfPresent(String.self, forKey: .username)
		profileImage = try values.decodeIfPresent(String.self, forKey: .profileImage)
		roles = try values.decodeIfPresent([String].self, forKey: .roles)
	}

}
