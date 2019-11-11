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
    case getAllFolderWithParentChild
    case getQuickViewData
    case getFormBuilderData
    case download(fileName: String)
    case getAllActiveWatchHour
    case getVoyageData
    case getDropDownData
    case syncingData(syncData:String)
    
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
            return Constant.kAuthPath
        case .getQuickViewData:
            return Constant.kRootPath + Constant.kQuickViewPath
        case .getAllFolderWithParentChild:
            return Constant.kRootPath + Constant.kAllFolderWithParentChild
        case .getFormBuilderData:
            return Constant.kRootPath + Constant.kFormBuilderPath
        case .download(let fileName):
            return Constant.kRootPath + Constant.kDownloadPath + fileName
        case .getAllActiveWatchHour:
            return Constant.kRootPath + Constant.kAllActiveWatchHour
        case .getVoyageData:
            return Constant.kRootPath + Constant.kVoyageInProgress
        case .getDropDownData:
            return Constant.kRootPath + Constant.kDropDownPath
        case .syncingData(_):
            return Constant.kRootPath + Constant.kSyncingPath
        }
    }
    
    var method: Moya.Method {
        switch self {
        case .validateUser(_, _):
            return Moya.Method.post
        case .getQuickViewData, .getAllFolderWithParentChild, .getFormBuilderData, .getAllActiveWatchHour, .getVoyageData, .getDropDownData:
            return Moya.Method.get
        case .download(_):
            return Moya.Method.get
        case .syncingData(_):
            return Moya.Method.post
        }
    }
    
    var parameters: [String: Any]? {
        switch self {
        case .validateUser(let userName, let password):
            return ["username":userName, "password":password]
        case .getQuickViewData:
            return ["page": "0", "limit": "10"]
        case .syncingData(let syncData):
            return ["data":syncData]
        default:
            return nil
        }
    }
    var para:String?{
        switch self {
        case .syncingData(let syncData):
            return syncData
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
        case .getQuickViewData:
            return .requestParameters(parameters: self.parameters!, encoding:URLEncoding.queryString)
        case .getAllFolderWithParentChild, .getFormBuilderData, .getAllActiveWatchHour, .getVoyageData, .getDropDownData:
            return .requestPlain
        case .download(_):
            return .downloadDestination(downloadDestination)
        case .syncingData(_):
            let data = Data((para?.utf8)!)
            return .requestData(data)
        }
    }
    
    var headers: [String : String]? {
        return ["Content-Type": "application/json"]
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
