//
//  OnHoldHelper.swift
//  TharTrack
//
//  Created by Esoft on 05/11/19.
//  Copyright © 2019 Esoft. All rights reserved.
//

import Foundation

class OnHoldHelper {
    static func createOnHoldModel(data:PONBaseModel , comment:String , index:IndexPath) -> M_OnHoldValue{
        let onHoldModel = M_OnHoldValue()
        onHoldModel.comment = comment
        onHoldModel.companyId = data.result?.company?.id
        onHoldModel.docCheckId = [data.result?.purchaseOrderDocResp?[index.row].purchaseOrderDocumentId] as? [Int]
        onHoldModel.documentId = data.result?.purchaseOrderDocResp?[index.row].purchaseOrderDocumentId
        onHoldModel.filePath = data.result?.purchaseOrderDocResp?[index.row].filePath
        onHoldModel.isCheck = data.result?.purchaseOrderDocResp?[index.row].isCheck
        onHoldModel.isDocumentUploaded = data.result?.purchaseOrderDocResp?[index.row].isDocumentUploaded
        onHoldModel.poId = data.result?.purchaseOrderDocResp?[index.row].purchaseOrderDocumentId
        onHoldModel.reason = data.result?.purchaseOrderDocResp?[index.row].comment
        return onHoldModel
    }
}
//{
//    "comment": "string",
//    "companyId": 0,
//    "docCheckId": [
//    0
//    ],
//    "documentId": 0,
//    "filePath": "string",
//    "isCheck": true,
//    "isDocumentUploaded": true,
//    "poDocumentId": 0,
//    "poId": 0,
//    "reason": "string"
//}
