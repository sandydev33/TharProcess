//
//  PreCheckListVC.swift
//  TharTrack
//
//  Created by Esoft on 15/10/19.
//  Copyright © 2019 Esoft. All rights reserved.
//

import UIKit

class PreCheckListVC: BaseViewController {

    // MARK: Constant
    var viewModel:PreChecklistViewModel!
    
   @IBOutlet weak var tabBarView: TabBarView!
    @IBOutlet weak var headerView: HeaderView!
    @IBOutlet weak var tblView: UITableView!
    private let kPreCheckListCell = "PreCheckListCell"
    
//    @IBOutlet weak var lblTag1: UILabel!
//    @IBOutlet weak var lblTag3: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
//        lblTag1.text = "Date Orig.Issued: August 2,2019 \n Date Revised: August 19,2018 \n Revision Number : 03"
//
//
//        let underlineAttribute = [NSAttributedString.Key.underlineStyle: NSUnderlineStyle.single.rawValue]
//        let underlineAttributedString = NSAttributedString(string: "MATERIAL RECEIVING INSPECTION FORM", attributes: underlineAttribute)
//        lblTag3.attributedText = underlineAttributedString

        
        tblView.register(UINib(nibName: kPreCheckListCell, bundle: Bundle.main), forCellReuseIdentifier: kPreCheckListCell)
        tblView.estimatedRowHeight = UITableView.automaticDimension
        
        tabBarView.contentView.frame = CGRect(x: 0, y: 0, width: view.bounds.size.width, height: tabBarView.frame.size.height)
        tabBarView.delegate = self
        
        headerView.contentView.frame = CGRect(x: 0, y: 0, width: view.bounds.size.width, height: headerView.frame.size.height)
        headerView.delegate = self
        
        viewModel = PreChecklistViewModel(dataSource: PreChecklistDataSource())
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


//MARK: TableView Delegates methods
extension PreCheckListVC: UITableViewDelegate , UITableViewDataSource {
    
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
    
    //    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
    //        if indexPath.section == 0 {
    //            return 60
    //        }else{
    //            return UITableView.automaticDimension
    //        }
    //    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.section == 0{
            let cell = tableView.dequeueReusableCell(withIdentifier: kPreCheckListCell, for: indexPath) as! PreCheckListCell
            return cell
        }
        else{
            return UITableViewCell()
        }
    }
    
}

// MARK : Base View Delegates Methods
extension PreCheckListVC : ViewModelDelegate{
    func willLoadData() {
        
    }
    
    func didLoadData() {
        
    }
    
    func didFail(error: CustomError) {
        showErrorMessage(title: "Error....", error: error)
    }
    
    
}
// MARK : Header View Delegates Methods
extension PreCheckListVC : HeaderViewDelegate {
    func btnMenuTapped(sender: UIButton) {
        onSlideMenuButtonPressed(sender)
    }
    
    func btnProfileTapped(sender: UIButton) {
        
    }
    
    func btnLogoutTapped(sender: UIButton) {
        
    }
    
    
}

// MARK: TabBar View Delegate Methods
extension PreCheckListVC : TabBarViewDelegate {
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
