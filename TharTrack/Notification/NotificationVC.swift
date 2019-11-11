//
//  NotificationVC.swift
//  TharTrack
//
//  Created by Esoft on 23/10/19.
//  Copyright © 2019 Esoft. All rights reserved.
//

import UIKit

class NotificationVC: BaseViewController {

    @IBOutlet weak var tblView: UITableView!
    @IBOutlet weak var tabBarView: TabBarView!
    @IBOutlet weak var headerView: HeaderView!
    
    // MARK: Constant
    //MARK: Constant
    private let kNotificationCell = "NotificationCell"
    private let kNotificationDateCell = "NotificationDateCell"
   
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tblView.register(UINib(nibName: kNotificationCell, bundle: Bundle.main), forCellReuseIdentifier: kNotificationCell)
        
        tblView.register(UINib(nibName: kNotificationDateCell, bundle: Bundle.main), forCellReuseIdentifier: kNotificationDateCell)
        
        tblView.estimatedRowHeight = UITableView.automaticDimension
        
        
        tabBarView.contentView.frame = CGRect(x: 0, y: 0, width: view.bounds.size.width, height: tabBarView.frame.size.height)
        tabBarView.delegate = self
        
        headerView.contentView.frame = CGRect(x: 0, y: 0, width: view.bounds.size.width, height: headerView.frame.size.height)
        headerView.delegate = self
        
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


// MARK : Base View Delegates Methods
extension NotificationVC : ViewModelDelegate{
    func willLoadData() {
        
    }
    
    func didLoadData() {
        
    }
    
    func didFail(error: CustomError) {
        showErrorMessage(title: "Error....", error: error)
    }
    
    
}

// MARK : Table View Delegates Methods
extension NotificationVC: UITableViewDelegate , UITableViewDataSource {
    
    
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
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.section == 0{
            if indexPath.row == 4{
                let cell = tableView.dequeueReusableCell(withIdentifier: kNotificationDateCell, for: indexPath) as! NotificationDateCell
                return cell
            }else{
            let cell = tableView.dequeueReusableCell(withIdentifier: kNotificationCell, for: indexPath) as! NotificationCell
            return cell
        }
        }
        else{
            return UITableViewCell()
        }
    }
    
    
    func tableView(_ tableView: UITableView, editActionsForRowAt: IndexPath) -> [UITableViewRowAction]? {
        let copyButton = UITableViewRowAction(style: .normal, title: "Delete") { action, index in
            
            print("copy button tapped")
            
        }
     //   copyButton.backgroundColor = UIColor(patternImage: UIImage(named: "")!)
        copyButton.backgroundColor = UIColor.red
        
        return [copyButton]
    }
    

}
// MARK : Header View Delegates Methods
extension NotificationVC : HeaderViewDelegate {
    func btnMenuTapped(sender: UIButton) {
        onSlideMenuButtonPressed(sender)
    }
    
    func btnProfileTapped(sender: UIButton) {
        
    }
    
    func btnLogoutTapped(sender: UIButton) {
        
    }
    
    
}

// MARK: TabBar View Delegate Methods
extension NotificationVC : TabBarViewDelegate {
    func btnHomeTapped(sender: UIButton) {
        let dashboardNav: UINavigationController = storyboard?.instantiateViewController(withIdentifier: Constant.kDashboardNavigationVC) as! UINavigationController
        
        self.present(dashboardNav, animated: true, completion:nil)
    }
    
    func btnNotifyTapped(sender: UIButton) {
//        let dashboardNav: UINavigationController = storyboard?.instantiateViewController(withIdentifier: Constant.kNAVNotificationVC) as! UINavigationController
//        
//        self.present(dashboardNav, animated: true, completion:nil)
    }
    
    func btnProTapped(sender: UIButton) {
        
    }
}
