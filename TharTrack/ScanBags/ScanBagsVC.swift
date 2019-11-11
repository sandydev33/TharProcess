//
//  ScanBagsVC.swift
//  TharTrack
//
//  Created by Esoft on 15/10/19.
//  Copyright © 2019 Esoft. All rights reserved.
//

import UIKit

class ScanBagsVC: BaseViewController {
    // MARK: Constant
    
    private let kScanBagsCell = "ScanBagsCell"
    private let kScanBagsDataCell = "ScanBagsDataCell"
    private let kScanHeaderCell = "ScanHeaderCell"
    
    @IBOutlet weak var tabBarView: TabBarView!
    @IBOutlet weak var tblView: UITableView!
    var viewModel:ScanBagsViewModel!
    @IBOutlet weak var headerView: HeaderView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tblView.register(UINib(nibName: kScanBagsCell, bundle: Bundle.main), forHeaderFooterViewReuseIdentifier: kScanBagsCell)
        
        tblView.register(UINib(nibName: kScanHeaderCell, bundle: Bundle.main), forCellReuseIdentifier: kScanHeaderCell)
        tblView.estimatedRowHeight = UITableView.automaticDimension
        
        tblView.register(UINib(nibName: kScanBagsDataCell, bundle: Bundle.main), forCellReuseIdentifier: kScanBagsDataCell)
        tblView.estimatedRowHeight = UITableView.automaticDimension
        
        // tblView.rowHeight = 60
        
        tabBarView.contentView.frame = CGRect(x: 0, y: 0, width: view.bounds.size.width, height: tabBarView.frame.size.height)
        tabBarView.delegate = self
        
        headerView.contentView.frame = CGRect(x: 0, y: 0, width: view.bounds.size.width, height: headerView.frame.size.height)
        headerView.delegate = self
        
        
        viewModel = ScanBagsViewModel(dataSource: ScanBagsDataSource())
        viewModel.delegate = self
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
extension ScanBagsVC: UITableViewDelegate , UITableViewDataSource {

    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        
        if let header = tableView.dequeueReusableHeaderFooterView(withIdentifier: kScanBagsCell) as? ScanBagsCell {
            
            switch (section) {
            case 0:
                header.frame = CGRect(x: 0, y: 0, width: tableView.bounds.width, height: 0)
                header.layoutIfNeeded()
                return header
            case 1:
                header.frame = CGRect(x: 0, y: 0, width: tableView.bounds.width, height: 60)
                header.layoutIfNeeded()
                return header
            case 2:
                header.frame = CGRect(x: 0, y: 0, width: tableView.bounds.width, height: 0)
                header.layoutIfNeeded()
                return header
            default:
                break
               
            }
      
            return header
        }
        return UIView()
    }
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        if section == 1{
             return 60
        }else{
            return 0
        }
       
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 0 {
            return 1
        }else if section == 1 {
            return 20
        }
        else{
            return 0
        }
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
       
        if indexPath.section == 0{
            let cell = tableView.dequeueReusableCell(withIdentifier: kScanHeaderCell, for: indexPath) as! ScanHeaderCell
            return cell
        }else if indexPath.section == 1{
            let cell = tableView.dequeueReusableCell(withIdentifier: kScanBagsDataCell, for: indexPath) as! ScanBagsDataCell
            return cell
        }
        else{
            return UITableViewCell()
        }
    }
}



// MARK : Base View Delegates Methods
extension ScanBagsVC : ViewModelDelegate{
    func willLoadData() {
        
    }
    
    func didLoadData() {
        
    }
    
    func didFail(error: CustomError) {
        showErrorMessage(title: "Error....", error: error)
    }
    
    
}
// MARK : Header View Delegates Methods
extension ScanBagsVC : HeaderViewDelegate {
    func btnMenuTapped(sender: UIButton) {
        onSlideMenuButtonPressed(sender)
    }
    
    func btnProfileTapped(sender: UIButton) {
        
    }
    
    func btnLogoutTapped(sender: UIButton) {
        
    }
    
    
}

// MARK: TabBar View Delegate Methods
extension ScanBagsVC : TabBarViewDelegate {
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
