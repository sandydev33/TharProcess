//
//  BagSizeCell.swift
//  TharTrack
//
//  Created by Esoft on 31/10/19.
//  Copyright © 2019 Esoft. All rights reserved.
//

import UIKit

class BagSizeCell: UITableViewCell,UITextFieldDelegate {

    
    @IBOutlet weak var lblTag: UILabel!
    @IBOutlet weak var txtTag: UITextField!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
       
        // Configure the view for the selected state
    }
    func setData(data:M_BagSizeQty) {
        
        lblTag.text = (data.bagSize ?? "") + " Kg"
        txtTag.text = Constant.saveData[txtTag.tag]
        print(txtTag.text! , Constant.saveData)
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return false
    }
    func textFieldDidEndEditing(_ textField: UITextField) {
        let txtField = textField.text
        Constant.saveData[txtTag.tag] = txtField!
    }
    
}

