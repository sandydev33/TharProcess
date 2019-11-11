//
//  RejectDataSource.swift
//  TharTrack
//
//  Created by Esoft on 05/11/19.
//  Copyright © 2019 Esoft. All rights reserved.
//

import Foundation

protocol RejectDataSourceType {
    func getRejectPurchaseOrder(ID:Int , comment:String ,completion: @escaping(Result<PONBaseModel>) -> Void)
}

class RejectDataSource: RejectDataSourceType {
    func getRejectPurchaseOrder(ID: Int, comment: String, completion: @escaping (Result<PONBaseModel>) -> Void) {
        NetworkClient.request(target: ResourceType.getRejectPurchaseOrder(ID: ID, comment: comment), success: { result in
            completion(result as Result<PONBaseModel>)
        }, error: { (error) in
            completion(Result.failure(error))
        }) { (moyaError) in
            completion(Result.failure(moyaError))
        }
    }

}
