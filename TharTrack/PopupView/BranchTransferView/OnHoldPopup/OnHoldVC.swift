//
//  OnHoldVC.swift
//  TharTrack
//
//  Created by Esoft on 05/11/19.
//  Copyright © 2019 Esoft. All rights reserved.
//

import UIKit

protocol OnHoldVCDelegate : class{
    func btnCloseOnHoldTapped()
    func btnOnHoldReload()
}

class OnHoldVC: BaseVC {
    
    weak var delegate:OnHoldVCDelegate?
    
    var viewModel:OnHoldViewModel!
    var ID:Int? = nil
    var msg:String = ""
    @IBOutlet weak var txtViewComment: UITextView!
    override func viewDidLoad() {
        super.viewDidLoad()

        viewModel = OnHoldViewModel(dataSource: OnHoldDataSource())
        viewModel.delegate = self
        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
    @IBAction func btnOutSideTapped(_ sender: UIButton) {
        self.dismiss(animated: true, completion: nil)
       delegate?.btnCloseOnHoldTapped()
    }
    @IBAction func btnSubmitTapped(_ sender: UIButton) {
        
        if (self.txtViewComment.text?.count)! <= 0 {
            showErrorMessage(title: "Error....", error: CustomError.EmptyComment)
        }
        else {
            if ID != nil {
                viewModel.getOnHoldPurchaseOrder(ID: ID!, comment: txtViewComment.text!)
            }
            
        }
    }
    
}

// MARK: View Model Delegate Methods
extension OnHoldVC : ViewModelDelegate {
    func willLoadData() {
        startLoader()
    }
    
    func didLoadData() {
        
        
        showErrorMessage(title: "", message: viewModel!.msg) { action in
            self.delegate?.btnOnHoldReload()
            self.dismiss(animated: true, completion: nil)
            self.stopLoader()
        }
        //showErrorMessage(title: "", error: viewModel!.msg)
        
    }
    
    func didFail(error: CustomError) {
        showErrorMessage(title: "Error....", error: error)
        stopLoader()
    }
    
    
}
