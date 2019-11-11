//
//  BagSizeViewModel.swift
//  TharTrack
//
//  Created by Esoft on 05/11/19.
//  Copyright © 2019 Esoft. All rights reserved.
//

import Foundation

protocol BagSizeViewModelType:ViewModelType {
     func getAllActiveBagSize()
     func getAllBranch()
    func approvePurchaseOrder(ID: Int, bagSize: String)
}

class BagSizeViewModel: BagSizeViewModelType {
  
    var msg:String = ""
    var approveMsg:String? = nil
    var sections :[BagSize] = []
    var branchSection : [AllBranchBaseModel] = []
    var PONSection : PONBaseModel!
    func bootstrap() {
    }
    private var dataSource: BagSizeDataSourceType?
    init(dataSource:BagSizeDataSourceType) {
        self.dataSource = dataSource
    }
    var delegate: ViewModelDelegate?
    func getAllActiveBagSize() {
        delegate?.willLoadData()
        dataSource?.getAllActiveBagSize(completion: { [weak self] result in
            
            guard let ws = self else {return}
            
            DispatchQueue.main.async {
                switch result {
                case .success(let baseModel):
                    print(baseModel)
                    self!.msg = baseModel.message ?? ""
                    guard baseModel.result != nil else {
                        ws.msg = baseModel.message ?? ""
                      ws.delegate?.didLoadData()
                        return
                        
                    }
                    self?.sections.append(baseModel)
                     ws.getAllBranch()
                    Constant.saveData = []
                    for _ in 0..<(baseModel.result?.count)! {
                        Constant.saveData.append("")
                    }
                  //  ws.delegate?.didLoadData()
                case.failure(let error):
                    //UserDefaults.standard.setLoggedIn(value: true)
                    ws.delegate?.didFail(error: error)
                }
            }
        })
        
    }
    
    
    func getAllBranch() {
        delegate?.willLoadData()
        dataSource?.getAllBranch(completion: { [weak self] result in
            
            guard let ws = self else {return}
            
            DispatchQueue.main.async {
                switch result {
                case .success(let baseModel):
                    print(baseModel)
                    self!.msg = baseModel.message ?? ""
                    guard baseModel.result != nil else {
                        ws.msg = baseModel.message ?? ""
                        ws.delegate?.didLoadData()
                        return
                        
                    }
                    ws.branchSection.append(baseModel)
                    ws.delegate?.didLoadData()
                case.failure(let error):
                    //UserDefaults.standard.setLoggedIn(value: true)
                    ws.delegate?.didFail(error: error)
                }
            }
        })
    }
    
    
    func approvePurchaseOrder(ID: Int, bagSize: String) {
        delegate?.willLoadData()
        dataSource?.approvePurchaseOrder(ID: ID, bagSize: bagSize, completion: { [weak self] result in
            
            guard let ws = self else {return}
            
            DispatchQueue.main.async {
                switch result {
                case .success(let baseModel):
                    print(baseModel)
                    self!.approveMsg = baseModel.message ?? ""
                    guard baseModel.result != nil else {
                        ws.approveMsg = baseModel.message ?? ""
                        ws.delegate?.didLoadData()
                        return
                        
                    }
                    ws.PONSection = baseModel
                    Constant.POSections = []
                    Constant.POSections = [baseModel]
                    ws.delegate?.didLoadData()
                case.failure(let error):
                    //UserDefaults.standard.setLoggedIn(value: true)
                    ws.delegate?.didFail(error: error)
                }
            }
        })
    }
    

    
}
