//
//  LoginDataSource.swift
//  TharTrack
//
//  Created by Esoft on 15/10/19.
//  Copyright © 2019 Esoft. All rights reserved.
//

import Foundation
protocol LoginDataSourceType {
    func validateUser(userName: String, password: String, comletion: @escaping(Result<BaseModel>) -> Void)
}

class LoginDataSource: LoginDataSourceType {
    func validateUser(userName: String, password: String, comletion: @escaping (Result<BaseModel>) -> Void) {
            NetworkClient.request(target: ResourceType.validateUser(userName: userName, password: password), success: { result in
            comletion(result as Result<BaseModel>)
            }, error: { (error) in
            comletion(Result.failure(error))
            }) { (moyaError) in
            comletion(Result.failure(moyaError))
            }
    }

}
