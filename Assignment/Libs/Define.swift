//
//  Define.swift
//  Assignment
//
//  Created by Bhoopendra-28 on 02/12/2019.
//  Copyright © 2019 Bhoopendra-28. All rights reserved.
//

import Foundation
import UIKit


// This structure is used for print gloabley in whole app
func print_debug <T>(object: T)
{
    print(object)
}

// This structure is used for defiine baseUrl
struct ServiceUrl {
    static let baseUrl = "https://api.github.com/users"
}

// This structure is used for TableView Cell identifier
struct TableViewIdentifier {
    static let userCell = "userCell"
}

// This structure is used for ViewController identifier
struct ViewIdentifier {
    static let profileViewId = "UserProfileVC"
    static let detailViewId = "UserDetailsVC"

}

// This structure is used for Alert button text and title
struct Alert {
    static let titleName = "Assignment-IOS"
    static let buttonOk = "OK"
    static let message = "Git Path Not found"
}

//This structure is used for all the keys used in service class.All the keys used in service class should be here.
struct ServiceKeys
{
    static let status = "status"
}

// This structure is used for all the Date Formats Values used in the app
struct DateFormats {
    static let isoFormat = "yyyy-MM-dd'T'HH:mm:ssZZZZZ"
    static let orderDateFormatResult        =   "dd-MM-yyyy"
}

