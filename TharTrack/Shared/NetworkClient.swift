//
//  NetworkClient.swift
//  CampBell
//
//  Created by apple on 27/03/19.
//  Copyright © 2019 ESoft Technologies. All rights reserved.
//

import Foundation
import Moya

enum Result<T> {
    case success(T)
  //  case failure(Error)
  //  case customFailure(CustomError)
    case failure(CustomError)
}

enum DownloadResult {
    case progress(Double)
    case success(String)
    case failure(CustomError)
}

class NetworkClient {
    
    static let provider = MoyaProvider<ResourceType>()
    
    // Method using Moya
//    static func request<K:Codable>(target: ResourceType, success successCallBack: @escaping (Result<K>) -> Void, error errorCallBack: @escaping (Swift.Error) -> Void, failure failureCallBack: @escaping (Error) -> Void) {
//
//        provider.request(target) { (result) in
//
//            switch result {
//            case .success(let response):
//
//                if response.statusCode >= 200 && response.statusCode <= 300 {
//                    do {
//
//                        let strJson = String(data: response.data, encoding: .utf8)
//                        print("RESPONSE JSON: \(strJson ?? "NO JSON STRING")")
//
//                        let decoder = JSONDecoder()
//                        let object = try decoder.decode(K.self, from: response.data)
//                        let result: Result<K> = Result.success(object)
//                        successCallBack(result)
//                    }
//                    catch {
//                        //  completion(.failure(error))
//                        // completion(.Customfailure(CustomError.ParsingError))
//                        let error = NSError(domain: Constant.kDomain, code: 0, userInfo: [NSLocalizedDescriptionKey: "Parsing Error"])
//                        errorCallBack(error)
//                    }
//                }
//                else {
//                    let error = NSError(domain: Constant.kDomain, code: 0, userInfo: [NSLocalizedDescriptionKey: "Hey its 404"])
//                    errorCallBack(error)
//                }
//            case .failure(let error):
//                print("FAILED:  \(MoyaError.underlying(error, nil))")
//
//                switch error {
//                case .underlying(let err as NSError, _):
//                    print(err.code)
//                    print(err.domain)
//                    failureCallBack(err)
//                default:
//                    print("Commom Error")
//                }
//            }
//        }
//    }
    
    static func request(target: ResourceType, progress: ProgressBlock?, completion: @escaping (DownloadResult) -> Void) -> Cancellable {
        return provider.request(target, progress: progress) { result in
            switch result {
            case .success(let response):
                        let data = response.data
                        let strJson = String(data: data, encoding: .utf8)
                        print("DOWNLOAD RESPONSE JSON: \(strJson ?? "NO JSON STRING")")
                        completion(DownloadResult.success(strJson ?? ""))
            case .failure(_):
                completion(.failure(CustomError.DownloadFailed))
            }
        }
    }

//    static func request<K: Codable>(target: ResourceType, progress: ProgressBlock?, completion: @escaping (Result<K>) -> Void) -> Cancellable {
//        return provider.request(target, progress: progress) { result in
//            switch result {
//            case let .success(response):
//                do {
//                let data = response.data
//                let strJson = String(data: response.data, encoding: .utf8)
//                print("DOWNLOAD RESPONSE JSON: \(strJson ?? "NO JSON STRING")")
//                let decoder = JSONDecoder()
//                let object = try decoder.decode(K.self, from: data)
//
//                completion(Result.success(object))
//                }
//                catch {
//                    completion(.failure(CustomError.ParsingError))
//                }
//            case .failure(_):
//                completion(.failure(CustomError.DownloadFailed))
//            }
//        }
//    }
    
    static func request<K:Codable>(target: ResourceType, success successCallBack: @escaping (Result<K>) -> Void, error errorCallBack: @escaping (CustomError) -> Void, failure failureCallBack: @escaping (CustomError) -> Void) {

        provider.request(target) { (result) in
            
            switch result {
            case .success(let response):
                
                if response.statusCode >= 200 && response.statusCode <= 300 {
                    do {
                        
                        let strJson = String(data: response.data, encoding: .utf8)
                        print("RESPONSE JSON: \(strJson ?? "NO JSON STRING")")
                        
                        let decoder = JSONDecoder()
                        let object = try decoder.decode(K.self, from: response.data)
                        let result: Result<K> = Result.success(object)
                        successCallBack(result)
                    }
                    catch {
                        errorCallBack(CustomError.ParsingError)
                    }
                }
                else if response.statusCode >= 400 && response.statusCode <= 499 {
                    
                    do {
                        let strJson = String(data: response.data, encoding: .utf8)
                        print("RESPONSE JSON: \(strJson ?? "NO JSON STRING")")
                        
                        let decoder = JSONDecoder()
                        let object = try decoder.decode(BaseModel.self, from: response.data)
                        let error = NSError(domain: Constant.kDomain, code: 0, userInfo: [NSLocalizedDescriptionKey: object.message ?? "Unable to connect"])
                        errorCallBack(CustomError.HTTPError(err: error))
                    }
                    catch {
                         errorCallBack(CustomError.ParsingError)
                    }
                }
                else {
                    errorCallBack(CustomError.ServerError)
                }
            case .failure(let error):
                print("FAILED:  \(MoyaError.underlying(error, nil))")
                NetworkManager.isUnreachable { resultsss in
                   failureCallBack(CustomError.NoNetwork)
                }
                switch error {
                case .underlying(let err as NSError, _):
                    print(err.code)
                    print(err.domain)
                    
                    if err.code == 1009 {
                        failureCallBack(CustomError.NoNetwork)
                    }
                    else if err.code == 2102 {
                        failureCallBack(CustomError.TimeOut)
                    }
                    else {
                        failureCallBack(CustomError.BadRequest)
                    }
                    
                default:
                    failureCallBack(CustomError.BadRequest)
                }
            }
        }
    }
}
