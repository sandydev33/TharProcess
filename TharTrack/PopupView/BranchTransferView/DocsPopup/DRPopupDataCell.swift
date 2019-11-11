//
//  DRPopupDataCell.swift
//  TharTrack
//
//  Created by Esoft on 31/10/19.
//  Copyright © 2019 Esoft. All rights reserved.
//

import UIKit

class DRPopupDataCell: UITableViewCell {

    @IBOutlet weak var txtTag1: UILabel!
    @IBOutlet weak var txtTag2: UILabel!
    @IBOutlet weak var btnCheckBox: UIButton!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func setData(data: M_DocumentDetail) {
        txtTag1.text = data.documentType?.documentType ?? "NA"
        txtTag2.text = data.documentName ?? "NA"
        btnCheckBox.tag = data.documentId ?? 0
        if Constant.saveUploadDoc[txtTag1.tag] != 0 {
            btnCheckBox.isSelected = true
        }
        
    }
    @IBAction func btnCheckTapped(_ sender: UIButton) {
        if btnCheckBox.isSelected {
            Constant.saveUploadDoc[txtTag1.tag] =  0
            sender.isSelected = false
            
        }else{
        Constant.saveUploadDoc[txtTag1.tag] = sender.tag
            sender.isSelected = true
        }
    }
}
