//
//  HeaderView.swift
//  TharTrack
//
//  Created by Esoft on 14/10/19.
//  Copyright © 2019 Esoft. All rights reserved.
//

import UIKit


protocol HeaderViewDelegate: class {
    func btnMenuTapped(sender:UIButton)
    func btnProfileTapped(sender: UIButton)
    func btnLogoutTapped(sender: UIButton)
  
}

@IBDesignable
class HeaderView: UIView {
    
weak var delegate: HeaderViewDelegate?
  
    @IBOutlet weak var BtnMenu: UIButton!
    @IBOutlet weak var headerLbl: UILabel!
    @IBOutlet var contentView: UIView!
    @IBOutlet weak var btnProfile: UIButton!
    @IBOutlet weak var btnLogout: UIButton!
    var headerName = ""
    
    @IBInspectable var lblHeader: String = "" {
        didSet{
            headerLbl.text! = lblHeader
        }
    }
    
    @IBInspectable var hideProfile: Bool = false {
        didSet {
            updateProfileButton()
        }
    }
    @IBInspectable var hideLogout: Bool = false {
        didSet {
            updateLogoutButton()
        }
    }
    
    private func updateProfileButton() {
        if self.hideProfile {
            btnProfile.isHidden = self.hideProfile
           
        }
        else {
            btnProfile.isHidden = self.hideProfile
          
        }
    }
    
    private func updateLogoutButton() {
        if self.hideLogout {
            btnLogout.isHidden = self.hideLogout
         
        }
        else {
            btnLogout.isHidden = self.hideLogout
        }
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        initSubviews()
    }

    override init(frame: CGRect) {
        super.init(frame: frame)
        initSubviews()
    }

    func initSubviews() {
        let nib = UINib(nibName: "HeaderView", bundle: Bundle(for: type(of: self)))
        nib.instantiate(withOwner: self, options: nil)
        contentView.frame = bounds
       print(UserDefaults.standard.getProfileImage())
        self.btnProfile.setImage(Constant.getImage(fileName: UserDefaults.standard.getProfileImage()), for: .normal)
         //
        //imageView.contentMode = UIViewContentMode.ScaleAspectFill
        //imageView.clipsToBounds = true
     
        addSubview(contentView)
        
        //        btnLogo.contentHorizontalAlignment = .fill
        //        btnLogo.contentVerticalAlignment = .fill
        //        btnLogo.imageView?.contentMode = .scaleAspectFit
    }

    func loadViewFromNib() -> UIView? {
        let nibName = String(describing: HeaderView.self)
        let bundle = Bundle(for: type(of: self))
        let nib = UINib(nibName: nibName, bundle: bundle)
        return nib.instantiate(withOwner: self,options: nil).first as? UIView
    }
    @IBAction func btnProfileTapped(_ sender: UIButton) {
    }
    
    @IBAction func btnLogoutTapped(_ sender: UIButton) {
        delegate?.btnLogoutTapped(sender: sender)
    }
    @IBAction func btnMenuTapped(_ sender: UIButton) {
        delegate?.btnMenuTapped(sender: sender)
    }
   
 
}
