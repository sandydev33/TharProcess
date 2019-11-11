//
//  WorkOrderVC.swift
//  TharTrack
//
//  Created by Esoft on 15/10/19.
//  Copyright © 2019 Esoft. All rights reserved.
//

import UIKit

class WorkOrderVC: BaseViewController {
    // MARK: Constant
    
    var viewModel:WorkOrderViewModel!
    private let kWorkOrderCell = "WorkOrderCell"
    private let kWorkOrderDataCell = "WorkOrderDataCell"
    
    @IBOutlet weak var tabBarView: TabBarView!
    @IBOutlet weak var tblView: UITableView!
    @IBOutlet weak var headerView: HeaderView!
   // var footer:WorkOrderView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
       tblView.register(UINib(nibName: kWorkOrderCell, bundle: Bundle.main), forHeaderFooterViewReuseIdentifier: kWorkOrderCell)
        
        tblView.register(UINib(nibName: kWorkOrderDataCell, bundle: Bundle.main), forCellReuseIdentifier: kWorkOrderDataCell)
        tblView.estimatedRowHeight = UITableView.automaticDimension
          tblView.rowHeight = 60
        
        tabBarView.contentView.frame = CGRect(x: 0, y: 0, width: view.bounds.size.width, height: tabBarView.frame.size.height)
        tabBarView.delegate = self
        
        headerView.contentView.frame = CGRect(x: 0, y: 0, width: view.bounds.size.width, height: headerView.frame.size.height)
        headerView.delegate = self
        
        viewModel = WorkOrderViewModel(dataSource: WorkOrderDataSource())
        viewModel.delegate = self
        
        
//        footer = WorkOrderView(frame: CGRect(x: 0, y: 0, width:0, height: 100))
//        footer.delegate = self
//        tblView.tableFooterView = footer
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
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        headerView.contentView.frame = CGRect(x: 0, y: 0, width: view.bounds.size.width, height: headerView.frame.size.height)
        headerView.delegate = self
        
        tabBarView.contentView.frame = CGRect(x: 0, y: 0, width: view.bounds.size.width, height: tabBarView.frame.size.height)
        tabBarView.delegate = self
        
        view.layoutIfNeeded()
        view.updateConstraintsIfNeeded()
        
    }
}

// MARK : Table View Delegates Methods
extension WorkOrderVC: UITableViewDelegate , UITableViewDataSource {
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        
        if let header = tableView.dequeueReusableHeaderFooterView(withIdentifier: kWorkOrderCell) as? WorkOrderCell {
            header.frame = CGRect(x: 0, y: 0, width: tableView.bounds.width, height: 60)
            header.layoutIfNeeded()
            return header
        }
        return UIView()
    }
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 60
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 0{
            return 6
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
            let cell = tableView.dequeueReusableCell(withIdentifier: kWorkOrderDataCell, for: indexPath) as! WorkOrderDataCell
            return cell
        }
        else{
            return UITableViewCell()
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let WODetailsVC = Constant.getViewController(storyboard: Constant.kMainStoryboard, identifier: Constant.kWorkOrderDetailsVC) as! WorkOrderDetailsVC
        self.navigationController?.pushViewController(WODetailsVC, animated: true)
    }
}



// MARK : Base View Delegates Methods
extension WorkOrderVC : ViewModelDelegate{
    func willLoadData() {
        
    }
    
    func didLoadData() {
        
    }
    
    func didFail(error: CustomError) {
        showErrorMessage(title: "Error....", error: error)
    }
    
    
}
// MARK : Header View Delegates Methods
extension WorkOrderVC : HeaderViewDelegate {
    func btnMenuTapped(sender: UIButton) {
        onSlideMenuButtonPressed(sender)
    }
    
    func btnProfileTapped(sender: UIButton) {
        
    }
    
    func btnLogoutTapped(sender: UIButton) {
        
    }
    
    
}

// MARK: TabBar View Delegate Methods
extension WorkOrderVC : TabBarViewDelegate {
    func btnHomeTapped(sender: UIButton) {
        let dashboardNav: UINavigationController = storyboard?.instantiateViewController(withIdentifier: Constant.kDashboardNavigationVC) as! UINavigationController
        
        self.present(dashboardNav, animated: true, completion:nil)
    }
    
    func btnNotifyTapped(sender: UIButton) {
        let dashboardNav: UINavigationController = storyboard?.instantiateViewController(withIdentifier: Constant.kNAVNotificationVC) as! UINavigationController
        
        self.present(dashboardNav, animated: true, completion:nil)
    }
    
    func btnProTapped(sender: UIButton) {
        
    }
}

////MARK : Work Order View Delegate Methods
//extension WorkOrderVC : WorkOrderViewDelegate {
//    func btnReceipTapped(sender: UIButton) {
//        
//    }
//    
//    func btnScanTapped(sender: UIButton) {
//        let scanBagsVC = Constant.getViewController(storyboard: Constant.kMainStoryboard, identifier: Constant.kScanBagsVC) as! ScanBagsVC
//        self.navigationController?.pushViewController(scanBagsVC, animated: true)
//    }
//    
//    func btnPreReceiveTapped(sender: UIButton) {
//        let preCheckListVC = Constant.getViewController(storyboard: Constant.kMainStoryboard, identifier: Constant.kPreCheckListVC) as! PreCheckListVC
//        self.navigationController?.pushViewController(preCheckListVC, animated: true)
//    }
//    
//    
//}
