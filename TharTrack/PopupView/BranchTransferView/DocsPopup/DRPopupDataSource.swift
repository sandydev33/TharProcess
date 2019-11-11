//
//  DRPopupDataSource.swift
//  TharTrack
//
//  Created by Esoft on 08/11/19.
//  Copyright © 2019 Esoft. All rights reserved.
//

import Foundation

protocol DRPopupDataSourceType {
  func getAllVisibleDocument(completion: @escaping(Result<TharDocsBaseModel>) -> Void)
  func requestDocuments(model:String ,completion: @escaping(Result<PONBaseModel>) -> Void)
    
}

class DRPopupDataSource: DRPopupDataSourceType {
    func requestDocuments(model: String, completion: @escaping (Result<PONBaseModel>) -> Void) {
        NetworkClient.request(target: ResourceType.requestDocuments(model: model), success: { (result) in
            completion(result as Result<PONBaseModel>)
        }, error: { (error) in
            completion(Result.failure(error))
        }) { (moyaError) in
            completion(Result.failure(moyaError))
        }
    }
    
    func getAllVisibleDocument(completion: @escaping (Result<TharDocsBaseModel>) -> Void) {
        NetworkClient.request(target: ResourceType.getAllVisibleDocument, success: { (result) in
            completion(result as Result<TharDocsBaseModel>)
        }, error: { (error) in
            completion(Result.failure(error))
        }) { (moyaError) in
            completion(Result.failure(moyaError))
        }
    }
    
    
}
