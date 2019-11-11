//
//  Interfaces.swift
//  CampBell
//
//  Created by apple on 27/03/19.
//  Copyright © 2019 ESoft Technologies. All rights reserved.
//

import Foundation
import UIKit

protocol DataSourceType {
    func fetchByMoya(completion:@escaping(Result<BaseModel>)->Void)
}

protocol ViewModelDelegate:class {
    func willLoadData()
    func didLoadData()
    func didFail(error:CustomError)
}

protocol ViewModelType {
    func bootstrap()
    var delegate:ViewModelDelegate? {get set}
}


protocol FormViewModelType: ViewModelType {
    var form: M_Form! {get set}
    var childForm: M_ChildForm! {get set}
    var sections:[(section: M_Section, isColasped: Bool, row:[M_FormBuilder])] {get}
    func saveFormData(controller: UIViewController)
    var formDelegate:FormDelegate? {get set}
}

enum FormType: Int {
    case Folder = 0
    case EngineLogBook = 1
    case ORB = 2
    case GRB = 3
    case DLB = 4
    case BWB = 5
    case FOB = 6
}

protocol FormDelegate: class {
    func didSave(success: Bool, controller: UIViewController, formID: Int, date: String, formType:FormType)
    func showError(message: String)
}



protocol FieldValidationDelegate: class {
    func didValidate(success: Bool, error: String?, cell: UITableViewCell, handler:@escaping (Bool) -> Void)
    func didValidate(success: Bool, error: String?, cell: UITableViewCell)
}
