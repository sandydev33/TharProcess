//
//  ResourceType.swift
//  CampBell
//
//  Created by apple on 27/03/19.
//  Copyright © 2019 ESoft Technologies. All rights reserved.
//

import Foundation
import Moya

enum ResourceType {
    case validateUser(userName: String, password: String)
    case forgotUser(email:String)
    case getAllPurchaseOrderList
    case getPurchaseOrderByPurchaseOrderId(ID:Int)
    case getRejectPurchaseOrder(ID:Int ,comment:String)
    case getOnHoldPurchaseOrder(ID:Int,comment:String)
    case download(fileName: String)
    case getAllActiveBagSize
    case getAllTharDocs
    case getAllBranch
    case approvePurchaseOrder(ID:Int , bagSize:String)
    case getAllVisibleDocument
    case requestDocuments(model:String)
    
    var localLocation: URL? {

        switch self {
        case .download(let fileName):
            let directory = FileSystem.downloadDirectory
            let filePath = directory.appendingPathComponent(fileName)
            return filePath
        default:
            return nil
        }
    }

    var downloadDestination: DownloadDestination {
       return { _, _ in return (self.localLocation!, [.removePreviousFile, .createIntermediateDirectories]) }
    }
}

extension ResourceType:TargetType {
    
    var baseURL: URL {
        return URL(string:Configuration.baseURL)!
    }
    
    var path: String {
        switch self {
        case .validateUser(_, _):
            return Constant.kLoginAuth
        case .getAllPurchaseOrderList:
            return Constant.kRootPath + Constant.kAllPurchaseOrder
        case .download(let fileName):
            return  Constant.kDownloadPath + fileName
        case .getPurchaseOrderByPurchaseOrderId(let ID):
             return Constant.kRootPath + Constant.kPONByOrderId + String(ID)
        case .getRejectPurchaseOrder(let ID, let comment):
            return Constant.kRootPath + Constant.kRejectPurchaseOrder + String(ID) + "/\(comment) "
        case .forgotUser(let email):
            return Constant.kForgot + email
        case .getOnHoldPurchaseOrder(let ID, _):
            return Constant.kRootPath + Constant.kOnHoldPurchaseOrder + String(ID)
        case .getAllActiveBagSize:
            return Constant.kRootPath + Constant.kAllBagSizeActive
        case .getAllTharDocs:
            return Constant.kRootPath + Constant.kTharDocs
        case .getAllBranch:
            return Constant.kRootPath + Constant.kAllBranch
        case .approvePurchaseOrder(let ID,_):
            return Constant.kRootPath + Constant.kApprovePurchaseOrder + String(ID)
        case .getAllVisibleDocument:
            return Constant.kRootPath + Constant.kAllVisibleDocument
        case .requestDocuments(_):
            return Constant.kRootPath + Constant.kRequestDocuments
        }
    }
    
    var method: Moya.Method {
        switch self {
        case .validateUser(_, _):
            return Moya.Method.post
        case .getAllPurchaseOrderList, .getAllActiveBagSize, .getAllTharDocs, .getAllBranch, .getAllVisibleDocument:
            return Moya.Method.get
        case .download(_):
            return Moya.Method.get
        case .getPurchaseOrderByPurchaseOrderId:
            return Moya.Method.get
        case .getRejectPurchaseOrder:
            return Moya.Method.get
        case .forgotUser(_) :
            return Moya.Method.post
        case .getOnHoldPurchaseOrder(_,_):
            return Moya.Method.post
        case .approvePurchaseOrder(_,_):
            return Moya.Method.post
        case .requestDocuments(_):
            return Moya.Method.post
            
        }
    }
    
    var parameters: [String: Any]? {
        switch self {
        case .validateUser(let userName, let password):
            return ["username":userName, "password":password]
        case .forgotUser(let email):
            return ["emailId":email]
        case .getOnHoldPurchaseOrder(let ID, let comment):
            return ["orderid":ID, "model": comment]
        case .approvePurchaseOrder(let ID,  let bagSize):
            return ["orderid":ID, "model": bagSize]
        case .requestDocuments(let model):
            return ["model":model]
        default:
            return nil
        }
    }
    var para:String?{
        switch self {
        default:
            return nil
        }
    }
    
    var sampleData: Data {
        return Data()
    }
    
    var task: Task {
        switch self {
        case .validateUser(_,_):
            return .requestParameters(parameters: parameters!, encoding: JSONEncoding.default)
        case .download(_):
            return .downloadDestination(downloadDestination)
        case .getAllPurchaseOrderList , .getAllActiveBagSize , .getAllTharDocs, .getAllBranch, .getAllVisibleDocument:
            return .requestPlain
        case .getPurchaseOrderByPurchaseOrderId:
            return.requestPlain
        case .getRejectPurchaseOrder:
            return .requestPlain
        case .forgotUser(_):
            return .requestParameters(parameters: parameters!, encoding: JSONEncoding.default)
        case .getOnHoldPurchaseOrder(_,_):
            return .requestParameters(parameters: parameters!, encoding: JSONEncoding.default)
        case .approvePurchaseOrder(_,_):
            return .requestParameters(parameters: parameters!, encoding: JSONEncoding.default)
        case .requestDocuments(_):
            return .requestParameters(parameters: parameters!, encoding: JSONEncoding.default)
        }
    }
    
    var headers: [String : String]? {
        var httpHeaders: [String: String] = [:]
        httpHeaders = ["Content-Type": "application/json"]
        httpHeaders = ["Authorization":UserDefaults.standard.getUserToken()]
        return httpHeaders
    }
}


class FileSystem {
    
    static let documentsDirectory: URL = {
        let urls = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
        return urls[urls.endIndex - 1]
    }()
    
    static let cacheDirectory: URL = {
        let urls = FileManager.default.urls(for: .cachesDirectory, in: .userDomainMask)
        return urls[urls.endIndex - 1]
    }()
    
    static let downloadDirectory: URL = {
        let directory: URL = FileSystem.documentsDirectory.appendingPathComponent("Download/")
        print("DOWNLOAD FOLDER:==== \(directory)")
        return directory
    }()
    
    static func isFileAvailable(fileName: String) -> Bool {
        let path = FileSystem.downloadDirectory.appendingPathComponent(fileName).path
        return FileManager.default.fileExists(atPath: path)
    }
}
