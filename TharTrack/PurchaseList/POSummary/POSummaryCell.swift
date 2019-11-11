//
//  POSummaryCell.swift
//  TharTrack
//
//  Created by Esoft on 21/10/19.
//  Copyright © 2019 Esoft. All rights reserved.
//

import UIKit

class POSummaryCell: UITableViewCell {

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
    func setData(data : M_PONResult){
        lblTag1.text = data.poNo ?? "NA"
        lblTag2.text = data.orderStatus ?? "NA"
        lblTag3.text = data.company?.companyName ?? "NA"
        lblTag4.text = data.company?.contactPerson ?? "NA"
        lblTag5.text = data.shppingBranch?.branchName ?? "NA"
        lblTag6.text = data.shppingBranch?.email ?? "NA"
    }
}
