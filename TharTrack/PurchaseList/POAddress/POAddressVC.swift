//
//  POAddressVC.swift
//  TharTrack
//
//  Created by Esoft on 21/10/19.
//  Copyright © 2019 Esoft. All rights reserved.
//

import UIKit

class POAddressVC: BaseVC {

    @IBOutlet weak var tblView: UITableView!
    //MARK: Constant
    private let kPOAddressCell = "POAddressCell"
    var footer:FooterPopupView!
    var rejectVC:ReasonRejectVC!
    var bagSizeVC:BagSizeVC!
    var dRPopupVC:DRPopupVC!
    var viewModel:POSummaryModelView!
    var sections:[PONBaseModel] = []
    var orderID:Int? = nil
    var onHoldVC:OnHoldVC!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tblView.register(UINib(nibName: kPOAddressCell, bundle: Bundle.main), forCellReuseIdentifier: kPOAddressCell)
        tblView.estimatedRowHeight = UITableView.automaticDimension
        
        footer = FooterPopupView(frame: CGRect(x: 0, y: 0, width:0, height: 100))
        footer.hideAdditional = true
        footer.delegate = self
        tblView.tableFooterView = footer
        sections = Constant.POSections
    
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
// MARK : Table View Delegates Methods
extension POAddressVC: UITableViewDelegate , UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 0{
            return sections.count
        }
        else if section == 1 {
            return sections.count
        }else{
            return 0
        }
    }
    //    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
    //        if indexPath.section == 0 {
    //            return 60
    //        }else{
    //            return UITableView.automaticDimension
    //        }
    //    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.section == 0{
            let cell = tableView.dequeueReusableCell(withIdentifier: kPOAddressCell, for: indexPath) as! POAddressCell
            let data = sections[indexPath.row].result
            cell.setData(data: data!)
            return cell
        }else if indexPath.section == 1{
            let cell = tableView.dequeueReusableCell(withIdentifier: kPOAddressCell, for: indexPath) as! POAddressCell
            let data = sections[indexPath.row].result
            cell.setShipData(data: data!)
            return cell
        }
        else{
            return UITableViewCell()
        }
    }
}



// MARK : Base View Delegates Methods
extension POAddressVC : ViewModelDelegate{
    func willLoadData() {
        startLoader()
    }
    
    func didLoadData() {
        self.sections = viewModel.section
        Constant.POSections = viewModel.section
        tblView.reloadData()
        stopLoader()
    }
    
    func didFail(error: CustomError) {
        showErrorMessage(title: "Error....", error: error)
        stopLoader()
    }
    
}
extension POAddressVC : FootorViewDelegate{
    func btnRejectTapped(sender: UIButton) {
        let storyboard = UIStoryboard(name: Constant.kMainStoryboard, bundle: nil)
        rejectVC = storyboard.instantiateViewController(withIdentifier: Constant.kReasonRejectVC) as? ReasonRejectVC
        rejectVC.ID = orderID!
        rejectVC.delegate = self
        rejectVC.modalPresentationStyle = .overCurrentContext
        self.present(rejectVC, animated: true, completion: nil)
    }
    
    func btnOnHoldTapped(sender: UIButton) {
        let storyboard = UIStoryboard(name: Constant.kMainStoryboard, bundle: nil)
        onHoldVC = storyboard.instantiateViewController(withIdentifier: Constant.kOnHoldVC) as? OnHoldVC
        onHoldVC.ID = orderID!
        onHoldVC.delegate = self
        onHoldVC.modalPresentationStyle = .overCurrentContext
        self.present(onHoldVC, animated: true, completion: nil)
    }
    
    func btnApproveTapped(sender: UIButton) {
        let storyboard = UIStoryboard(name: Constant.kMainStoryboard, bundle: nil)
        bagSizeVC = storyboard.instantiateViewController(withIdentifier: Constant.kBagSizeVC) as? BagSizeVC
        bagSizeVC.orderID = orderID!
        bagSizeVC.delegate = self
        bagSizeVC.modalPresentationStyle = .overCurrentContext
        self.present(bagSizeVC, animated: true, completion: nil)
    }
    
    func btnAddiDocsTapped(sender: UIButton) {
        
    }
    
    
}

// MARK: Reject Popup Delegate Methods
extension POAddressVC : ReasonRejectVCDelegate{
    func btnReload() {
        self.sections = []
        self.sections = Constant.POSections
        tblView.reloadData()
    }
    
    func btnCloseTapped() {
        // rejectVC.removeFromParent()
    }
    
    
}

// MARK: OnHold Popup Delegate Methods
extension POAddressVC : OnHoldVCDelegate {
    func btnCloseOnHoldTapped() {
        
    }
    
    func btnOnHoldReload() {
        self.sections = []
        self.sections = Constant.POSections
        tblView.reloadData()
    }
    
    
}
// MARK: Approved Popup Delegate Methods
extension POAddressVC : BagSizeVCDelegate{
    func btnBagSizeReload() {
        self.sections = []
        self.sections = Constant.POSections
        tblView.reloadData()
    }
    
    func btnBagCloseTapped() {
        
    }
    
}

//MARK: Hold Popup Delegate Methods
extension POAddressVC : DRPopupVCDelegate {
    func btnDRPReload() {
        
    }
    func btnDRCloseTapped() {
    }
}
