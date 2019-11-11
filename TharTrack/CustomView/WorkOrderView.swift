//
//  WorkOrderView.swift
//  TharTrack
//
//  Created by Esoft on 24/10/19.
//  Copyright © 2019 Esoft. All rights reserved.
//

import UIKit

protocol WorkOrderViewDelegate: class {
    func btnReceipTapped(sender:UIButton)
    func btnScanTapped(sender:UIButton)
    func btnPreReceiveTapped(sender:UIButton)
}


class WorkOrderView: UIView {

    weak var delegate:WorkOrderViewDelegate?
    @IBOutlet weak var btnCreateReceip: UIButton!{
        didSet{
            btnCreateReceip.backgroundColor = .clear
            btnCreateReceip.layer.cornerRadius = 5
            btnCreateReceip.layer.borderWidth = 2
            btnCreateReceip.layer.borderColor = UIColor.darkGray.cgColor
        }
        
    }
    @IBInspectable
    
    @IBOutlet weak var btnScanBags: UIButton!{
        didSet{
            btnScanBags.backgroundColor = .clear
            btnScanBags.layer.cornerRadius = 5
            btnScanBags.layer.borderWidth = 2
            btnScanBags.layer.borderColor = UIColor.darkGray.cgColor
        }
    }
    @IBOutlet weak var btnPreReceive: UIButton!{
        didSet{
            btnPreReceive.backgroundColor = .clear
            btnPreReceive.layer.cornerRadius = 5
            btnPreReceive.layer.borderWidth = 2
            btnPreReceive.layer.borderColor = UIColor.darkGray.cgColor
            
        }
    }
    
    
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
        let nib = UINib(nibName: "WorkOrderView", bundle: Bundle(for: type(of: self)))
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
        let nibName = String(describing: WorkOrderView.self)
        let bundle = Bundle(for: type(of: self))
        let nib = UINib(nibName: nibName, bundle: bundle)
        return nib.instantiate(withOwner: self,options: nil).first as? UIView
    }
    
   
    @IBAction func btnReceipTapped(_ sender: UIButton) {
        delegate?.btnReceipTapped(sender: sender)
    }
    @IBAction func btnScanTapped(_ sender: UIButton) {
        delegate?.btnScanTapped(sender: sender)
    }
    @IBAction func btnPreReceiveTapped(_ sender: UIButton) {
        delegate?.btnPreReceiveTapped(sender: sender)
    }
    
    
}
