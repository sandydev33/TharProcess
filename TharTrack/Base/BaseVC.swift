//
//  BaseVC.swift
//  CampBell
//
//  Created by apple on 27/03/19.
//  Copyright © 2019 ESoft Technologies. All rights reserved.
//

import UIKit
import SVProgressHUD


class BaseVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
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

