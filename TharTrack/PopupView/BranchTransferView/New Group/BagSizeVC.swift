//
//  BagSizeVC.swift
//  TharTrack
//
//  Created by Esoft on 18/10/19.
//  Copyright © 2019 Esoft. All rights reserved.
//

import UIKit


protocol BagSizeVCDelegate : class{
    func btnBagCloseTapped()
    func btnBagSizeReload()
}

class BagSizeVC: BaseVC {
    
    @IBOutlet weak var txtSelect: UITextField!
    weak var delegate:BagSizeVCDelegate?
    @IBOutlet weak var tblView: UITableView!
    private let kBagSizeCell = "BagSizeCell"
    var viewModel:BagSizeViewModel!
    
    @IBOutlet var viewDatePicker: UIView!
    @IBOutlet weak var pickerView: UIPickerView!
    private var selectedID: Int = 0
    var sections:[BagSize] = []
    var branchData : [AllBranchBaseModel] = []
    var orderID:Int? = nil
    var ponSection:PONBaseModel?
    override func viewDidLoad() {
        super.viewDidLoad()
        tblView.register(UINib(nibName: kBagSizeCell, bundle: Bundle.main), forCellReuseIdentifier: kBagSizeCell)
        tblView.estimatedRowHeight = UITableView.automaticDimension
        
        viewModel = BagSizeViewModel(dataSource: BagSizeDataSource())
        viewModel.delegate = self
        viewModel.getAllActiveBagSize()
        txtSelect.inputView = viewDatePicker

        // Do any additional setup after loading the view.
    }
    
    @IBAction func btnOutSideTapped(_ sender: UIButton) {
        self.dismiss(animated: true, completion: nil)
        delegate?.btnBagCloseTapped()
        
     
        
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
        if (self.txtSelect.text?.count)! <= 0 {
            showErrorMessage(title: "Error....", error: CustomError.PickerValue)
        }
        else {
            if orderID != nil {
                
                if let value = Helper.createApproveModel(data: sections, ID: orderID!, branchID: selectedID) {
                    
                    do{
                        let data = try JSONEncoder().encode(value)
                        let strJson = String(data: data, encoding: .utf8)
                       viewModel.approvePurchaseOrder(ID: orderID!, bagSize: strJson!)
                    }catch {}
                }else{
                }
            }
            
        }
    }
    
}
extension BagSizeVC: UITableViewDelegate , UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return sections.count
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 0{
            return sections[section].result!.count
        }else{
            return 0
        }
    }

    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.section == 0{
            let cell = tableView.dequeueReusableCell(withIdentifier: kBagSizeCell, for: indexPath) as! BagSizeCell
            let data = sections[indexPath.section].result![indexPath.row]
            cell.txtTag.tag = indexPath.row
            cell.setData(data: data)
            
            return cell
        }
        else{
            return UITableViewCell()
        }
    }
}



// MARK : Base View Delegates Methods
extension BagSizeVC : ViewModelDelegate{
    func willLoadData() {
        startLoader()
    }
    
    func didLoadData() {
        sections = viewModel.sections
        branchData = viewModel.branchSection
        tblView.reloadData()

        if viewModel?.approveMsg != nil {
            showErrorMessage(title: "", message: viewModel.approveMsg!) { action in
                self.delegate?.btnBagSizeReload()
                self.dismiss(animated: true, completion: nil)
            }
        }
        
        stopLoader()
    }
    
    func didFail(error: CustomError) {
        showErrorMessage(title: "Error...", error: error)
        stopLoader()
    }
    
    
}
//MARK: pickerView Delegate Methods
extension BagSizeVC : UIPickerViewDelegate, UIPickerViewDataSource {
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return branchData.count
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return branchData[component].result?.count ?? 0
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return branchData[component].result?[row].branchName
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        txtSelect.text = branchData[component].result?[row].branchName
        selectedID = branchData[component].result?[row].id ?? 0
        }
}


