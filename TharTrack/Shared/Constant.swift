//
//  Constant.swift
//  TharTrack
//
//  Created by Esoft on 15/10/19.
//  Copyright © 2019 Esoft. All rights reserved.
//

import Foundation
import UIKit

class Constant {
  // global constant
   static var POSections:[PONBaseModel] = []
   static var saveData:Array<String> = Array<String>()
    static var saveUploadDoc:Array<Int> = Array<Int>()
    // Webservices Path
    static let kBaseUrl = "https://jsonplaceholder.typicode.com/"
    
    static let kDomain = "com.esoftech"
    static let kRootPath = "rest/"
    
    
    static let kLoginAuth = "token/generate-token"
    static let kForgot = "public/forgotpasswordEmployee/"
    static let kDownloadPath = "downloadFile/"
    static let kAllPurchaseOrder = "purchaseOrder/getAllForAdminView"
    static let kPONByOrderId = "purchaseOrder/getPurchaseOrderByPurchaseOrderId/"
    static let kRejectPurchaseOrder = "purchaseOrder/rejectPurchaseOrder/"
    static let kOnHoldPurchaseOrder = "purchaseOrder/holdPurchaseOrder/"
    static let kAllBagSizeActive = "bagsize/getallActive"
    static let kTharDocs = "poDoc/getPoDocsForTharProcess"
    static let kAllBranch = "branch/getAllActiveBranches"
    static let kApprovePurchaseOrder = "purchaseOrder/approvePurchaseOrder/"
    static let kAllVisibleDocument = "document/getAllVisibleDocument"
    
    //MARK: StoryBoard
    static let kMainStoryboard = "Main"
    
    //MARK: View Controllers
    static let kDashboardNavigationVC = "DashboardNavigationVC"
    static let kNAVNotificationVC = "NAVNotificationVC"
    
    static let kLoginVC = "LoginVC"
    static let kForgotVC = "ForgotVC"
    static let kDashboardVC = "ViewController"
    static let kNewPurchaseVC = "NewPurchaseVC"
    static let kApprovedPurchVC = "ApprovedPurchVC"
    static let kPreCheckListVC = "PreCheckListVC"
    static let kScanBagsVC = "ScanBagsVC"
    static let kWorkOrderVC = "WorkOrderVC"
    static let kWorkOrderDetailsVC = "WorkOrderDetailsVC"
    static let kBranchTransVC = "BranchTransVC"
    static let kPurchaseListVC = "PurchaseListVC"
    static let kNotificationVC = "NotificationVC"
    static let kRequestDocuments = "poDoc/save_po_docs_from_admin"
    
    //MARK: Popup View
    static let kReasonRejectVC = "ReasonRejectVC"
    static let kBagSizeVC = "BagSizeVC"
    static let kDRPopupVC = "DRPopupVC"
    static let kOnHoldVC = "OnHoldVC"
    
    //MARK: Alert Title
    static let kAlertTitle_LOGOUT = "LOGOUT"
    static let kAlertTitle_MESSAGE = "MESSAGE"
    static let kAlertTitle_ERROR = "ERROR"
    static let kAlertTitle_NOFORMS = "NO FORMS"
    static let kAlertTitle_WARNING =  "WARNING"
    
    //MARK: Alert Action
    static let kAlertAction_YES = "YES"
    static let kAlertAction_CANCEL = "CANCEL"
    static let kAlertAction_NO = "NO"
    
    //MARK: Image
    
    
    //MARK: - Hex
    static let kColor_TabSelection = "#FD6876"
    static let kHex_TabSelection = "#FD6876"
    static let kNavGreen = "NavGreen"
    static let kAddiDocBtn = "AddiDocBtn"
    static let kTextColor = "TextColor"
    static let kIndicator = "Indicator"
    
    
    //MARK: Date Time Format
       static let dd_MMM_yyyy = "dd-MMM-yyyy"
       static let hh_mm_a = "hh:mm a"
       static let dd_MM_yyyy = "dd-MM-yyyy"
       static let dd_MM_yyyy_Time = "hh:mm a, dd-MMM-yyyy"
    
    
       static func getViewController<T: UIViewController>(storyboard: String, identifier: String, type: T.Type) -> T {
           return Constant.getViewController(storyboard: storyboard, identifier: identifier) as! T
       }
       
        static func getViewController(storyboard: String, identifier: String) -> UIViewController {
           let storyboard = Constant.storyboard(storyboardID: storyboard)
           return storyboard.instantiateViewController(withIdentifier: identifier)
       }
       
       private static func storyboard(storyboardID: String) -> UIStoryboard {
           let storyboard = UIStoryboard(name: storyboardID, bundle: Bundle.main)
           return storyboard
       }
    
    
    static func getCell<T: UITableViewCell>(cell: UITableViewCell, type: T.Type) -> T {
          return  cell as! T
      }
    
    
    static func getImage(fileName: String?) -> UIImage! {
        
        guard let file = fileName else { return UIImage(named: "Ellipse 5") }
        
        if let image =  UIImage(contentsOfFile: FileSystem.downloadDirectory.appendingPathComponent(file).path) {
            return image
        }
        
        return UIImage(named: "Ellipse 5")
    }
    
      static func dateTimeFormatter(format: String, date: Date) -> String {
          
          let formatter = DateFormatter()
          formatter.dateFormat = format
          let resultDate = formatter.string(from: date)
          return resultDate

          /*let calendar = Calendar.current
          let day = calendar.component(.day, from: date)
          let month = calendar.component(.month, from: date)
          let year = calendar.component(.year, from: date)
          return String(format: "%02d/%02d/%d", day,month, year)*/
      }
      static func dateTimeDateFormatter(format:String , date:String) -> Date {
           let formatter = DateFormatter()
          formatter.dateFormat = format
          let resultDate = formatter.date(from: date)
          return resultDate!
      }
      static func getTimeFromDate(date: Date) -> String {
          
          let calendar = Calendar.current
          let hour = calendar.component(.hour, from: date)
          let minutes = calendar.component(.minute, from: date)
          return String(format: "%02d:%02d", hour,minutes)
      }
      
      static func getTotalHours(dateFormat: String,dateToConvert:String) -> String {
          
         let dateFormatter = DateFormatter()
         /*  dateFormatter.dateFormat = dateFormat
          let convertDate = dateFormatter.date(from: dateToConvert)


          let strToday = dateFormatter.string(from: Date())
          let TodayDate = dateFormatter.date(from:strToday)!
          
          print(convertDate!.offset(from:TodayDate))
          return convertDate!.offset(from: TodayDate)*/
          
          dateFormatter.dateFormat = "dd/MM/yyyy hh:mm a"
          let convertedDate = dateFormatter.date(from: dateToConvert)
          dateFormatter.timeZone = TimeZone(identifier: "UTC")
          let str = dateFormatter.string(from: convertedDate!)
          let convertedDateNew = dateFormatter.date(from: str)
          
          
          print(Date().offset(from: convertedDate!))
          
          
          return Date().offset(from: convertedDate!)
          
      }
      
      static func dateToString(date: Date) -> String {
          
          let formatter = DateFormatter()
          //2019-05-03 12:11:15
          formatter.dateFormat = "yyyy-MM-dd HH:mm:ss"
          return formatter.string(from: date)
      }
}
