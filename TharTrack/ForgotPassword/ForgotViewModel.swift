//
//  ForgotViewModel.swift
//  TharTrack
//
//  Created by Esoft on 15/10/19.
//  Copyright © 2019 Esoft. All rights reserved.
//

import Foundation

protocol ForgotViewModelType:ViewModelType {
    
    func forgotUser(userName:String)
    
}

class ForgotViewModel: ForgotViewModelType {
    var msg:String = ""
    var delegate: ViewModelDelegate?
    private let dataSource:ForgotDataSourceType
    
    init(dataSource:ForgotDataSourceType) {
       self.dataSource = dataSource
    }
    func bootstrap() {
    }
    func forgotUser(userName: String) {
        delegate?.willLoadData()
        dataSource.forgotUser(userName: userName) { [weak self] result in
            
            guard let ws = self else {return}
            
            DispatchQueue.main.async {
                switch result {
                case .success(let baseModel):
                    print(baseModel)
                    self?.msg = baseModel.message ?? ""
                    ws.delegate?.didLoadData()

                case.failure(let error):
                    //UserDefaults.standard.setLoggedIn(value: true)
                    ws.delegate?.didFail(error: error)
                }
            }
        }
    }
    
}
