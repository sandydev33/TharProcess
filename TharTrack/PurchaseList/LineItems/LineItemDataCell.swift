//
//  LineItemDataCell.swift
//  TharTrack
//
//  Created by Esoft on 22/10/19.
//  Copyright © 2019 Esoft. All rights reserved.
//

import UIKit

class LineItemDataCell: UITableViewCell {
    @IBOutlet weak var lblTag1: UILabel!
    @IBOutlet weak var lblTag2: UILabel!
    @IBOutlet weak var lblTag3: UILabel!
    @IBOutlet weak var lblTag4: UILabel!
    @IBOutlet weak var lblTag5: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    func setData(data:M_PurchaseItems){
        lblTag1.text = data.product?.productType?.productType ?? "NA"
        lblTag2.text = data.product?.productName ?? "NA"
        lblTag3.text = data.product?.shortDesc ?? "NA"
        lblTag4.text = String(describing: data.quantity ?? 0)
        lblTag5.text = data.product?.productUm?.pumName ?? "NA"
        
    }
    
}
