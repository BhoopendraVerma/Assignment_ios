//
//  ViewController.swift
//  Assignment
//
//  Created by Bhoopendra-28 on 02/12/2019.
//  Copyright © 2019 Bhoopendra-28. All rights reserved.
//

import UIKit
import SDWebImage
import ObjectMapper
import RealmSwift

// TableView Cell
class userTableViewCell: UITableViewCell
{
    @IBOutlet weak var userName: UILabel!
    @IBOutlet weak var userImage: UIImageView!
}

class ViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {

    let realm = try? Realm()
    var userdata:Results<UserListStorage>? = nil
    //MARK:- Interface Builder Outlets
    @IBOutlet weak var userListView: UITableView!
    var new_Task = NSArray()

    //MARK:- View Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()

        // Service Call Get users list
        userListView.isHidden = true
        getUsersList()
    }
    
    func getUsersList()
    {
        let parameter : [String:Any] = [:]
        print_debug(object: parameter)
        CANetworkManager.sharedInstance.requestApi(serviceName: ServiceUrl.baseUrl, method: kHTTPMethod.GET, postData: parameter as Dictionary<String, AnyObject>) { (response, error) in
            print_debug(object: response)
            if(error != nil){
                return
            }
            self.new_Task = []
            self.new_Task = response as! NSArray
            self.userListView.isHidden = false

// load data in Realm data base
            try! self.realm!.write
            {
                if let users = self.realm?.objects(UserListStorage.self) {
                    self.realm!.delete(users)
                }
            }
            
            for entry in self.new_Task {
                if let currentUser = Mapper<UserListStorage>().map(JSONObject: entry) {
                    try! self.realm!.write {
                        self.realm!.add(currentUser)
                    }
                }
            }
            self.userdata = self.realm!.objects(UserListStorage.self)

            // Tableview reload
            self.userListView.delegate = self
            self.userListView.dataSource = self
            self.userListView.reloadData()
        }
    }
    
    //MARK:- UITableView Methods
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        return userdata?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {
            var cell : userTableViewCell? = (userListView.dequeueReusableCell(withIdentifier: TableViewIdentifier.userCell) as! userTableViewCell)
            if cell == nil {
                cell = userTableViewCell(style: UITableViewCell.CellStyle.default, reuseIdentifier: TableViewIdentifier.userCell)
            }
        
        if let userList = userdata?[indexPath.row]
        {
            cell?.userName.text = userList.login.capitalizingFirstLetter()
            cell?.userImage.sd_setImage(with: URL(string: userList.avatar_url), placeholderImage: UIImage(named: "placeholder.png"))
            setCornerRadiusImageView(radius: 20, color: UIColor.clear, view:  cell!.userImage)
        }
            return cell!
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath)
    {
        let vc = UIStoryboard.init(name: "Main", bundle: Bundle.main).instantiateViewController(withIdentifier: ViewIdentifier.profileViewId) as? UserProfileViewController
        if let profileData = userdata?[indexPath.row] {
            vc?.userProfileUrl = profileData.url
        }
        self.navigationController?.pushViewController(vc!, animated: true)
    }
}

