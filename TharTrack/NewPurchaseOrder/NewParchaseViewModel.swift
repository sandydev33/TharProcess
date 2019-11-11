//
//  NewParchaseViewModel.swift
//  TharTrack
//
//  Created by Esoft on 15/10/19.
//  Copyright © 2019 Esoft. All rights reserved.
//

import Foundation


class NewParchaseViewModel:ViewModelType {
    
    var delegate: ViewModelDelegate?
    var sections: [(section: M_PurchaseDateList, row: M_PurchaseCompany)] = []
    var msg:String = ""
    private let dataSource:NewPurchaseDataSourceType
    
    init(dataSource:NewPurchaseDataSourceType) {
        self.dataSource = dataSource
    }
    
    func bootstrap() {
        createData()
    }
    
    func createData() {
         delegate?.willLoadData()
        dataSource.getAllPurchaseOrderList { [weak self] result in
            
            guard let ws = self else {return}
            
            DispatchQueue.main.async {
                switch result {
                case .success(let baseModel):
                    print(baseModel)
                    guard let data = baseModel.result else {
                        ws.msg = baseModel.message ?? ""
                        ws.delegate?.didLoadData()
                        return
                        
                    }
                    for item in data {
                        
                        if let company = item.company {
                            self?.sections.append((section: item, row: company))
                        }
                    }
                    ws.delegate?.didLoadData()
                    
                    
                case.failure(let error):
                    //UserDefaults.standard.setLoggedIn(value: true)
                    ws.delegate?.didFail(error: error)
                }
            }
        }
    }
    
}
