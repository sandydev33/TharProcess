//
//  FootorPopupView.swift
//  TharTrack
//
//  Created by Esoft on 22/10/19.
//  Copyright © 2019 Esoft. All rights reserved.
//

import UIKit

class FootorPopupView: UIView {
    
    @IBOutlet var contentView: UIView!

    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        initSubviews()
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        initSubviews()
    }
    
    func initSubviews() {
        let nib = UINib(nibName: "FootorPopupView", bundle: Bundle(for: type(of: self)))
        nib.instantiate(withOwner: self, options: nil)
        contentView.frame = bounds
        
        //imageView.contentMode = UIViewContentMode.ScaleAspectFill
        //imageView.clipsToBounds = true
        
        addSubview(contentView)
        
        //        btnLogo.contentHorizontalAlignment = .fill
        //        btnLogo.contentVerticalAlignment = .fill
        //        btnLogo.imageView?.contentMode = .scaleAspectFit
    }
    
    func loadViewFromNib() -> UIView? {
        let nibName = String(describing: FootorPopupView.self)
        let bundle = Bundle(for: type(of: self))
        let nib = UINib(nibName: nibName, bundle: bundle)
        return nib.instantiate(withOwner: self,options: nil).first as? UIView
    }
    
    @IBAction func btnRejectTapped(_ sender: UIButton) {
    }
    @IBAction func btnOnHoldTapped(_ sender: UIButton) {
    }
    @IBAction func btnApproveTapped(_ sender: UIButton) {
    }
    @IBAction func btnAddiDocsTapped(_ sender: UIButton) {
    }
    
    
}
