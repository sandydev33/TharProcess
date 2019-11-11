//
//  LineItemVC.swift
//  TharTrack
//
//  Created by Esoft on 22/10/19.
//  Copyright © 2019 Esoft. All rights reserved.
//

import UIKit

class LineItemVC: BaseVC {

    @IBOutlet weak var tblView: UITableView!
    // MARK: Constant
    //MARK: Constant
    private let kLineItemCell = "LineItemCell"
    private let kLineItemDataCell = "LineItemDataCell"
    var sections:[PONBaseModel] = []
    var footer:FooterPopupView!
    var rejectVC:ReasonRejectVC!
    var bagSizeVC:BagSizeVC!
    var dRPopupVC:DRPopupVC!
    var orderID:Int? = nil
    var viewModel:POSummaryModelView!
     var onHoldVC:OnHoldVC!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tblView.register(UINib(nibName: kLineItemCell, bundle: Bundle.main), forHeaderFooterViewReuseIdentifier: kLineItemCell)
        
        tblView.register(UINib(nibName: kLineItemDataCell, bundle: Bundle.main), forCellReuseIdentifier: kLineItemDataCell)
        
        tblView.estimatedRowHeight = UITableView.automaticDimension
        tblView.rowHeight = 60
        
        
        footer = FooterPopupView(frame: CGRect(x: 0, y: 0, width:0, height: 100))
        footer.hideAdditional = true
        footer.delegate = self
        tblView.tableFooterView = footer
        sections = Constant.POSections
//        viewModel = POSummaryModelView(dataSource: POSummaryDataSource())
//        viewModel.delegate = self
//        viewModel.getPurchaseOrderByPurchaseOrderId(ID: orderID!)
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
extension LineItemVC: UITableViewDelegate , UITableViewDataSource {
    
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        
        if let header = tableView.dequeueReusableHeaderFooterView(withIdentifier: kLineItemCell) as? LineItemCell {
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
        if sections.count != 0 {
            return (sections[section].result?.purchaseItems!.count)!
        }else{
            return 0
        }
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.section == 0{
            let cell = tableView.dequeueReusableCell(withIdentifier: kLineItemDataCell, for: indexPath) as! LineItemDataCell
            let data = (sections[indexPath.section].result?.purchaseItems![indexPath.row])!
            cell.setData(data: data)
            return cell
        }
        else{
            return UITableViewCell()
        }
    }
}



// MARK : Base View Delegates Methods
extension LineItemVC : ViewModelDelegate{
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

extension LineItemVC : FootorViewDelegate{
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
extension LineItemVC : ReasonRejectVCDelegate{
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
extension LineItemVC : OnHoldVCDelegate {
    func btnCloseOnHoldTapped() {
        
    }
    
    func btnOnHoldReload() {
        self.sections = []
        self.sections = Constant.POSections
        tblView.reloadData()
    }
    
    
}
// MARK: Approved Popup Delegate Methods
extension LineItemVC : BagSizeVCDelegate{
    func btnBagSizeReload() {
        self.sections = []
        self.sections = Constant.POSections
        tblView.reloadData()
    }
    
    func btnBagCloseTapped() {
        
    }
    
}

//MARK: Hold Popup Delegate Methods
extension LineItemVC : DRPopupVCDelegate {
    func btnDRPReload() {
        
    }
    
    func btnDRCloseTapped() {
    }
}
