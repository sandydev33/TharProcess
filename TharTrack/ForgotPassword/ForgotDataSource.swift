//
//  ForgotDataSource.swift
//  TharTrack
//
//  Created by Esoft on 15/10/19.
//  Copyright © 2019 Esoft. All rights reserved.
//

import Foundation

protocol ForgotDataSourceType {
    func forgotUser(userName:String , comletion: @escaping(Result<BaseModel>) -> Void)
}

class ForgotDataSource: ForgotDataSourceType {
    func forgotUser(userName: String, comletion: @escaping (Result<BaseModel>) -> Void) {
        NetworkClient.request(target: ResourceType.forgotUser(email: userName), success: { result in
            comletion(result as Result<BaseModel>)
        }, error: { (error) in
            comletion(Result.failure(error))
        }) { (moyaError) in
            comletion(Result.failure(moyaError))
        }
    }
}
