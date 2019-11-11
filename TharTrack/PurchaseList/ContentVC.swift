//
//  ContentVC.swift
//  TharTrack
//
//  Created by Esoft on 21/10/19.
//  Copyright © 2019 Esoft. All rights reserved.
//

import UIKit

class ContentVC: UIViewController {

    //MARK: Constant
    let kPOSummaryVC = "POSummaryVC"
    let kPOAddressVC = "POAddressVC"
    let kLineItemVC = "LineItemVC"
    let kCustomerDocsVC = "CustomerDocsVC"
    let kTharDocsVC = "TharDocsVC"
    var pageIndex: NSInteger = 0
     var tabView: M_TabView!
    var orderID:Int? = nil
    var sections:[PONBaseModel] = []
    var scrollIndex:[String] = []
    var selectedCellIndex:Int? = nil
    @IBOutlet weak var containerView: UIView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if let formID = tabView.formId {
            guard let vc = loadViewControllerBy(formID: formID) else { return }
            self.addChild(vc)
            vc.view.frame = CGRect(x: 0, y: 0, width: containerView.bounds.width, height: containerView.bounds.height)
            self.containerView.addSubview(vc.view)
            vc.didMove(toParent: self)
        }
        
    }
    
    private func loadViewControllerBy(formID: Int) -> UIViewController? {
        
        switch formID {
        case 0:
            let  vc = Constant.getViewController(storyboard: Constant.kMainStoryboard, identifier: kPOSummaryVC, type: POSummaryVC.self)
            vc.orderID = orderID
         //   vc.sections = sections
            return vc
        case 1:
            let  vc = Constant.getViewController(storyboard: Constant.kMainStoryboard, identifier: kPOAddressVC, type: POAddressVC.self)
            vc.orderID = orderID
          //  vc.sections = sections
            return vc
        case 2:
            let  vc = Constant.getViewController(storyboard: Constant.kMainStoryboard, identifier: kLineItemVC, type: LineItemVC.self)
            vc.orderID = orderID
        //    vc.sections = sections
            return vc
        case 3:
            let  vc = Constant.getViewController(storyboard: Constant.kMainStoryboard, identifier: kCustomerDocsVC, type: CustomerDocsVC.self)
            vc.orderID = orderID
        //    vc.sections = sections
            return vc
        case 4:
            let  vc = Constant.getViewController(storyboard: Constant.kMainStoryboard, identifier: kTharDocsVC, type: TharDocsVC.self)
            vc.orderID = orderID
         //   vc.sections = sections
            return vc
        default:
            break
        }
        
        return nil
    }
    
    //MARK: Member Functions
    //    fileprivate func getViewController<T: UIViewController>(storyboard: String, identifier: String, type: T.Type) -> T {
    //        return Constant.getViewController(storyboard: storyboard, identifier: identifier) as! T
    //    }
    
    func formatDate(strDate: String?) -> String {
        
        guard let strDate = strDate else { return "-"}
        
        let formatter = DateFormatter()
        //2019-05-03 12:11:15
        formatter.dateFormat = "dd-MM-yyyy HH:mm:ss"
        
        if let date =  formatter.date(from: strDate) {
            let viewFormatter = DateFormatter()
            viewFormatter.dateFormat = "hh:mm a, dd-MMM-yyyy"
            
            return viewFormatter.string(from: date)
        }
        return "-"
    }

}
