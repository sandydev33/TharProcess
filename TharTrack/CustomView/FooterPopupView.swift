//
//  FootorPopupView.swift
//  TharTrack
//
//  Created by Esoft on 22/10/19.
//  Copyright © 2019 Esoft. All rights reserved.
//

import UIKit

protocol FootorViewDelegate : class{
    func btnRejectTapped(sender:UIButton)
    func btnOnHoldTapped(sender:UIButton)
    func btnApproveTapped(sender:UIButton)
    func btnAddiDocsTapped(sender:UIButton)
    
    }


@IBDesignable
class FooterPopupView: UIView {
    @IBOutlet weak var btnAddiWidthConstraint: NSLayoutConstraint!
    @IBOutlet weak var btnApproveWidthConstraint: NSLayoutConstraint!
    @IBOutlet weak var btnHoldWidthConstraint: NSLayoutConstraint!
    @IBOutlet weak var btnRejectWidthConstraint: NSLayoutConstraint!
    
    @IBOutlet weak var btnReject: UIButton!{
        didSet{
            btnReject.backgroundColor = .clear
            btnReject.layer.cornerRadius = 10
            btnReject.layer.borderWidth = 2
            btnReject.layer.borderColor = UIColor.red.cgColor
        }
        
    }
    @IBInspectable
 
    @IBOutlet weak var btnOnHold: UIButton!{
        didSet{
            btnOnHold.backgroundColor = .clear
            btnOnHold.layer.cornerRadius = 10
            btnOnHold.layer.borderWidth = 2
            btnOnHold.layer.borderColor = UIColor.darkGray.cgColor
        }
    }
    @IBOutlet weak var btnApprove: UIButton!{
        didSet{
            btnApprove.backgroundColor = .clear
            btnApprove.layer.cornerRadius = 10
            btnApprove.layer.borderWidth = 2
            btnApprove.layer.borderColor = UIColor.init(named: Constant.kNavGreen)?.cgColor
           // btnApprove.layer.borderColor = UIColor.init(hex: "83BD65")?.cgColor
        }
    }
    @IBOutlet weak var btnAddiDocs: UIButton!{
        didSet{
            btnAddiDocs.backgroundColor = .clear
            btnAddiDocs.layer.cornerRadius = 10
            btnAddiDocs.layer.borderWidth = 2
            btnAddiDocs.layer.borderColor = UIColor.init(named: Constant.kAddiDocBtn)?.cgColor
        }
    }
    
    
    weak var delegate:FootorViewDelegate?
    
    @IBOutlet var contentView: UIView!

    
    //    poopup Btn Hide function
    @IBInspectable var hideReject: Bool = false {
        didSet {
             updateRejectButton()
        }
    }
    @IBInspectable var hideOnHold: Bool = false {
        didSet {
             updateOnHoldButton()
        }
    }
    
    @IBInspectable var hideApproved: Bool = false {
        didSet {
          updateApprovedButton()
        }
    }
    
    @IBInspectable var hideAdditional: Bool = false {
        didSet {
            updateAddtionalButton()
        }
    }
    
    private func updateRejectButton() {
        if self.hideReject {
            btnReject.isHidden = self.hideReject
            btnRejectWidthConstraint.constant = 0
        }
        else {
            btnReject.isHidden = self.hideReject
          //  btnRejectWidthConstraint.constant = 77
        }
    }
    
    private func updateOnHoldButton() {
        if self.hideOnHold {
            btnOnHold.isHidden = self.hideOnHold
            btnHoldWidthConstraint.constant = 0
        }
        else {
            btnOnHold.isHidden = self.hideOnHold
          //  btnHoldWidthConstraint.constant = 70
        }
    }
    private func updateApprovedButton() {
        if self.hideApproved {
            btnApproveWidthConstraint.constant = 0
            btnApprove.isHidden = self.hideApproved
            btnApprove.translatesAutoresizingMaskIntoConstraints = false
        }
        else {
            btnApprove.isHidden = self.hideApproved
         //   btnApproveWidthConstraint.constant = 85
        }
    }
    private func updateAddtionalButton() {
        if self.hideAdditional {
            btnAddiDocs.isHidden = self.hideAdditional
            btnAddiWidthConstraint.constant = 0
            
        }
        else {
            btnAddiDocs.isHidden = self.hideAdditional
           // btnAddiWidthConstraint.constant = 165
        }
    }
    
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
        let nib = UINib(nibName: "FooterPopupView", bundle: Bundle(for: type(of: self)))
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
        let nibName = String(describing: FooterPopupView.self)
        let bundle = Bundle(for: type(of: self))
        let nib = UINib(nibName: nibName, bundle: bundle)
        return nib.instantiate(withOwner: self,options: nil).first as? UIView
    }
    
    @IBAction func btnRejectTapped(_ sender: UIButton) {
        delegate?.btnRejectTapped(sender: sender)
    }
    @IBAction func btnOnHoldTapped(_ sender: UIButton) {
         delegate?.btnOnHoldTapped(sender: sender)
    }
    @IBAction func btnApproveTapped(_ sender: UIButton) {
        delegate?.btnApproveTapped(sender: sender)
    }
    @IBAction func btnAddiDocsTapped(_ sender: UIButton) {
        delegate?.btnAddiDocsTapped(sender: sender)
    }
    
    
}
