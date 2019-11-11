//
//  CustomerDocsDataCell.swift
//  TharTrack
//
//  Created by Esoft on 22/10/19.
//  Copyright © 2019 Esoft. All rights reserved.
//

import UIKit

class CustomerDocsDataCell: UITableViewCell {

    @IBOutlet weak var lblTag1: UILabel!
    @IBOutlet weak var lblTag2: UILabel!
    @IBOutlet weak var lblTag3: UILabel!
    @IBOutlet weak var btnCheck: UIButton!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func setData(data:M_PurchaseOrderDocResp){
        lblTag1.text = data.documentDetail?.documentType?.documentType ?? "NA"
        lblTag2.text = data.documentDetail?.documentName ?? "NA"
        lblTag3.text = data.documentDetail?.modifiedBy ?? "NA"
        
        btnCheck.isSelected = data.isCheck ?? false
    }
    
}
