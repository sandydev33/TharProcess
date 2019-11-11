//
//  TharDocsVC.swift
//  TharTrack
//
//  Created by Esoft on 22/10/19.
//  Copyright © 2019 Esoft. All rights reserved.
//

import UIKit

class TharDocsVC: BaseVC {

    @IBOutlet weak var tblView: UITableView!
    // MARK: Constant
    //MARK: Constant
    private let kTharDocsCell = "TharDocsCell"
    private let kTharDocsDataCell = "TharDocsDataCell"
    var footer:FooterPopupView!
    var rejectVC:ReasonRejectVC!
    var bagSizeVC:BagSizeVC!
    var dRPopupVC:DRPopupVC!
    var sections:[TharDocsBaseModel] = []
    var orderID:Int? = nil
    var viewModel:TharDocsViewModel!
    var onHoldVC:OnHoldVC!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tblView.register(UINib(nibName: kTharDocsCell, bundle: Bundle.main), forHeaderFooterViewReuseIdentifier: kTharDocsCell)
        
        tblView.register(UINib(nibName: kTharDocsDataCell, bundle: Bundle.main), forCellReuseIdentifier: kTharDocsDataCell)
        
        tblView.estimatedRowHeight = UITableView.automaticDimension
        tblView.rowHeight = 60
        
        footer = FooterPopupView(frame: CGRect(x: 0, y: 0, width:0, height: 100))
        footer.hideAdditional = true
        footer.delegate = self
        tblView.tableFooterView = footer

        viewModel = TharDocsViewModel(dataSource: TharDocsDataSource())
        viewModel.delegate = self
        viewModel.getAllTharDocs()
        
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
extension TharDocsVC: UITableViewDelegate , UITableViewDataSource {
    
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        
        if let header = tableView.dequeueReusableHeaderFooterView(withIdentifier: kTharDocsCell) as? TharDocsCell {
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
        if section == 0 {
            return sections[section].result?.count ?? 0
        }else{
            return 0
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.section == 0{
            let cell = tableView.dequeueReusableCell(withIdentifier: kTharDocsDataCell, for: indexPath) as! TharDocsDataCell
            let data = sections[indexPath.section].result?[indexPath.row]
             cell.setData(data: data!)
             cell.tag = indexPath.row
            
            
             return cell
        }
        else{
            return UITableViewCell()
        }
    }
}



// MARK : Base View Delegates Methods
extension TharDocsVC : ViewModelDelegate{
    func willLoadData() {
        startLoader()
    }
    
    func didLoadData() {
        sections = viewModel.sections
        tblView.reloadData()
        stopLoader()
    }
    
    func didFail(error: CustomError) {
        showErrorMessage(title: "Error....", error: error)
        stopLoader()
    }

}

extension TharDocsVC : FootorViewDelegate{
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
extension TharDocsVC : ReasonRejectVCDelegate{
    func btnReload() {

    }
    
    func btnCloseTapped() {
        // rejectVC.removeFromParent()
    }
}

// MARK: OnHold Popup Delegate Methods
extension TharDocsVC : OnHoldVCDelegate {
    func btnCloseOnHoldTapped() {
        
    }
    
    func btnOnHoldReload() {
//        self.sections = []
//        self.sections = Constant.POSections
//        tblView.reloadData()
    }
    
    
}
// MARK: Approved Popup Delegate Methods
extension TharDocsVC : BagSizeVCDelegate{
    func btnBagSizeReload() {
        
    }
    
    func btnBagCloseTapped() {
        
    }
}

//MARK: Hold Popup Delegate Methods
extension TharDocsVC : DRPopupVCDelegate {
    func btnDRPReload() {
        
    }
    func btnDRCloseTapped() {
    }
}
