//
//  ScanBagsViewModel.swift
//  TharTrack
//
//  Created by Esoft on 15/10/19.
//  Copyright © 2019 Esoft. All rights reserved.
//

import Foundation

class ScanBagsViewModel: ViewModelType {
 
    var delegate: ViewModelDelegate?
 
    private var dataSource:ScanBagsDataSourceType
    
    init(dataSource:ScanBagsDataSourceType) {
        self.dataSource = dataSource
    }
    
    func bootstrap() {
    }
}
