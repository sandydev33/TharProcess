//
//  TharDocsViewModel.swift
//  TharTrack
//
//  Created by Esoft on 06/11/19.
//  Copyright © 2019 Esoft. All rights reserved.
//

import Foundation

protocol TharDocsViewModelType:ViewModelType {
    func getAllTharDocs()
}

class TharDocsViewModel: TharDocsViewModelType {
   
    var msg:String = ""
    var sections : [TharDocsBaseModel] = []
    var delegate: ViewModelDelegate?
    private var dataSource:TharDocsDataSourceType?
    
    init(dataSource:TharDocsDataSourceType) {
        self.dataSource = dataSource
    }
    func bootstrap() {
        
    }
    func getAllTharDocs() {
        delegate?.willLoadData()
        dataSource?.getAllTharDocs(comletion:{ [weak self] result in
            
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
                    ws.sections.append(baseModel)
                    ws.delegate?.didLoadData()
                    
                    
                case.failure(let error):
                    //UserDefaults.standard.setLoggedIn(value: true)
                    ws.delegate?.didFail(error: error)
                }
            }
            }
)
    }
}
