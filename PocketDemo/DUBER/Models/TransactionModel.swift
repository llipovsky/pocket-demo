//
//  TransactionModel.swift
//  PocketDemo
//
//  Created by mac on 11/27/17.
//  Copyright © 2017 Pabel Nunez Landestoy. All rights reserved.
//

import Foundation
import HandyJSON

class TransactionModel: HandyJSON {
    var id: String!
    var token: String? = "ETH"
    
    required init() {}
}


