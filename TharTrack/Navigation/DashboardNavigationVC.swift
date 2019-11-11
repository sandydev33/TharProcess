//
//  DashboardNavigationVC.swift
//  CampBell
//
//  Created by apple on 04/04/19.
//  Copyright © 2019 ESoft Technologies. All rights reserved.
//

import UIKit

class DashboardNavigationVC: UINavigationController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
//        let image = UIImage(named: "back_arrow")
//        self.navigationBar.backIndicatorImage = image
//        self.navigationBar.backIndicatorTransitionMaskImage = image
//        self.navigationBar.tintColor = UIColor.white
        
        self.navigationItem.backBarButtonItem?.title = ""

        var colors:[Any] = []
        if #available(iOS 11.0, *) {
            colors = [UIColor(named: "NavGreen")?.cgColor as! CGColor, UIColor(named: "NavBlue")?.cgColor as! CGColor]
        } else {
            // Fallback on earlier versions
        }
        
        let gradient: CAGradientLayer = CAGradientLayer()
        
        gradient.startPoint = CGPoint(x: 0, y: 0.5)
        gradient.endPoint = CGPoint(x: 1, y: 0.5)
        
        var bounds = self.navigationBar.bounds
        bounds.size.height += UIApplication.shared.statusBarFrame.size.height
        gradient.frame = bounds
        gradient.colors = colors;
        self.navigationBar.setBackgroundImage(self.image(gradientLayer: gradient), for: .default)
    }
    
    private func image(gradientLayer: CAGradientLayer) -> UIImage? {
        
        var gradientImage:UIImage?
        UIGraphicsBeginImageContext(gradientLayer.frame.size)
        if let context = UIGraphicsGetCurrentContext() {
            gradientLayer.render(in: context)
            gradientImage = UIGraphicsGetImageFromCurrentImageContext()?.resizableImage(withCapInsets: UIEdgeInsets.zero, resizingMode: .stretch)
        }
        UIGraphicsEndImageContext()
        return gradientImage
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
