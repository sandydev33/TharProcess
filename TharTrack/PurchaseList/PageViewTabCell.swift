//
//  PageViewTabCell.swift
//  CampBell
//
//  Created by apple on 11/04/19.
//  Copyright © 2019 ESoft Technologies. All rights reserved.
//

import UIKit

class PageViewTabCell: UICollectionViewCell {
    
    @IBOutlet weak var lblTitle: UILabel!
    @IBOutlet weak var indicatorView: UIView!
    
    override var isSelected: Bool {
        didSet {
            UIView.animate(withDuration: 0.30) {
               // if #available(iOS 11.0, *) {
                    self.indicatorView.backgroundColor = self.isSelected ? UIColor.TabSelection : UIColor.clear
//                } else {
//                    self.indicatorView.backgroundColor = self.isSelected ? UIColor.TabSelection
//                }
                self.layoutIfNeeded()
            }
        }
    }
    
    func setData(data: String, selectedIndex: Int) {
        lblTitle.text = data
    }
    
    func setData(form: M_ChildForm, selectedIndex: Int) {
        lblTitle.text = form.formName
    }
}
