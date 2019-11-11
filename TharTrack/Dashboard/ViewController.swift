//
//  ViewController.swift
//  TharTrack
//
//  Created by Esoft on 14/10/19.
//  Copyright © 2019 Esoft. All rights reserved.
//

import UIKit

class ViewController: BaseViewController {

    //MARK : Constant
    let kDashItemColCell = "DashItemColCell"
    let kChartColCell = "ChartColCell"
    
    
    @IBOutlet weak var tabBarView: TabBarView!
    @IBOutlet weak var headerView: HeaderView!
    var viewModel:DashViewModel!
    @IBOutlet weak var collectionView: UICollectionView!
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.isNavigationBarHidden = true
        
         collectionView.register(UINib(nibName: kDashItemColCell, bundle: Bundle.main), forCellWithReuseIdentifier: kDashItemColCell)
         collectionView.register(UINib(nibName: kChartColCell, bundle: Bundle.main), forCellWithReuseIdentifier: kChartColCell)
        
        headerView.contentView.frame = CGRect(x: 0, y: 0, width: view.bounds.size.width, height: headerView.frame.size.height)
        headerView.delegate = self
        
        tabBarView.contentView.frame = CGRect(x: 0, y: 0, width: view.bounds.size.width, height: tabBarView.frame.size.height)
        tabBarView.delegate = self
        
        viewModel = DashViewModel(dataSource: DashDataSource())
        viewModel.delegate = self
        // Do any additional setup after loading the view.
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        headerView.contentView.frame = CGRect(x: 0, y: 0, width: view.bounds.size.width, height: headerView.frame.size.height)
        headerView.delegate = self
        
        tabBarView.contentView.frame = CGRect(x: 0, y: 0, width: view.bounds.size.width, height: tabBarView.frame.size.height)
        tabBarView.delegate = self
        
        view.layoutIfNeeded()
        view.updateConstraintsIfNeeded()
        
    }
    override func viewWillTransition(to size: CGSize, with coordinator: UIViewControllerTransitionCoordinator) {
        super.viewWillTransition(to: size, with: coordinator)
        //        pageViewTabCollection.reloadData()
        collectionView.collectionViewLayout.invalidateLayout()
        
    }
}


//MARK: CollectionView Delegates Methods
extension ViewController : UICollectionViewDelegate, UICollectionViewDataSource , UICollectionViewDelegateFlowLayout {
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 2
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if section == 0 {
            return 4
        }else if section == 1{
            return 1
        }
        else{
            return 0
        }

    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if indexPath.section == 0 {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: kDashItemColCell, for: indexPath) as! DashItemColCell
        return cell
        }else if indexPath.section == 1{
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: kChartColCell, for: indexPath) as! ChartColCell
            return cell
        }else{
            return UICollectionViewCell()
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let deviceIdiom = UIScreen.main.traitCollection.userInterfaceIdiom
        
        switch (deviceIdiom) {
        case .phone:
             if UIDevice.current.orientation.isPortrait {
            if indexPath.section == 0{
                return CGSize(width: collectionView.bounds.size.width/2.0, height: collectionView.bounds.size.height/4.5)//CGSize(width: 230, height: 230)
            }else if indexPath.section == 1 {
                return CGSize(width: collectionView.bounds.size.width, height: collectionView.bounds.size.height/1.5)//CGSize(width: 230, height: 230)
            }else{
                return CGSize.zero
            }
             }else{
                if indexPath.section == 0{
                    return CGSize(width: collectionView.bounds.size.width/2.0, height: collectionView.bounds.size.height/2)//CGSize(width: 230, height: 230)
                }else if indexPath.section == 1 {
                    return CGSize(width: collectionView.bounds.size.width, height: collectionView.bounds.size.height/0.5)//CGSize(width: 230, height: 230)
                }else{
                    return CGSize.zero
                }
            }
        case .pad:
            if UIDevice.current.orientation.isPortrait {
                if indexPath.section == 0{
                    return CGSize(width: collectionView.bounds.size.width/2.0, height: collectionView.bounds.size.height/6.2)//CGSize(width: 230, height: 230)
                }else if indexPath.section == 1 {
                    return CGSize(width: collectionView.bounds.size.width, height: collectionView.bounds.size.height/1.5)//CGSize(width: 230, height: 230)
                }else{
                    return CGSize.zero
                }
            }else{
                if indexPath.section == 0{
                    return CGSize(width: collectionView.bounds.size.width/2.0, height: collectionView.bounds.size.height/5)//CGSize(width: 230, height: 230)
                }else if indexPath.section == 1 {
                    return CGSize(width: collectionView.bounds.size.width, height: collectionView.bounds.size.height/1.5)//CGSize(width: 230, height: 230)
                }else{
                    return CGSize.zero
                }
            }
            
           
        default:
            return CGSize.zero
//            if indexPath.section == 0{
//                return CGSize(width: collectionView.bounds.size.width/2.0, height: collectionView.bounds.size.height/4.5)//CGSize(width: 230, height: 230)
//            }else if indexPath.section == 1 {
//                return CGSize(width: collectionView.bounds.size.width, height: collectionView.bounds.size.height/1.5)//CGSize(width: 230, height: 230)
//            }else{
//                return CGSize.zero
//            }
        }
        
       
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if indexPath.section == 0{
            if indexPath.row == 0{
             let newPurchVC = Constant.getViewController(storyboard: Constant.kMainStoryboard, identifier: Constant.kNewPurchaseVC) as! NewPurchaseVC
            self.navigationController?.pushViewController(newPurchVC, animated: true)
            }
    }
}
}


//MARK: BaseView Delegates Methods

extension ViewController: ViewModelDelegate {
    func willLoadData() {
        
    }
    
    func didLoadData() {
        
    }
    
    func didFail(error: CustomError) {
        showErrorMessage(title: "Error....", error: error)
    }
    
    
}

// MARK: Header View Delegates Methods
extension ViewController : HeaderViewDelegate {
  
    func btnMenuTapped(sender: UIButton ) {
       onSlideMenuButtonPressed(sender)

    }
    
    func btnProfileTapped(sender: UIButton) {
        
    }
    
    func btnLogoutTapped(sender: UIButton) {
        showMessage(title: Constant.kAlertTitle_LOGOUT, message: CustomError.Logout.localizedDescription, btnConfirmTitle: Constant.kAlertAction_YES, btnCancelTitle: Constant.kAlertAction_CANCEL) { (isConfirmTapped, action) in
            
            if isConfirmTapped {
                UserDefaults.standard.setLoggedIn(value: false)
                let loginVC = self.storyboard?.instantiateViewController(withIdentifier: Constant.kLoginVC) as! LoginVC
                self.present(loginVC, animated: true, completion: nil)
            }
        }
    }

}

// MARK: TabBar View Delegate Methods
extension ViewController : TabBarViewDelegate {
    func btnHomeTapped(sender: UIButton) {
//        let dashboardNav: UINavigationController = storyboard?.instantiateViewController(withIdentifier: Constant.kDashboardNavigationVC) as! UINavigationController
//
//        self.present(dashboardNav, animated: true, completion:nil)
    }
    
    func btnNotifyTapped(sender: UIButton) {
        let dashboardNav: UINavigationController = storyboard?.instantiateViewController(withIdentifier: Constant.kNAVNotificationVC) as! UINavigationController
        
        self.present(dashboardNav, animated: true, completion:nil)
    }
    
    func btnProTapped(sender: UIButton) {
        
    }
}
