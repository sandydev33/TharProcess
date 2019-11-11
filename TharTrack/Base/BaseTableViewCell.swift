//
//  BaseTableViewCell.swift
//  TharTrack
//
//  Created by Esoft on 01/11/19.
//  Copyright © 2019 Esoft. All rights reserved.
//

import UIKit

class BaseTableViewCell: UITableViewCell {

    var textField: UITextField!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}

extension BaseTableViewCell : UITextFieldDelegate {
    
}
