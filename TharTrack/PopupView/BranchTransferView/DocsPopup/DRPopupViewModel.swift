//
//  DRPopupViewModel.swift
//  TharTrack
//
//  Created by Esoft on 08/11/19.
//  Copyright © 2019 Esoft. All rights reserved.
//

import Foundation
protocol DRPopupViewModelType:ViewModelType {
    func getAllVisibleDocument()
    func requestDocuments(model:String)
}

class DRPopupViewModel: DRPopupViewModelType {
  
    var msg:String = ""
    var requestMsg:String? = nil
    var sections:[TharDocsBaseModel] = []
    var delegate: ViewModelDelegate?
    private var dataSource:DRPopupDataSourceType?
    init(dataSource:DRPopupDataSourceType) {
        self.dataSource = dataSource
    }
    func bootstrap() {
    }
    
    func getAllVisibleDocument() {
        delegate?.willLoadData()
        dataSource?.getAllVisibleDocument(completion: { [weak self] result in
            
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
                    
                    Constant.saveUploadDoc = []
                    for _ in 0..<(baseModel.result?.count)! {
                        Constant.saveUploadDoc.append(0)
                    }
                   ws.sections.append(baseModel)
                    ws.delegate?.didLoadData()
                    
                    
                case.failure(let error):
                    //UserDefaults.standard.setLoggedIn(value: true)
                    ws.delegate?.didFail(error: error)
                }
            }
        })
    }
    
    
    
    func requestDocuments(model: String) {
        delegate?.willLoadData()
        dataSource?.requestDocuments(model:model, completion: { [weak self] result in
            
            guard let ws = self else {return}
            
            DispatchQueue.main.async {
                switch result {
                case .success(let baseModel):
                    print(baseModel)
                    ws.requestMsg = baseModel.message ?? ""
                    guard let data = baseModel.result else {
                        ws.delegate?.didLoadData()
                        return
                    }
                  
                    ws.delegate?.didLoadData()
                    
                    
                case.failure(let error):
                    //UserDefaults.standard.setLoggedIn(value: true)
                    ws.delegate?.didFail(error: error)
                }
            }
        })
    }
    
    
}
