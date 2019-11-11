//
//  TabBarView.swift
//  TharTrack
//
//  Created by Esoft on 18/10/19.
//  Copyright © 2019 Esoft. All rights reserved.
//

import UIKit

protocol TabBarViewDelegate : class {
    func btnHomeTapped(sender:UIButton)
    func btnNotifyTapped(sender: UIButton)
    func btnProTapped(sender: UIButton)
}


class TabBarView: UIView {
    
   weak var delegate:TabBarViewDelegate?
    
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
        let nib = UINib(nibName: "TabBarView", bundle: Bundle(for: type(of: self)))
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
        let nibName = String(describing: TabBarView.self)
        let bundle = Bundle(for: type(of: self))
        let nib = UINib(nibName: nibName, bundle: bundle)
        return nib.instantiate(withOwner: self,options: nil).first as? UIView
    }
    
    @IBAction func btnHomeTapped(_ sender: UIButton) {
        delegate?.btnHomeTapped(sender: sender)
    }
    
    @IBAction func btnNotifyTapped(_ sender: UIButton) {
        delegate?.btnNotifyTapped(sender: sender)
    }
    
    @IBAction func btnProfileTapped(_ sender: UIButton) {
        delegate?.btnProTapped(sender: sender)
    }
    
}
