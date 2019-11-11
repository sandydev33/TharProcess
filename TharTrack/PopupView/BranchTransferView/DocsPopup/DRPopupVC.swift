//
//  DRPopupVC.swift
//  TharTrack
//
//  Created by Esoft on 31/10/19.
//  Copyright © 2019 Esoft. All rights reserved.
//

import UIKit

protocol DRPopupVCDelegate : class{
    func btnDRCloseTapped()
    func btnDRPReload()
}

class DRPopupVC: BaseVC {
    
    @IBOutlet weak var txtViewTag: UITextView!
    private let kDRPopupCell = "DRPopupCell"
    private let kDRPopupDataCell = "DRPopupDataCell"
    var viewModel:DRPopupViewModel!
    var sections:[TharDocsBaseModel] = []
    var orderID:Int? = nil
    @IBOutlet weak var tblView: UITableView!
    
    weak var delegate:DRPopupVCDelegate?
    override func viewDidLoad() {
        super.viewDidLoad()

        tblView.register(UINib(nibName: kDRPopupCell, bundle: Bundle.main), forHeaderFooterViewReuseIdentifier: kDRPopupCell)
        
        tblView.register(UINib(nibName: kDRPopupDataCell, bundle: Bundle.main), forCellReuseIdentifier: kDRPopupDataCell)
        tblView.estimatedRowHeight = UITableView.automaticDimension
        tblView.rowHeight = 50
        
        viewModel = DRPopupViewModel(dataSource: DRPopupDataSource())
        viewModel.delegate = self
        viewModel.getAllVisibleDocument()
        // Do any additional setup after loading the view.
    }
    
    @IBAction func btnOutSideTapped(_ sender: UIButton) {
        self.dismiss(animated: true, completion: nil)
        delegate?.btnDRCloseTapped()
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
    @IBAction func btnSubmitTapped(_ sender: UIButton) {
        
        
        if orderID != nil {
            
            if let value = Helper.createUploadModel(data: Constant.POSections, comment: txtViewTag.text ?? "", docData: sections[0]) {
                
                do{
                    let data = try JSONEncoder().encode(value)
                    let strJson = String(data: data, encoding: .utf8)
                   viewModel.requestDocuments(model: strJson!)
                }catch {}
            }else{
            }
        }
    }
    
}

// MARK : Table View Delegates Methods
extension DRPopupVC: UITableViewDelegate , UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        
        if let header = tableView.dequeueReusableHeaderFooterView(withIdentifier: kDRPopupCell) as? DRPopupCell {
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
        return sections.count
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 0 {
            return sections[section].result?.count ?? 0
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
            let cell = tableView.dequeueReusableCell(withIdentifier: kDRPopupDataCell, for: indexPath) as! DRPopupDataCell
            let data = sections[indexPath.section].result![indexPath.row]
            cell.txtTag1.tag = indexPath.row
            cell.setData(data: data)
            return cell
        }
        else{
            return UITableViewCell()
        }
    }
}



// MARK : Base View Delegates Methods
extension DRPopupVC : ViewModelDelegate{
    func willLoadData() {
        startLoader()
    }
    
    func didLoadData() {
        sections = viewModel.sections
        tblView.reloadData()
        stopLoader()
        
        if viewModel.requestMsg != nil {
            showErrorMessage(title: "", message: viewModel.requestMsg ?? "") { (action) in
                self.dismiss(animated: true, completion: nil)
            }
        }
    }
    
    func didFail(error: CustomError) {
       showErrorMessage(title: "Error....", error: error)
    }
}
