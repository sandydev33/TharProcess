//
//  OnHoldDataSource.swift
//  TharTrack
//
//  Created by Esoft on 05/11/19.
//  Copyright © 2019 Esoft. All rights reserved.
//

import Foundation
protocol OnHoldDataSourceType {
   func getOnHoldPurchaseOrder(ID:Int,comment:String ,completion: @escaping(Result<PONBaseModel>) -> Void)
}

class OnHoldDataSource: OnHoldDataSourceType {
    func getOnHoldPurchaseOrder(ID: Int, comment: String, completion: @escaping (Result<PONBaseModel>) -> Void) {
        NetworkClient.request(target: ResourceType.getOnHoldPurchaseOrder(ID: ID, comment: comment), success: { result in
            completion(result as Result<PONBaseModel>)
        }, error: { (error) in
            completion(Result.failure(error))
        }) { (moyaError) in
            completion(Result.failure(moyaError))
        }
    }
    
  
}
