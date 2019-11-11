//
//  POSummaryModelView.swift
//  TharTrack
//
//  Created by Esoft on 04/11/19.
//  Copyright © 2019 Esoft. All rights reserved.
//

import Foundation
protocol POSummaryModelViewType:ViewModelType {
    func getPurchaseOrderByPurchaseOrderId(ID:Int)
}

class POSummaryModelView : POSummaryModelViewType{
    
    var section:[PONBaseModel] = []
    var msg:String = ""
    var delegate: ViewModelDelegate?
    private var dataSource:POSummaryDataSourceType
    init(dataSource:POSummaryDataSourceType) {
        self.dataSource = dataSource
    }
    func bootstrap() {
    }
    
    func getPurchaseOrderByPurchaseOrderId(ID: Int) {
        delegate?.willLoadData()
        dataSource.getPurchaseOrderByPurchaseOrderId(ID: ID)  { [weak self] result in
            
            guard let ws = self else {return}
            
            DispatchQueue.main.async {
                switch result {
                case .success(let baseModel):
                    print(baseModel)
                    guard baseModel.result != nil else {
                        ws.msg = baseModel.message ?? ""
                        ws.delegate?.didLoadData()
                        return
                        
                    }
                    self?.section.append(baseModel)
                    ws.delegate?.didLoadData()
                    
                    
                case.failure(let error):
                    //UserDefaults.standard.setLoggedIn(value: true)
                    ws.delegate?.didFail(error: error)
                }
            }
        }
    }
}
