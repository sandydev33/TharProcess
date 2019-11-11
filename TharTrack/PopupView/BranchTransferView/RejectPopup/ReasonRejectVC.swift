//
//  ReasonRejectVC.swift
//  TharTrack
//
//  Created by Esoft on 18/10/19.
//  Copyright © 2019 Esoft. All rights reserved.
//

import UIKit

protocol ReasonRejectVCDelegate : class{
    func btnCloseTapped()
}

class ReasonRejectVC: UIViewController {

    weak var delegate:ReasonRejectVCDelegate?
    override func viewDidLoad() {
        super.viewDidLoad()

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

    @IBAction func btnOutSideTapped(_ sender: UIButton) {
        self.dismiss(animated: true, completion: nil)
            delegate?.btnCloseTapped()
    }
}

//extension ReasonRejectVC:ReasonRejectVCDelegate{
//
////    func btnCloseTapped() {
////        self.dismiss(animated: true, completion: nil)
////        delegate?.btnCloseTapped()
////    }
//    
//
//}
