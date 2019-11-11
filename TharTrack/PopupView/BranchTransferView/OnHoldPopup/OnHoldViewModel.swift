//
//  OnHoldViewModel.swift
//  TharTrack
//
//  Created by Esoft on 05/11/19.
//  Copyright © 2019 Esoft. All rights reserved.
//

import Foundation

protocol OnHoldViewModelType:ViewModelType {
    func getOnHoldPurchaseOrder(ID:Int,comment:String)
}
class OnHoldViewModel: OnHoldViewModelType {
   var msg:String = ""
     private var dataSource:OnHoldDataSourceType
    init(dataSource:OnHoldDataSourceType) {
        self.dataSource = dataSource
    }
    var delegate: ViewModelDelegate?
    func bootstrap() {
        
    }
    func getOnHoldPurchaseOrder(ID: Int, comment: String) {
        delegate?.willLoadData()
        dataSource.getOnHoldPurchaseOrder(ID: ID, comment: comment) { [weak self] result in
            
            guard let ws = self else {return}
            
            DispatchQueue.main.async {
                switch result {
                case .success(let baseModel):
                    print(baseModel)
                    self!.msg = baseModel.message ?? ""
                    guard baseModel.result != nil else {
                        ws.delegate?.didLoadData()
                        return
                        
                    }
                    
                    Constant.POSections = []
                    Constant.POSections = [baseModel]
                    ws.delegate?.didLoadData()
                    
                    
                case.failure(let error):
                    //UserDefaults.standard.setLoggedIn(value: true)
                    ws.delegate?.didFail(error: error)
                }
            }
        }
    }
}
