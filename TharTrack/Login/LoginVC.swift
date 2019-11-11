//
//  LoginVC.swift
//  TharTrack
//
//  Created by Esoft on 15/10/19.
//  Copyright © 2019 Esoft. All rights reserved.
//

import UIKit

class LoginVC: BaseVC {

    @IBOutlet weak var txtUserName: UITextField!
    @IBOutlet weak var txtPassword: UITextField!
    
    var viewModel:LoginViewModel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel = LoginViewModel(dataSource: LoginDataSource())
        viewModel.delegate = self
        txtUserName.text = "tharsystem@gmail.com"
        txtPassword.text = "tharsystem@gmail.com"
         print(Configuration.baseURL)
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

    @IBAction func btnActionSignIn(_ sender: UIButton) {
      if (self.txtUserName.text?.count)! <= 0 {
          showErrorMessage(title: "Error....", error: CustomError.InValidUserName)
      }
      else if (self.txtPassword.text?.count)! <= 5 {
          showErrorMessage(title: "Error....", error: CustomError.InValidPasswordLength)
      }
      else {
        viewModel.validateUser(userName: txtUserName.text!, password: txtPassword.text!)
      }

    }
}

extension LoginVC:ViewModelDelegate{
    func willLoadData() {
        startLoader()
    }
    
    func didLoadData() {
        let dashboardNav: UINavigationController = storyboard?.instantiateViewController(withIdentifier: Constant.kDashboardNavigationVC) as! UINavigationController
                     
                    self.present(dashboardNav, animated: true, completion: {
                        self.stopLoader()
                    })
    }
    
    func didFail(error: CustomError) {
        showErrorMessage(title: "Error....", error: error)
        stopLoader()
    }
    
    
}
