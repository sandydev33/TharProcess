//
//  ApprovedPurchViewModel.swift
//  TharTrack
//
//  Created by Esoft on 15/10/19.
//  Copyright © 2019 Esoft. All rights reserved.
//

import Foundation

class ApprovedPurchViewModel: ViewModelType {
    
    
    var delegate: ViewModelDelegate?
    private var dataSource:ApprovedPurchDataSourceType
    
    init(dataSource:ApprovedPurchDataSourceType) {
        self.dataSource = dataSource
    }
    
    func bootstrap() {
        
    }
    func createData() {
        
    }
}
