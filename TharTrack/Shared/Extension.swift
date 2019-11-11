//
//  Extension.swift
//  CampBell
//
//  Created by apple on 27/03/19.
//  Copyright © 2019 ESoft Technologies. All rights reserved.
//


import Foundation
import UIKit
import MaterialComponents.MDCTextField
import MaterialComponents.MaterialTypography



extension UINavigationBar {
    
    func setGradientBackground() {
    
        var colors:[Any] = []
        if #available(iOS 11.0, *) {
            colors = [UIColor(named: "NavGreen")?.cgColor as! CGColor, UIColor(named: "NavBlue")?.cgColor as! CGColor]
        } else {
            // Fallback on earlier versions
        }
        
        let gradient: CAGradientLayer = CAGradientLayer()
       
        gradient.startPoint = CGPoint(x: 0, y: 0.5)
        gradient.endPoint = CGPoint(x: 1, y: 0.5)
        
        var bounds = self.bounds
        bounds.size.height += UIApplication.shared.statusBarFrame.size.height
        gradient.frame = bounds
        gradient.colors = colors;
        self.setBackgroundImage(self.image(gradientLayer: gradient), for: .default)
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
}

extension UILabel {
    struct FIELDOBJECT{
        static var _fieldProperty:M_FormBuilder?
    }
    
    var _fieldProperty : M_FormBuilder? {
        
        get {
            guard let value = objc_getAssociatedObject(self, &FIELDOBJECT._fieldProperty) as? M_FormBuilder else {
                return nil
            }
            return value
        }
        set(newValue) {
            objc_setAssociatedObject(self, &FIELDOBJECT._fieldProperty, newValue, objc_AssociationPolicy.OBJC_ASSOCIATION_RETAIN_NONATOMIC)
        }
    }
}


extension MDCTextField {
    struct FIELDOBJECT{
      static var _fieldProperty:M_FormBuilder?
    }
    
    var _fieldProperty : M_FormBuilder? {
        
        get {
            guard let value = objc_getAssociatedObject(self, &FIELDOBJECT._fieldProperty) as? M_FormBuilder else {
                return nil
            }
            return value
        }
        set(newValue) {
            objc_setAssociatedObject(self, &FIELDOBJECT._fieldProperty, newValue, objc_AssociationPolicy.OBJC_ASSOCIATION_RETAIN_NONATOMIC)
        }
        
    }
    
//    func setFontSize(size: CGFloat?) {
//        if let newSize  = size {
//            self.font = UIFont.systemFont(ofSize: newSize)
//        }
//        else {
//             self.font = UIFont.systemFont(ofSize: 20)
//        }
//    }
    
    func setFontSize() {

        switch UIDevice.current.userInterfaceIdiom {
        case .pad:
                self.font = UIFont.systemFont(ofSize: 20)
        case .phone:
                self.font = UIFont.systemFont(ofSize: 16)
        default:
                self.font = UIFont.systemFont(ofSize: 20)
        }
    }
    
    @IBInspectable var setMDCFont: CGFloat {
        get {
            
            if let fontSize = font?.pointSize {
                return fontSize
            }
            else {
                return 0
            }
        }
        set {
            updateView(value: newValue)
        }
    }
    
    private func updateView(value: CGFloat) {
        let typographyScheme = MDCTypographyScheme()
        typographyScheme.caption = UIFont.systemFont(ofSize: value, weight: .regular)
        self.font = typographyScheme.caption
        self.placeholderLabel.font = typographyScheme.caption
    }
    
    func setKeyboard(type : String?) {
        
//        guard let dataType = type else {return}
//
//        if dataType == DataType.Number.rawValue {
//            //self.keyboardType = .decimalPad
//             //showDatePicker()
//        }
//        if dataType == DataType.Text.rawValue {
//            self.keyboardType = .default
//        }
//        if dataType == DataType.Date.rawValue {
//            //showDatePicker()
//        }
    }
}

extension MDCTextInputControllerOutlined {
    
    func setTitleFont() {
        switch UIDevice.current.userInterfaceIdiom {
        case .pad:
            self.inlinePlaceholderFont = MDCTypography.titleFont()
        case .phone:
            self.inlinePlaceholderFont = MDCTypography.titleFont()
        default:
            self.inlinePlaceholderFont = MDCTypography.titleFont()
        }
    }
}
