//
//  Helper.swift
//  TharTrack
//
//  Created by Esoft on 05/11/19.
//  Copyright © 2019 Esoft. All rights reserved.
//all helper class is here

import Foundation

class Helper {
    static func createUploadModel(data:[PONBaseModel] , comment:String , docData:TharDocsBaseModel ) -> M_UploadValue? {
        let uploadValue = M_UploadValue()
        guard let model = data[0].result  else {
            return nil
        }
        uploadValue.comment = comment
        uploadValue.companyId = model.company?.id
        uploadValue.docCheckId = Constant.saveUploadDoc
        for item in docData.result! {
            uploadValue.documentId = item.documentId
            uploadValue.filePath = ""
            uploadValue.isCheck = true
            uploadValue.isDocumentUploaded = true
            uploadValue.reason = ""
        }
        uploadValue.poId = Int(model.poNo ?? "")
        return uploadValue
    }
    
    static func createApproveModel(data:[BagSize], ID:Int , branchID:Int) -> ApproveOrderModel? {
        var approveModel = ApproveOrderModel()
        var i = 0
        var dic:Array<Dictionary<String,String>> = Array<Dictionary<String,String>>()
        for item in data[0].result! {
            let dics = ["bag_id":String(item.id ?? 0), "bag_size":Constant.saveData[i]]
            dic.append(dics)
            i = i + 1
        }
        
        do{
            let data = try JSONEncoder().encode(dic)
            let strJson = String(data: data, encoding: .utf8)
           approveModel.dataval = strJson
            print("FORM DATA JSON: \(strJson ?? "JSON NOT DEVELOPED")")
            
        }catch {}
        approveModel.branchId = branchID ?? 0
        approveModel.orderIdD = ID
        return approveModel
    }
    
}


