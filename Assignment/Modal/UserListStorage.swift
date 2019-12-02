//
//  UserListStorage.swift
//  Assignment
//
//  Created by Bhoopendra-28 on 02/12/2019.
//  Copyright © 2019 Bhoopendra-28. All rights reserved.
//

import Foundation
import UIKit
import RealmSwift
import ObjectMapper

class UserListStorage: Object, Mappable{
    required convenience init?(map: Map) {
        self.init()
    }
    @objc dynamic var login = ""
    @objc dynamic var id = Int()
    @objc dynamic var node_id = ""
    @objc dynamic var avatar_url = ""
    @objc dynamic var gravatar_id = ""
    @objc dynamic var url = ""
    @objc dynamic var html_url = ""
    @objc dynamic var followers_url = ""
    @objc dynamic var following_url = ""
    @objc dynamic var gists_url = ""
    @objc dynamic var starred_url = ""
    @objc dynamic var subscriptions_url = ""
    @objc dynamic var organizations_url = ""
    @objc dynamic var repos_url = ""
    @objc dynamic var events_url = ""
    @objc dynamic var received_events_url = ""
    @objc dynamic var type = ""
    @objc dynamic var site_admin = false
    
    func mapping(map: Map) {
        
        login <- map["login"]
        node_id <- map["node_id"]
        avatar_url <- map["avatar_url"]
        gravatar_id <- map["gravatar_id"]
        url <- map["url"]
        html_url <- map["html_url"]
        followers_url <- map["followers_url"]
        following_url <- map["following_url"]
        gists_url <- map["gists_url"]
        starred_url <- map["starred_url"]
        subscriptions_url <- map["subscriptions_url"]
        organizations_url <- map["organizations_url"]
        repos_url <- map["repos_url"]
        received_events_url <- map["received_events_url"]
        type <- map["type"]
        
        if let _id = map["id"].currentValue as? Int {
            id =  _id
        }
        if let _site_admin = map["site_admin"].currentValue as? String {
            site_admin =  _site_admin.lowercased() == "true"
        }
    }
}
