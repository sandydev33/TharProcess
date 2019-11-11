//
//  NewPurchaseVC.swift
//  TharTrack
//
//  Created by Esoft on 14/10/19.
//  Copyright © 2019 Esoft. All rights reserved.
//

import UIKit

class NewPurchaseVC: BaseViewController {
    

    @IBOutlet weak var headerView: HeaderView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        headerView.contentView.frame = CGRect(x: 0, y: 0, width: view.bounds.size.width, height: headerView.frame.size.height)
        headerView.delegate = self
        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}

extension NewPurchaseVC : HeaderViewDelegate {
    
    func btnMenuTapped(sender: UIButton ) {
        onSlideMenuButtonPressed(sender)
        
    }
    
    func btnProfileTapped(sender: UIButton) {
        
    }
    
    func btnLogoutTapped(sender: UIButton) {
        
    }
    
}
