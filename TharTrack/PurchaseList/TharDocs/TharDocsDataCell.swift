//
//  TharDocsDataCell.swift
//  TharTrack
//
//  Created by Esoft on 22/10/19.
//  Copyright © 2019 Esoft. All rights reserved.
//

import UIKit

class TharDocsDataCell: UITableViewCell {
  
    @IBOutlet weak var btnCheck: UIButton!
    @IBOutlet weak var txtViewTag: UITextView!
    @IBOutlet weak var txtTag1: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
       
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func setData(data:M_DocumentDetail){
        txtTag1.text = data.documentName ?? "NA"
        btnCheck.isSelected = data.documentType?.active ?? false
    }
   
}
extension TharDocsDataCell : UITextViewDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        txtViewTag.resignFirstResponder()
        
        return true
        
    }
}
