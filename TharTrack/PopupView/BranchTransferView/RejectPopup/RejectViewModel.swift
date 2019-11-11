//
//  RejectViewModel.swift
//  TharTrack
//
//  Created by Esoft on 05/11/19.
//  Copyright © 2019 Esoft. All rights reserved.
//

import Foundation

protocol RejectViewModelType:ViewModelType {
    func getRejectPurchaseOrder(ID:Int , comment:String)
}

class RejectViewModel: RejectViewModelType {
    var msg:String = ""
    private var dataSource:RejectDataSourceType
    var delegate: ViewModelDelegate?
    init(dataSource:RejectDataSourceType) {
        self.dataSource = dataSource
    }
    func bootstrap() {
        
    }
    func getRejectPurchaseOrder(ID: Int, comment: String) {
        delegate?.willLoadData()
        dataSource.getRejectPurchaseOrder(ID: ID, comment: comment) { [weak self] result in
            
            guard let ws = self else {return}
            
            DispatchQueue.main.async {
                switch result {
                case .success(let baseModel):
                    print(baseModel)
                     ws.msg = baseModel.message ?? ""
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
