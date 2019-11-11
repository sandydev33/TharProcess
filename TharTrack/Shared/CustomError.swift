//
//  CustomError.swift
//  CampBell
//
//  Created by apple on 27/03/19.
//  Copyright © 2019 ESoft Technologies. All rights reserved.
//

import Foundation

protocol Printable {
    var localizedDescription:String {get}
}

enum CustomError:Printable {
    case NoNetwork //1009
    case HTTPError(err:Error)
    case ServerError
    case TimeOut //2102
    case ParsingError
    case BadRequest
    case InValidUserName
    case InValidPasswordLength
    case NoForms
    case Logout
    case NoContent
    case DownloadFailed
    case Saved
    case SavingFailed

    var localizedDescription: String {
        switch  self {
        case .NoNetwork:
            return "No Network"
        case .HTTPError(let error):
            return "Response Error: \(error.localizedDescription)"
        case .TimeOut:
            return "The request has timed out"
        case .ParsingError:
            return "Unable to Serialize"
        case .BadRequest:
            return "Something went wrong"
        case .InValidUserName:
            return "Please Enter Valid User Name"
        case .InValidPasswordLength:
            return "Password should be minimum 6 characters"
        case .NoForms:
            return "Selected form not available."
        case .Logout:
            return "You are about to logout, click Yes to end the session or cancel to continue."
        case .NoContent:
            return "There are no contents available for the selection."
        case .DownloadFailed:
            return "We were unable to download, try later."
        case .Saved:
            return "Data saved successfully."
        case .SavingFailed:
            return "Unable to save, try later."
        default:
            return ""
        }
    }
}

//enum CustomError:Error {
//
//    case BadRequest
//    case NoNetwork //1009
//    case ParsingError
//    case TimeOut // 2102
//
//    var errorDescription:String {
//
//        switch self {
//        case .NoNetwork:
//            return "No Network"
//        default:
//            return "Un-Identified Error"
//        }
//    }
//}
