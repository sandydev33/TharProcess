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

//MARK: FormViewModel Delegate
extension BaseVC : FormDelegate {
 
    func didSave(success: Bool, controller: UIViewController, formID: Int, date: String, formType: FormType) {
        
        if success {
            switch formType {
                case .EngineLogBook:
                    mongoDBHelper.formSavedAt(formID: formID, value: date)
                    showErrorMessage(title: Constant.kAlertTitle_MESSAGE, message: CustomError.Saved.localizedDescription) { action in
                        if let pageViewVC = controller.parent?.parent as? PageViewVC, let contentVC = controller.parent as? PageViewContentVC {
                        
                            contentVC.lblLastUpdated.text = contentVC.formatDate(strDate: date)
                        
                            if contentVC.pageIndex < pageViewVC.pages.count - 1 {
                                pageViewVC.loadPageAt(index: contentVC.pageIndex + 1)
                            }
                        }
                    }
                case .ORB:
                    showErrorMessage(title: Constant.kAlertTitle_MESSAGE, message: CustomError.Saved.localizedDescription) { action in }
            case .DLB:
                showErrorMessage(title: Constant.kAlertTitle_MESSAGE, message: CustomError.Saved.localizedDescription) { action in }
            case .BWB:
                showErrorMessage(title: Constant.kAlertTitle_MESSAGE, message: CustomError.Saved.localizedDescription) { action in }
                break
            case .FOB:
                showErrorMessage(title: Constant.kAlertTitle_MESSAGE, message: CustomError.Saved.localizedDescription) { action in }
                break
            default:
                break
            }
        }
        else {
            showErrorMessage(title: Constant.kAlertTitle_MESSAGE, error: CustomError.SavingFailed)
        }
    }
    func showError(message: String) {
        let alert = UIAlertController(title: Constant.kAlertTitle_MESSAGE, message: message, preferredStyle: .alert)
        let alertAction = UIAlertAction(title: "OK", style: .cancel) {(_) in
    }
        alert.addAction(alertAction)
        self.present(alert, animated: true, completion: nil)
    }
}

extension BaseVC : FieldValidationDelegate {
    
    func didValidate(success: Bool, error: String?, cell: UITableViewCell) {
        
        showErrorMessage(title: Constant.kAlertTitle_WARNING, message: error!) { action in }
    }
    
    func didValidate(success: Bool, error: String?, cell: UITableViewCell, handler: @escaping (Bool) -> Void) {
        showMessage(title: Constant.kAlertTitle_WARNING, message: error ?? "", btnConfirmTitle: Constant.kAlertAction_YES, btnCancelTitle: Constant.kAlertAction_NO) { (flag, action) in
            if !flag {
                handler(false)
            }
            else { handler(true)}
        }
    }
}
