//
//  PageViewVC.swift
//  TharTrack
//
//  Created by Esoft on 21/10/19.
//  Copyright © 2019 Esoft. All rights reserved.
//

import UIKit

protocol PageViewVCDelegate:class {
    func scrollTabTo(index: Int)
}

class PageViewVC: UIPageViewController {
    
    //MARK: Property
    var pages:[M_TabView] = []
   // var sections: [(name: String, row: [M_TabView])] = []
    //MARK: Member Variables
    var currentIndex: Int = 0
    weak var _delegate:PageViewVCDelegate?
    var selectedCell:Int? = nil
    var orderID:Int? = nil
    var sections:[PONBaseModel] = []
    //MARK: View Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
    
        self.dataSource = self
        self.delegate = self
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        if pages.count > 0 {
            self.setViewControllers([getViewControllerAtIndex(index: 0)], direction: .forward, animated: true) { (flag) in
                self._delegate?.scrollTabTo(index: 0)
            }
        }
    }
    
    private func getViewControllerAtIndex(index: NSInteger) -> ContentVC {
        
        let contentVC = self.storyboard?.instantiateViewController(withIdentifier: "ContentVC") as! ContentVC
        contentVC.pageIndex = index
        contentVC.orderID = orderID
        contentVC.tabView = pages[index]
        return contentVC
    }
    
    func loadPageAt(index: NSInteger) {
        
        if pages.count == 0 || index >= pages.count {
            return
        }
    
        if index != currentIndex {
            currentIndex = index
            if index > currentIndex {
                self.setViewControllers([getViewControllerAtIndex(index: index)], direction: .forward, animated: true, completion: nil)
            }
            else {
                self.setViewControllers([getViewControllerAtIndex(index: index)], direction: .reverse, animated: true, completion: nil)
            }
            
            self._delegate?.scrollTabTo(index: index)
        }
    }
    
}

//MARK: UIPageViewController DataSource, Delegate
extension PageViewVC : UIPageViewControllerDataSource, UIPageViewControllerDelegate {
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
        
        var pageIndex = (viewController as! ContentVC).pageIndex
        
        if ((pageIndex == 0) || (pageIndex == NSNotFound)) {
            return nil
        }
        pageIndex = pageIndex - 1;
        return getViewControllerAtIndex(index: pageIndex)
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
        
        var pageIndex = (viewController as! ContentVC).pageIndex
        
        if (pageIndex == NSNotFound)  {
            return nil
        }
        pageIndex = pageIndex + 1;
        if pageIndex == pages.count || pageIndex == currentIndex {
            return nil
        }
        
        return getViewControllerAtIndex(index: pageIndex)
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, didFinishAnimating finished: Bool, previousViewControllers: [UIViewController], transitionCompleted completed: Bool) {
        if finished {
            if completed {
                let  vc = pageViewController.viewControllers?.first as! ContentVC
                currentIndex = vc.pageIndex
                _delegate?.scrollTabTo(index: vc.pageIndex)
            }
        }
    }
    
}
