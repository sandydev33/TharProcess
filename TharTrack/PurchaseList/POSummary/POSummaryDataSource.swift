//
//  POSummaryDataSource.swift
//  TharTrack
//
//  Created by Esoft on 04/11/19.
//  Copyright © 2019 Esoft. All rights reserved.
//

import Foundation
protocol POSummaryDataSourceType {
    func getPurchaseOrderByPurchaseOrderId(ID:Int ,comletion: @escaping(Result<PONBaseModel>) -> Void)
}

class POSummaryDataSource: POSummaryDataSourceType {
    func getPurchaseOrderByPurchaseOrderId(ID: Int, comletion: @escaping (Result<PONBaseModel>) -> Void) {
        NetworkClient.request(target: ResourceType.getPurchaseOrderByPurchaseOrderId(ID: ID), success: { result in
            comletion(result as Result<PONBaseModel>)
        }, error: { (error) in
            comletion(Result.failure(error))
        }) { (moyaError) in
            comletion(Result.failure(moyaError))
        }
    }

}

