//
//  NewParchaseDataCell.swift
//  TharTrack
//
//  Created by Esoft on 16/10/19.
//  Copyright © 2019 Esoft. All rights reserved.
//

import UIKit

class NewParchaseDataCell: UITableViewCell {
    @IBOutlet weak var lblTag1: UILabel!
    @IBOutlet weak var lblTag2: UILabel!
    @IBOutlet weak var lblTag3: UILabel!
    @IBOutlet weak var lblTag4: UILabel!
    @IBOutlet weak var btnView: UIButton!
    @IBOutlet weak var btnDelete: UIButton!
    
    private var orderList:M_PurchaseDateList!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func setData(list: M_PurchaseDateList) {
        orderList = list
        lblTag1.text = orderList.orderDate ?? "NA"
        lblTag2.text = orderList.poNo ?? "NA"
        lblTag4.text = orderList.orderStatus ?? "NA"
        
        guard let data = orderList.company else {return}
        lblTag3.text = data.companyName ?? "NA"
        
}
   
    
    
}
