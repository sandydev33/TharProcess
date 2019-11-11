//
//  TharDocsDataSource.swift
//  TharTrack
//
//  Created by Esoft on 06/11/19.
//  Copyright © 2019 Esoft. All rights reserved.
//

import Foundation
protocol TharDocsDataSourceType {
    func getAllTharDocs(comletion: @escaping(Result<TharDocsBaseModel>) -> Void)
}

class TharDocsDataSource: TharDocsDataSourceType {
    func getAllTharDocs(comletion: @escaping (Result<TharDocsBaseModel>) -> Void) {
        NetworkClient.request(target: ResourceType.getAllTharDocs, success: { result in
            comletion(result as Result<TharDocsBaseModel>)
        }, error: { (error) in
            comletion(Result.failure(error))
        }) { (moyaError) in
            comletion(Result.failure(moyaError))
        }
    }
    
    
}
