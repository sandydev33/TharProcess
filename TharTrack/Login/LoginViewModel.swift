//
//  LoginViewModel.swift
//  TharTrack
//
//  Created by Esoft on 15/10/19.
//  Copyright © 2019 Esoft. All rights reserved.
//

import Foundation

protocol LoginViewModelType:ViewModelType {
    func validateUser(userName:String, password:String)
}

class LoginViewModel:LoginViewModelType {
  
    var delegate: ViewModelDelegate?
    private let dataSource:LoginDataSourceType!
    init(dataSource:LoginDataSourceType) {
        self.dataSource = dataSource
    }
    func bootstrap() {
           
       }
    
    func validateUser(userName:String, password:String){
        delegate?.willLoadData()
        dataSource.validateUser(userName: userName, password: password) { [weak self] result in
            
            guard let ws = self else {return}
            
            DispatchQueue.main.async {
                switch result {
                case .success(let baseModel):
                    print(baseModel)
                    
                        let user = M_Result(token: baseModel.result?.token ?? "", userName: baseModel.result?.username ?? "", profileImage: baseModel.result?.profileImage ?? "", roles: baseModel.result?.roles ?? [""])
                        
                        
                        if let strURL = user.profileImage, let url = URL(string: strURL) {
                            let ImageUrl = url.lastPathComponent
                            UserDefaults.standard.setProfileImage(value: ImageUrl)
                        }

                        UserDefaults.standard.setUserToken(value:user.token!)
                        UserDefaults.standard.setUserName(value:user.username! )
                        UserDefaults.standard.setLoggedIn(value: true)
                        ws.delegate?.didLoadData()
                    
                    
                case.failure(let error):
                    //UserDefaults.standard.setLoggedIn(value: true)
                    ws.delegate?.didFail(error: error)
                }
            }
        }
    }
}
