//
//  PurchaseListViewModel.swift
//  TharTrack
//
//  Created by Esoft on 21/10/19.
//  Copyright © 2019 Esoft. All rights reserved.
//

import Foundation
protocol PurchaseListViewModelType:ViewModelType {
}


class PurchaseListViewModel: PurchaseListViewModelType {
    
    var modelArray:Array<String> = []
  //  var sections: [String] = []
    var sections: [(name: String, row: [M_TabView])] = []
    var list:[M_TabView] = []
    var ponResult:PONBaseModel!
    var delegate: ViewModelDelegate?
    private var dataSource:PurchaseListDataSourceType
    init(dataSource:PurchaseListDataSourceType) {
        self.dataSource = dataSource
    }
    
    func bootstrap() {
        modelArray = ["POSummary","Address","Line Items","Customer Docs","Thar Docs"]
      self.createData()
    }
    
    func createData()  {
        
        for i in 0..<modelArray.count {
             let modelView = M_TabView()
            modelView.formId = i
            modelView.formName = modelArray[i]
            list.append(modelView)
        }
        
       sections.append((name: "", row: list))
        delegate?.didLoadData()
    }
    
   
}
