//
//  PreChecklistViewModel.swift
//  TharTrack
//
//  Created by Esoft on 15/10/19.
//  Copyright © 2019 Esoft. All rights reserved.
//

import Foundation

class PreChecklistViewModel: ViewModelType {
    
    
    var delegate: ViewModelDelegate?
    
    private var dataSource:PreChecklistDataSourceType
    
    init(dataSource:PreChecklistDataSourceType) {
        self.dataSource = dataSource
    }
    func bootstrap() {
        
    }
}
