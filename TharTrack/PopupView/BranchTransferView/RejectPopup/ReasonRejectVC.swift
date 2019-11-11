//
//  ReasonRejectVC.swift
//  TharTrack
//
//  Created by Esoft on 18/10/19.
//  Copyright © 2019 Esoft. All rights reserved.
//

import UIKit

protocol ReasonRejectVCDelegate : class{
    func btnCloseTapped()
    func btnReload()
}

class ReasonRejectVC: BaseVC {

    var viewModel:RejectViewModel!
    var ID:Int? = nil
    var msg:String = ""
    @IBOutlet weak var txtViewComment: UITextView!
    weak var delegate:ReasonRejectVCDelegate?
    override func viewDidLoad() {
        super.viewDidLoad()

        
        viewModel = RejectViewModel(dataSource: RejectDataSource())
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
            delegate?.btnCloseTapped()
    }
    @IBAction func btnRejectReasonTapped(_ sender: UIButton) {
        
        if (self.txtViewComment.text?.count)! <= 0 {
            showErrorMessage(title: "Error....", error: CustomError.EmptyComment)
        }
        else {
            if ID != nil {
                viewModel.getRejectPurchaseOrder(ID: ID!, comment: txtViewComment.text!)
            }
            
        }
       
        
    }
}

// ViewModel Delegate methods
extension ReasonRejectVC : ViewModelDelegate {
    func willLoadData() {
        startLoader()
    }
    
    func didLoadData() {
        
        
        showErrorMessage(title: "", message: viewModel!.msg) { action in
            self.delegate?.btnReload()
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

//extension ReasonRejectVC:ReasonRejectVCDelegate{
//
////    func btnCloseTapped() {
////        self.dismiss(animated: true, completion: nil)
////        delegate?.btnCloseTapped()
////    }
//    
//
//}
