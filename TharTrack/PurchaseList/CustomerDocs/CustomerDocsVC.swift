//
//  CustomerDocsVC.swift
//  TharTrack
//
//  Created by Esoft on 22/10/19.
//  Copyright © 2019 Esoft. All rights reserved.
//

import UIKit

class CustomerDocsVC: BaseVC {

    @IBOutlet weak var tblView: UITableView!
    // MARK: Constant
    //MARK: Constant
    private let kCustomerDocsCell = "CustomerDocsCell"
    private let kCustomerDocsDataCell = "CustomerDocsDataCell"
     var footer:FooterPopupView!
    var rejectVC:ReasonRejectVC!
    var bagSizeVC:BagSizeVC!
    var dRPopupVC:DRPopupVC!
    var sections:[PONBaseModel] = []
    var orderID:Int? = nil
    var viewModel:POSummaryModelView!
    var onHoldVC:OnHoldVC!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tblView.register(UINib(nibName: kCustomerDocsCell, bundle: Bundle.main), forHeaderFooterViewReuseIdentifier: kCustomerDocsCell)
        
        tblView.register(UINib(nibName: kCustomerDocsDataCell, bundle: Bundle.main), forCellReuseIdentifier: kCustomerDocsDataCell)
        
        tblView.estimatedRowHeight = UITableView.automaticDimension
        tblView.rowHeight = 60
        
        footer = FooterPopupView(frame: CGRect(x: 0, y: 0, width:0, height: 100))
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
extension CustomerDocsVC: UITableViewDelegate , UITableViewDataSource {
    
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        
        if let header = tableView.dequeueReusableHeaderFooterView(withIdentifier: kCustomerDocsCell) as? CustomerDocsCell {
            header.frame = CGRect(x: 0, y: 0, width: tableView.bounds.width, height: 80)
            header.layoutIfNeeded()
            return header
        }
        return UIView()
    }
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 80
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return sections.count
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if sections.count != 0{
            return (sections[section].result?.purchaseOrderDocResp!.count)!
        }else{
            return 0
        }
    }
     
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.section == 0{
            let cell = tableView.dequeueReusableCell(withIdentifier: kCustomerDocsDataCell, for: indexPath) as! CustomerDocsDataCell
            let data = sections[indexPath.section].result?.purchaseOrderDocResp![indexPath.row]
            cell.setData(data: data!)
            return cell
        }
        else{
            return UITableViewCell()
        }
    }
}



// MARK : Base View Delegates Methods
extension CustomerDocsVC : ViewModelDelegate{
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

extension CustomerDocsVC : FootorViewDelegate{
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
        let storyboard = UIStoryboard(name: Constant.kMainStoryboard, bundle: nil)
        dRPopupVC = storyboard.instantiateViewController(withIdentifier: Constant.kDRPopupVC) as? DRPopupVC
        dRPopupVC.orderID = orderID!
        dRPopupVC.delegate = self
        dRPopupVC.modalPresentationStyle = .overCurrentContext
        self.present(dRPopupVC, animated: true, completion: nil)
    }
    
    
}
// MARK: Reject Popup Delegate Methods
extension CustomerDocsVC : ReasonRejectVCDelegate{
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
extension CustomerDocsVC : OnHoldVCDelegate {
    func btnCloseOnHoldTapped() {
        
    }
    
    func btnOnHoldReload() {
        self.sections = []
        self.sections = Constant.POSections
        tblView.reloadData()
    }
    
    
}
// MARK: Approved Popup Delegate Methods
extension CustomerDocsVC : BagSizeVCDelegate{
    func btnBagSizeReload() {
        self.sections = []
        self.sections = Constant.POSections
        tblView.reloadData()
    }
    
    func btnBagCloseTapped() {
        
    }
}

//MARK: Hold Popup Delegate Methods
extension CustomerDocsVC : DRPopupVCDelegate {
    func btnDRPReload() {
        
    }
    
    func btnDRCloseTapped() {
    }
}
