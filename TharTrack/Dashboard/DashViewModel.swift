//
//  DashViewModel.swift
//  TharTrack
//
//  Created by Esoft on 15/10/19.
//  Copyright © 2019 Esoft. All rights reserved.
//

import Foundation


class DashViewModel: ViewModelType {
   
    var delegate: ViewModelDelegate?
    
    private var dataSource:DashDataSourceType
    
    init(dataSource:DashDataSourceType) {
        self.dataSource = dataSource
    }
    func bootstrap() {
        
    }
    
    
}
