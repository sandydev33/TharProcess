//
//  POAddressCell.swift
//  TharTrack
//
//  Created by Esoft on 21/10/19.
//  Copyright © 2019 Esoft. All rights reserved.
//

import UIKit

class POAddressCell: UITableViewCell {
    @IBOutlet weak var lblHeader: UILabel!
    @IBOutlet weak var lblTag1: UILabel!
    @IBOutlet weak var lblTag2: UILabel!
    @IBOutlet weak var lblTag3: UILabel!
    @IBOutlet weak var lblTag4: UILabel!
    @IBOutlet weak var lblTag5: UILabel!
    @IBOutlet weak var lblTag6: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    func setData(data:M_PONResult){
        lblHeader.text = data.billingAddress?.addressType
        lblTag1.text = data.billingAddress?.street ?? "NA"
        lblTag2.text = data.billingAddress?.city ?? "NA"
        lblTag3.text = data.billingAddress?.state ?? "NA"
        lblTag4.text = data.billingAddress?.zipCode ?? "NA"
        lblTag5.text = data.shppingBranch?.contactPerson ?? "NA"
        lblTag6.text = data.shppingBranch?.email ?? "NA"
    }
    
    func setShipData(data:M_PONResult){
        lblHeader.text = data.shippingAddress?.addressType
        lblTag1.text = data.shippingAddress?.street ?? "NA"
        lblTag2.text = data.shippingAddress?.city ?? "NA"
        lblTag3.text = data.shippingAddress?.state ?? "NA"
        lblTag4.text = data.shippingAddress?.zipCode ?? "NA"
        lblTag5.text = data.shppingBranch?.contactPerson ?? "NA"
        lblTag6.text = data.shppingBranch?.email ?? "NA"
    }
}
