//
//  ForgotVC.swift
//  TharTrack
//
//  Created by Esoft on 15/10/19.
//  Copyright © 2019 Esoft. All rights reserved.
//

import UIKit

class ForgotVC: BaseVC {

    @IBOutlet weak var txtUserName: UITextField!
    
    var viewModel:ForgotViewModel!
    override func viewDidLoad() {
        super.viewDidLoad()
         viewModel = ForgotViewModel(dataSource: ForgotDataSource())
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
    @IBAction func btnSubmitTapped(_ sender: UIButton) {
        if (self.txtUserName.text?.count)! <= 0 {
            showErrorMessage(title: "Error....", error: CustomError.InValidUserName)
        }
        
        else {
            viewModel.forgotUser(userName: txtUserName.text!)
        }
    }
    
}
extension ForgotVC : ViewModelDelegate {
    func willLoadData() {
        startLoader()
    }
    
    func didLoadData() {
        
        showErrorMessage(title: "", message: viewModel.msg) { action in
            let loginVC = Constant.getViewController(storyboard: Constant.kMainStoryboard, identifier: Constant.kLoginVC, type: LoginVC.self)
            self.present(loginVC, animated: true, completion: {
                self.stopLoader()
            })
        }
    }
    
    func didFail(error: CustomError) {
        showErrorMessage(title: "Error....", error: error)
        stopLoader()
    }

}
