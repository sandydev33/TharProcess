//
//  POSummaryVC.swift
//  TharTrack
//
//  Created by Esoft on 21/10/19.
//  Copyright © 2019 Esoft. All rights reserved.
//

import UIKit

class POSummaryVC: BaseVC {

    @IBOutlet weak var tblView: UITableView!
    // MARK: Constant
    //MARK: Constant
    private let kPOSummaryCell = "POSummaryCell"
    var footer:FooterPopupView!
    
    var rejectVC:ReasonRejectVC!
    var bagSizeVC:BagSizeVC!
    var dRPopupVC:DRPopupVC!
    var onHoldVC:OnHoldVC!
    
    var sections:[PONBaseModel] = []
    var orderID:Int? = nil
    var viewModel:POSummaryModelView!
    var pageViewVC:PageViewVC!
    override func viewDidLoad() {
        super.viewDidLoad()

        tblView.register(UINib(nibName: kPOSummaryCell, bundle: Bundle.main), forCellReuseIdentifier: kPOSummaryCell)
        tblView.estimatedRowHeight = UITableView.automaticDimension
        
        footer = FooterPopupView(frame: CGRect(x: 0, y: 0, width:0, height: 100))
        footer.hideAdditional = true
        footer.delegate = self
       
        
        tblView.tableFooterView = footer
        viewModel = POSummaryModelView(dataSource: POSummaryDataSource())
        viewModel.delegate = self
        sections = Constant.POSections
        if sections.count == 0 {
             viewModel.getPurchaseOrderByPurchaseOrderId(ID: orderID!)
        }
       
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
    override func viewWillTransition(to size: CGSize, with coordinator: UIViewControllerTransitionCoordinator) {
        super.viewWillTransition(to: size, with: coordinator)
        
    }
}
// MARK : Table View Delegates Methods
extension POSummaryVC: UITableViewDelegate , UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 0{
            return sections.count
        }else{
            return 0
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.section == 0{
            let cell = tableView.dequeueReusableCell(withIdentifier: kPOSummaryCell, for: indexPath) as! POSummaryCell
            let data = sections[indexPath.row].result
            cell.setData(data: data!)
            return cell
        }
        else{
            return UITableViewCell()
        }
    }
}



// MARK : Base View Delegates Methods
extension POSummaryVC : ViewModelDelegate{
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


extension POSummaryVC : FootorViewDelegate{
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
extension POSummaryVC : ReasonRejectVCDelegate{
    func btnReload() {
        viewModel.section = []
        self.sections = []
        self.sections = Constant.POSections
        tblView.reloadData()
      
    }
    
   
    func btnCloseTapped() {
       // rejectVC.removeFromParent()
    }

}
// MARK: OnHold Popup Delegate Methods
extension POSummaryVC : OnHoldVCDelegate {
    func btnCloseOnHoldTapped() {
        
    }
    
    func btnOnHoldReload() {
        viewModel.section = []
        self.sections = []
        self.sections = Constant.POSections
        tblView.reloadData()
    }
    
    
}

// MARK: Approved Popup Delegate Methods
extension POSummaryVC : BagSizeVCDelegate{
    func btnBagSizeReload() {
        viewModel.section = []
        self.sections = []
        self.sections = Constant.POSections
        tblView.reloadData()
    }
    
    func btnBagCloseTapped() {
    }
}

//MARK: Hold Popup Delegate Methods
extension POSummaryVC : DRPopupVCDelegate {
    func btnDRPReload() {
        
    }
    func btnDRCloseTapped() {
    }
}
