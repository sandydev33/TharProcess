//
//  M_PONResult.swift
//  TharTrack
//
//  Created by Esoft on 04/11/19.
//  Copyright © 2019 Esoft. All rights reserved.
//

import Foundation
struct M_PONResult : Codable {
    let createdBy : String?
    let createdDate : String?
    let modifiedBy : String?
    let modifiedDate : String?
    let isDeleted : Bool?
    let ipAddress : String?
    let orderId : Int?
    let totalItems : Int?
    let finalPrice : Double?
    let orderStatus : String?
    let orderDate : String?
    let sortDesc : String?
    let isDocumentUploaded : Bool?
    let poNo : String?
    let comment : String?
    let billingAddress : M_BillingAddress?
    let shippingAddress : M_ShippingAddress?
    let company : M_PurchaseCompany?
    let purchaseItems : [M_PurchaseItems]?
    let shppingBranch : M_ShppingBranch?
    let paymentTerms : M_PaymentTerms?
    let salesOrderNo : String?
    let purchaseOrderDocResp : [M_PurchaseOrderDocResp]?
    
    enum CodingKeys: String, CodingKey {
        
        case createdBy = "createdBy"
        case createdDate = "createdDate"
        case modifiedBy = "modifiedBy"
        case modifiedDate = "modifiedDate"
        case isDeleted = "isDeleted"
        case ipAddress = "ipAddress"
        case orderId = "orderId"
        case totalItems = "totalItems"
        case finalPrice = "finalPrice"
        case orderStatus = "orderStatus"
        case orderDate = "orderDate"
        case sortDesc = "sortDesc"
        case isDocumentUploaded = "isDocumentUploaded"
        case poNo = "poNo"
        case comment = "comment"
        case billingAddress = "billingAddress"
        case shippingAddress = "shippingAddress"
        case company = "company"
        case purchaseItems = "purchaseItems"
        case shppingBranch = "shppingBranch"
        case paymentTerms = "paymentTerms"
        case salesOrderNo = "salesOrderNo"
        case purchaseOrderDocResp = "purchaseOrderDocResp"
    }
    
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        createdBy = try values.decodeIfPresent(String.self, forKey: .createdBy)
        createdDate = try values.decodeIfPresent(String.self, forKey: .createdDate)
        modifiedBy = try values.decodeIfPresent(String.self, forKey: .modifiedBy)
        modifiedDate = try values.decodeIfPresent(String.self, forKey: .modifiedDate)
        isDeleted = try values.decodeIfPresent(Bool.self, forKey: .isDeleted)
        ipAddress = try values.decodeIfPresent(String.self, forKey: .ipAddress)
        orderId = try values.decodeIfPresent(Int.self, forKey: .orderId)
        totalItems = try values.decodeIfPresent(Int.self, forKey: .totalItems)
        finalPrice = try values.decodeIfPresent(Double.self, forKey: .finalPrice)
        orderStatus = try values.decodeIfPresent(String.self, forKey: .orderStatus)
        orderDate = try values.decodeIfPresent(String.self, forKey: .orderDate)
        sortDesc = try values.decodeIfPresent(String.self, forKey: .sortDesc)
        isDocumentUploaded = try values.decodeIfPresent(Bool.self, forKey: .isDocumentUploaded)
        poNo = try values.decodeIfPresent(String.self, forKey: .poNo)
        comment = try values.decodeIfPresent(String.self, forKey: .comment)
        billingAddress = try values.decodeIfPresent(M_BillingAddress.self, forKey: .billingAddress)
        shippingAddress = try values.decodeIfPresent(M_ShippingAddress.self, forKey: .shippingAddress)
        company = try values.decodeIfPresent(M_PurchaseCompany.self, forKey: .company)
        purchaseItems = try values.decodeIfPresent([M_PurchaseItems].self, forKey: .purchaseItems)
        shppingBranch = try values.decodeIfPresent(M_ShppingBranch.self, forKey: .shppingBranch)
        paymentTerms = try values.decodeIfPresent(M_PaymentTerms.self, forKey: .paymentTerms)
        salesOrderNo = try values.decodeIfPresent(String.self, forKey: .salesOrderNo)
        purchaseOrderDocResp = try values.decodeIfPresent([M_PurchaseOrderDocResp].self, forKey: .purchaseOrderDocResp)
    }
    
}
