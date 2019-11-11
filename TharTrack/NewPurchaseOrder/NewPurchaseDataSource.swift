//
//  NewPurchaseDataSource.swift
//  TharTrack
//
//  Created by Esoft on 15/10/19.
//  Copyright © 2019 Esoft. All rights reserved.
//

import Foundation

protocol NewPurchaseDataSourceType {
    func getAllPurchaseOrderList(completion: @escaping(Result<PurchaseBaseModel>) -> Void)
    
}

class NewPurchaseDataSource:NewPurchaseDataSourceType {
    func getAllPurchaseOrderList(completion: @escaping (Result<PurchaseBaseModel>) -> Void) {
        NetworkClient.request(target: ResourceType.getAllPurchaseOrderList, success: { (result) in
            completion(result as Result<PurchaseBaseModel>)
        }, error: { (error) in
            completion(Result.failure(error))
        }) { (moyaError) in
            completion(Result.failure(moyaError))
        }
    }
    
    
    
    
    
}
