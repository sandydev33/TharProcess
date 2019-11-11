//
//  PurchaseListVC.swift
//  TharTrack
//
//  Created by Esoft on 21/10/19.
//  Copyright © 2019 Esoft. All rights reserved.
//

import UIKit

class PurchaseListVC: BaseViewController {

    var viewModel:PurchaseListViewModel!
    

    @IBOutlet weak var tabColView: TabColView!
    @IBOutlet weak var tabCollection: UICollectionView!
    @IBOutlet weak var headerView: HeaderView!
    @IBOutlet weak var tabBarView: TabBarView!
    
    //MARK: Constant
    private let kPageViewTabCell = "PageViewTabCell"
    private let kSeguePageView = "SeguePageView"
    private var pageViewVC: PageViewVC!
    private var selectedCell:Int = 0
    var orderID:Int? = nil
    
    
   // private var sections: [String] = []
    private var sections: [(name: String, row: [M_TabView])] = []
    var scrollIndex: NSInteger = 0
    override func viewDidLoad() {
        super.viewDidLoad()

        
        
        tabBarView.contentView.frame = CGRect(x: 0, y: 0, width: view.bounds.size.width, height: tabBarView.frame.size.height)
        tabBarView.delegate = self
        
        headerView.contentView.frame = CGRect(x: 0, y: 0, width: view.bounds.size.width, height: headerView.frame.size.height)
        headerView.delegate = self
        
        tabColView.bringSubviewToFront(tabCollection)
        tabColView.contentView.frame = CGRect(x: 0, y: 0, width: view.bounds.size.width, height: tabColView.frame.size.height)
        tabColView.delegate = self
        view.layoutIfNeeded()
        view.updateConstraintsIfNeeded()
    
        
        headerView.headerLbl.text = "Purchase Order No \(orderID!)"
        headerView.btnLogout.setImage(UIImage(named: "left-chevron"), for: .normal)
        viewModel = PurchaseListViewModel(dataSource: PurchaseListDataSource())
        viewModel.delegate = self
        viewModel.bootstrap()
       // viewModel.getPurchaseOrderByPurchaseOrderId(ID: OrderID!)
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
        tabColView.contentView.frame = CGRect(x: 0, y: 0, width: view.bounds.size.width, height: tabColView.frame.size.height)
        view.layoutIfNeeded()
        view.updateConstraintsIfNeeded()
        
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
        tabCollection.collectionViewLayout.invalidateLayout()
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == kSeguePageView {
            let vc = segue.destination as! PageViewVC
            pageViewVC = vc
            pageViewVC.orderID = orderID
            pageViewVC.selectedCell = selectedCell
            pageViewVC._delegate = self
        }
    }
}
// MARK : Base View Delegates Methods
extension PurchaseListVC : ViewModelDelegate{
    func willLoadData() {
        
    }
    
    func didLoadData() {
        sections = viewModel.sections
        if sections.count > 0 {
            tabCollection.reloadData()
            pageViewVC.pages = sections[0].row
            pageViewVC.orderID = orderID
            pageViewVC.loadPageAt(index: 0)
        }
    }
    
    func didFail(error: CustomError) {
       showErrorMessage(title: "Error....", error: error)
    }
    
    
}



//MARK: PageViewVC Delegate
extension PurchaseListVC: PageViewVCDelegate {
    func scrollTabTo(index: Int) {
        tabCollection.selectItem(at: IndexPath(item: index, section: 0), animated: true, scrollPosition: .centeredVertically)
        tabCollection.scrollToItem(at: IndexPath(item: index, section: 0), at: .centeredHorizontally, animated: true)
    
    }
}

//MARK: CollectionView Datasource, Delegate
extension PurchaseListVC : UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if sections.count > 0 {
            return sections[section].row.count
        }
        return 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: kPageViewTabCell, for: indexPath) as! PageViewTabCell
        cell.tag = indexPath.row
       
        let list = sections[indexPath.section].row
        if list.count == 1 {
            cell.indicatorView.isHidden = true
        }
        else {
            cell.indicatorView.isHidden = false
        }
    
        cell.setData(form: list[indexPath.row], selectedIndex: indexPath.row)
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        selectedCell = indexPath.row
        pageViewVC.loadPageAt(index: selectedCell)
    
    }
    
    
   
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let _ = collectionView.cellForItem(at: indexPath) as? PageViewTabCell
        //        let cell = collectionView.cellForItem(at: indexPath)
        //        let cellHeight = cell?.bounds.height
        let frameWidth = collectionView.bounds.width
        
        let list = sections[indexPath.section].row
        
        if list.count == 1 {
            let cellWidth = (frameWidth - 40)
            return CGSize(width: cellWidth, height: collectionView.bounds.size.height)//cellHeight ?? 81)
        }
        else if list.count == 2 {
            let cellWidth = (frameWidth - 60)/2
            return CGSize(width: cellWidth, height: collectionView.bounds.size.height)
        }
        else  {
            let cellWidth = (frameWidth)/3
            return CGSize(width: cellWidth, height: collectionView.bounds.size.height)
            /*
             let list = sections[indexPath.section].rows
             
             let deviceIdiom = UIScreen.main.traitCollection.userInterfaceIdiom
             var sizeChange = CGSize(width: cellWidth, height: collectionView.bounds.size.height)
             
             switch (deviceIdiom) {
             case .phone:
             sizeChange = list[indexPath.row].formName!.size(withAttributes: [
             NSAttributedString.Key.font : cell?.lblTitle.font ?? UIFont.boldSystemFont(ofSize: 25)
             ])
             case .pad:
             sizeChange = CGSize(width: cellWidth, height: collectionView.bounds.size.height)
             default:
             sizeChange = list[indexPath.row].formName!.size(withAttributes: [
             NSAttributedString.Key.font :cell?.lblTitle.font ?? UIFont.boldSystemFont(ofSize: 30)
             ])
             }
             return CGSize(width: sizeChange.width , height: collectionView.bounds.size.height)*/
            
            //            return
        }
    }
}



// MARK : Header View Delegates Methods
extension PurchaseListVC : HeaderViewDelegate {
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
extension PurchaseListVC : TabBarViewDelegate {
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
extension PurchaseListVC : TabColViewDelegate{
    
}
