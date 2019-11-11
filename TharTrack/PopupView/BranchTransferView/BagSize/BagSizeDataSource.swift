//
//  BagSizeDataSource.swift
//  TharTrack
//
//  Created by Esoft on 05/11/19.
//  Copyright © 2019 Esoft. All rights reserved.
//

import Foundation

protocol BagSizeDataSourceType {
   func getAllActiveBagSize(completion: @escaping(Result<BagSize>) -> Void)
   func getAllBranch(completion: @escaping(Result<AllBranchBaseModel>) -> Void)
   func approvePurchaseOrder(ID:Int , bagSize:String ,completion: @escaping(Result<PONBaseModel>) -> Void)
}
class BagSizeDataSource: BagSizeDataSourceType {
    
    func getAllBranch(completion: @escaping (Result<AllBranchBaseModel>) -> Void) {
        NetworkClient.request(target: ResourceType.getAllBranch, success: { result in
            completion(result as Result<AllBranchBaseModel>)
        }, error: { (error) in
            completion(Result.failure(error))
        }) { (moyaError) in
            completion(Result.failure(moyaError))
        }
    }
    
    func getAllActiveBagSize(completion: @escaping (Result<BagSize>) -> Void) {
        NetworkClient.request(target: ResourceType.getAllActiveBagSize, success: { result in
            completion(result as Result<BagSize>)
        }, error: { (error) in
            completion(Result.failure(error))
        }) { (moyaError) in
            completion(Result.failure(moyaError))
        }
    }
    
    func approvePurchaseOrder(ID: Int, bagSize: String, completion: @escaping (Result<PONBaseModel>) -> Void) {
        NetworkClient.request(target: ResourceType.approvePurchaseOrder(ID: ID, bagSize: bagSize), success: { result in
            completion(result as Result<PONBaseModel>)
        }, error: { (error) in
            completion(Result.failure(error))
        }) { (moyaError) in
            completion(Result.failure(moyaError))
        }
    }
}
