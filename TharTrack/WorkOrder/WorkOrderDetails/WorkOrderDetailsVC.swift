//
//  WorkOrderDetailsVC.swift
//  TharTrack
//
//  Created by Esoft on 08/11/19.
//  Copyright © 2019 Esoft. All rights reserved.
//

import UIKit

class WorkOrderDetailsVC: BaseViewController {

    private let kWorkOrderDetailsCell = "WorkOrderDetailsCell"
    
    @IBOutlet weak var tabBarView: TabBarView!
    @IBOutlet weak var tblView: UITableView!
    @IBOutlet weak var headerView: HeaderView!
     var footer:WorkOrderView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tblView.register(UINib(nibName: kWorkOrderDetailsCell, bundle: Bundle.main), forCellReuseIdentifier: kWorkOrderDetailsCell)
        tblView.estimatedRowHeight = UITableView.automaticDimension
      //  tblView.rowHeight = 60
        
        tabBarView.contentView.frame = CGRect(x: 0, y: 0, width: view.bounds.size.width, height: tabBarView.frame.size.height)
        tabBarView.delegate = self
        
        headerView.contentView.frame = CGRect(x: 0, y: 0, width: view.bounds.size.width, height: headerView.frame.size.height)
        headerView.delegate = self
      
        footer = WorkOrderView(frame: CGRect(x: 0, y: 0, width:0, height: 100))
        footer.delegate = self
        tblView.tableFooterView = footer
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
        headerView.btnLogout.setImage(UIImage(named: "left-chevron"), for: .normal)
        headerView.delegate = self
        
        tabBarView.contentView.frame = CGRect(x: 0, y: 0, width: view.bounds.size.width, height: tabBarView.frame.size.height)
        tabBarView.delegate = self
        
        view.layoutIfNeeded()
        view.updateConstraintsIfNeeded()
        
    }
}

// MARK : Table View Delegates Methods
extension WorkOrderDetailsVC: UITableViewDelegate , UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 0{
            return 1
        }else{
            return 0
        }
    }
  
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.section == 0{
            let cell = tableView.dequeueReusableCell(withIdentifier: kWorkOrderDetailsCell, for: indexPath) as! WorkOrderDetailsCell
            return cell
        }
        else{
            return UITableViewCell()
        }
    }
}



// MARK : Base View Delegates Methods
extension WorkOrderDetailsVC : ViewModelDelegate{
    func willLoadData() {
        
    }
    
    func didLoadData() {
        
    }
    
    func didFail(error: CustomError) {
        showErrorMessage(title: "Error....", error: error)
    }
    
    
}
// MARK : Header View Delegates Methods
extension WorkOrderDetailsVC : HeaderViewDelegate {
    func btnMenuTapped(sender: UIButton) {
        onSlideMenuButtonPressed(sender)
    }
    
    func btnProfileTapped(sender: UIButton) {
        
    }
    
    func btnLogoutTapped(sender: UIButton) {
        if let nav = navigationController {
            nav.popViewController(animated: true)
        }else {
            self.dismiss(animated: true, completion: nil)
        }
    }
    
    
}

// MARK: TabBar View Delegate Methods
extension WorkOrderDetailsVC : TabBarViewDelegate {
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

//MARK : Work Order View Delegate Methods
extension WorkOrderDetailsVC : WorkOrderViewDelegate {
    func btnReceipTapped(sender: UIButton) {

    }

    func btnScanTapped(sender: UIButton) {
        let scanBagsVC = Constant.getViewController(storyboard: Constant.kMainStoryboard, identifier: Constant.kScanBagsVC) as! ScanBagsVC
        self.navigationController?.pushViewController(scanBagsVC, animated: true)
    }

    func btnPreReceiveTapped(sender: UIButton) {
        let preCheckListVC = Constant.getViewController(storyboard: Constant.kMainStoryboard, identifier: Constant.kPreCheckListVC) as! PreCheckListVC
        self.navigationController?.pushViewController(preCheckListVC, animated: true)
    }


}
