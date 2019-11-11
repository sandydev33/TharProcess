//
//  NewPurchaseVC.swift
//  TharTrack
//
//  Created by Esoft on 14/10/19.
//  Copyright © 2019 Esoft. All rights reserved.

// Purchase Order List

import UIKit

class NewPurchaseVC: BaseViewController {

    
    //MARK: Constant
    private let kNewPurchaseCell = "NewPurchaseCell"
    private let kNewParchaseDataCell = "NewParchaseDataCell"
    
    var viewModel:NewParchaseViewModel!
    
    @IBOutlet weak var tblView: UITableView!
    
    @IBOutlet weak var tabBarView: TabBarView!
    @IBOutlet weak var headerView: HeaderView!
    
    var sections: [(section: M_PurchaseDateList, row: M_PurchaseCompany)] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tblView.register(UINib(nibName: kNewPurchaseCell, bundle: Bundle.main), forHeaderFooterViewReuseIdentifier: kNewPurchaseCell)
       // tblView.register(UINib(nibName: kNewPurchaseCell, bundle: Bundle.main), forCellReuseIdentifier: kNewPurchaseCell)
        //tblView.estimatedRowHeight = UITableView.automaticDimension
       // tblView.rowHeight = 50
        
        tblView.register(UINib(nibName: kNewParchaseDataCell, bundle: Bundle.main), forCellReuseIdentifier: kNewParchaseDataCell)
        tblView.estimatedRowHeight = UITableView.automaticDimension
        tblView.rowHeight = 60
        
        headerView.contentView.frame = CGRect(x: 0, y: 0, width: view.bounds.size.width, height: headerView.frame.size.height)
        headerView.delegate = self
        
        tabBarView.contentView.frame = CGRect(x: 0, y: 0, width: view.bounds.size.width, height: tabBarView.frame.size.height)
        tabBarView.delegate = self
        
        viewModel = NewParchaseViewModel(dataSource: NewPurchaseDataSource())
        viewModel.delegate = self
        viewModel.bootstrap()
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

//MARK: TableView Delegates methods
extension NewPurchaseVC: UITableViewDelegate , UITableViewDataSource {
    
    
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        
        if let header = tableView.dequeueReusableHeaderFooterView(withIdentifier: kNewPurchaseCell) as? NewPurchaseCell {
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
            let cell = tableView.dequeueReusableCell(withIdentifier: kNewParchaseDataCell, for: indexPath) as! NewParchaseDataCell
                let data = sections[indexPath.row].section
                cell.setData(list: data)
                cell.btnView.tag = data.orderId!
                cell.btnView.addTarget(self, action: #selector(getOrderID(_:)), for: .touchUpInside)
            return cell
        }
        else{
           return UITableViewCell()
        }
    }
    
    @objc func getOrderID(_ sender:UIButton!) {
        print(sender.tag)
        let purchaseList = Constant.getViewController(storyboard: Constant.kMainStoryboard, identifier: Constant.kPurchaseListVC) as! PurchaseListVC
        purchaseList.orderID = sender.tag
        Constant.POSections = []
        self.navigationController?.pushViewController(purchaseList, animated: true)
    }
    
}

//MARK: ViewModel Delegate
extension NewPurchaseVC : ViewModelDelegate {
    func willLoadData() {
        startLoader()
    }
    
    func didLoadData() {
        sections = viewModel.sections
        if sections.count <= 0 {
            showErrorMessage(title: "", message:viewModel.msg ) { (action) in
                
            }
        }
        tblView.reloadData()
        stopLoader()
    }
    
    func didFail(error: CustomError) {
        showErrorMessage(title: "Error....", error: error)
        stopLoader()
    }
}

// MARK: HeaderView Delegates methods
extension NewPurchaseVC : HeaderViewDelegate {
    
    func btnMenuTapped(sender: UIButton ) {
        onSlideMenuButtonPressed(sender)
        
    }
    
    func btnProfileTapped(sender: UIButton) {
        
    }
    
    func btnLogoutTapped(sender: UIButton) {
        
    }
    
}

// MARK: TabBar View Delegate Methods
extension NewPurchaseVC : TabBarViewDelegate {
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
