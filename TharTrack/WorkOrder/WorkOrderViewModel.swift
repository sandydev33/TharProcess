//
//  WorkOrderViewModel.swift
//  TharTrack
//
//  Created by Esoft on 15/10/19.
//  Copyright © 2019 Esoft. All rights reserved.
//

import Foundation

class WorkOrderViewModel: ViewModelType {
    
    var delegate: ViewModelDelegate?
    private var dataSource:WorkOrderDataSourceType
    
    init(dataSource:WorkOrderDataSourceType) {
        self.dataSource = dataSource
    }
    func bootstrap() {
        
    }
    
  
}
