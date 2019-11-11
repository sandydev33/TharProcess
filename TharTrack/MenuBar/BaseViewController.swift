//
//  BaseViewController.swift
//  AKSwiftSlideMenu
//
//  Created by Ashish on 21/09/15.
//  Copyright (c) 2015 Kode. All rights reserved.
//

import UIKit
import SVProgressHUD

class BaseViewController: UIViewController, SlideMenuDelegate,UIPopoverPresentationControllerDelegate {
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    func slideMenuItemSelectedAtIndex(_ index: Int32) {
        if var topController = UIApplication.shared.keyWindow?.rootViewController {
            while let presentedViewController = topController.presentedViewController {
                topController = presentedViewController
                print("View Controller is : \(topController) \n", terminator: "")
            }
            // topController should now be your topmost view controller
        }
      //  let topViewController : UIViewController = self.navigationController!.topViewController!
            switch(index){
            case 0:
                print("Home\n", terminator: "")
                self.openViewControllerBasedOnIdentifier(Constant.kDashboardVC)
                break
            case 1:
                print("Scanner\n", terminator: "")
                self.openViewControllerBasedOnIdentifier(Constant.kNewPurchaseVC)
                break
            case 2:
                print("Scanner\n", terminator: "")
                self.openViewControllerBasedOnIdentifier(Constant.kWorkOrderVC)
                break
//            case 3:
//                print("Scanner\n", terminator: "")
//                self.openViewControllerBasedOnIdentifier(Constant.kPreCheckListVC)
//                break
//            case 4:
//                print("Scanner\n", terminator: "")
//                self.openViewControllerBasedOnIdentifier(Constant.kScanBagsVC)
//                break
//            case 5:
//                print("Scanner\n", terminator: "")
//                self.openViewControllerBasedOnIdentifier(Constant.kWorkOrderVC)
//                break
            case 3:
                print("Scanner\n", terminator: "")
                self.openViewControllerBasedOnIdentifier(Constant.kPurchaseListVC)
                break
            default:
                print("default\n", terminator: "")
            }
        
    }
    func openViewControllerBasedOnIdentifier(_ strIdentifier:String){
        let destViewController : UIViewController = self.storyboard!.instantiateViewController(withIdentifier: strIdentifier)
        let topViewController : UIViewController = self.navigationController!.topViewController!
        if (topViewController.restorationIdentifier! == destViewController.restorationIdentifier!){
            print("Same VC")
        } else {
            // self.present(destViewController, animated: true, completion: nil)
            navigationController?.pushViewController(destViewController, animated: true)
        }

}

    @objc func onSlideMenuButtonPressed(_ sender : UIButton){
        print(sender.tag)
        if (sender.tag == 10)
        {
            // To Hide Menu If it already there
            self.slideMenuItemSelectedAtIndex(-1);
            sender.tag = 0;
            let viewMenuBack : UIView = view.subviews.last!
            UIView.animate(withDuration: 0.3, animations: { () -> Void in
                var frameMenu : CGRect = viewMenuBack.frame
                frameMenu.origin.x = -1 * UIScreen.main.bounds.size.width
                viewMenuBack.frame = frameMenu
                viewMenuBack.layoutIfNeeded()
                viewMenuBack.backgroundColor = UIColor.clear
                }, completion: { (finished) -> Void in
                    viewMenuBack.removeFromSuperview()
            })
            return
        }
        sender.isEnabled = false
        sender.tag = 10
        let menuVC : MenuViewController = self.storyboard!.instantiateViewController(withIdentifier: "MenuViewController") as! MenuViewController
        menuVC.btnMenu = sender
        menuVC.delegate = self
        self.view.addSubview(menuVC.view)
        self.addChild(menuVC)
        menuVC.view.layoutIfNeeded()
        menuVC.view.frame=CGRect(x: 0 - UIScreen.main.bounds.size.width, y: 0, width: UIScreen.main.bounds.size.width, height: UIScreen.main.bounds.size.height);
        UIView.animate(withDuration: 0.3, animations: { () -> Void in
            menuVC.view.frame=CGRect(x: 0, y: 0, width: UIScreen.main.bounds.size.width, height: UIScreen.main.bounds.size.height);
            sender.isEnabled = true
            }, completion:nil)
    }
    
    
    
    // base controllers
    
    func startLoader() {
        SVProgressHUD.show()
    }
    
    func stopLoader() {
        SVProgressHUD.dismiss()
    }
    
    func showErrorMessage(title:String, error:CustomError) {
        
        let alert = UIAlertController(title: title, message: error.localizedDescription, preferredStyle: .alert)
        let alertAction = UIAlertAction(title: "OK", style: .cancel, handler: nil)
        alert.addAction(alertAction)
        self.present(alert, animated: true, completion: nil)
    }
    
    func showErrorMessage(title: String, message: String, handler: @escaping(UIAlertAction)-> Void) {
        
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let alertAction = UIAlertAction(title: "OK", style: .cancel) { (action) in
            handler(action)
        }
        alert.addAction(alertAction)
        self.present(alert, animated: true, completion: nil)
    }
    
    func showMessage(title: String, message: String, btnConfirmTitle: String, btnCancelTitle: String,  handler:@escaping (Bool, UIAlertAction)->Void) {
        
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let btnConfirmAction = UIAlertAction(title: btnConfirmTitle, style: .default) { (action) in
            handler(true, action)
        }
        let btnCancelAction = UIAlertAction(title: btnCancelTitle, style: .cancel) { (action) in
            handler(false, action)
        }
        
        alert.addAction(btnCancelAction)
        alert.addAction(btnConfirmAction)
        
        self.present(alert, animated: true) {
            
        }
    }
    
    
}
