//
//  UserProfileViewController.swift
//  Assignment
//
//  Created by Bhoopendra-28 on 02/12/2019.
//  Copyright © 2019 Bhoopendra-28. All rights reserved.
//

import UIKit
import SDWebImage

class UserProfileViewController: UIViewController
{
    //MARK:- Properties
    var appd = AppDelegate()
    var userProfileUrl = String()
    var userProfileArray = NSDictionary()

    //MARK:- Interface Builder Outlets
    @IBOutlet weak var userName: UILabel!
    @IBOutlet weak var userFollow: UILabel!
    @IBOutlet weak var userFollowing: UILabel!
    @IBOutlet weak var userCreatedDate: UILabel!
    @IBOutlet weak var userUpdatedDate: UILabel!
    @IBOutlet weak var userImage: UIImageView!
    
    //MARK:- View Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()

        appd = UIApplication.shared.delegate as! AppDelegate
        getUserProfileList()
    }
    
    func getUserProfileList() {
        let parameter : [String:Any] = [:]
        print_debug(object: parameter)
        CANetworkManager.sharedInstance.requestApi(serviceName: userProfileUrl, method: kHTTPMethod.GET, postData: parameter as Dictionary<String, AnyObject>) { (response, error) in
            print_debug(object: response)
          
            if(error != nil)
            {
                return
            }
            
           // self.userProfileArray = []
            self.userProfileArray = response as! NSDictionary
            
            var follow = Int()
            follow = self.userProfileArray["followers"] as! Int
            let userFollow = String(follow)

            var following = Int()
            following = self.userProfileArray["following"] as! Int
            let userFollowing = String(following)

            self.userFollow.text = userFollow
            self.userFollowing.text = userFollowing
            
            if let nameOfUser = self.userProfileArray["name"] as? String
            {
                self.userName.text = nameOfUser.capitalizingFirstLetter()
            }
            else
            {
                 self.userName.text = ""
            }
          
            if let createDate = self.userProfileArray["created_at"] as? String
            {
                self.userCreatedDate.text = self.setChangeDateFormate(previousDateStr: createDate)
            }
            
            if let updateDate = self.userProfileArray["updated_at"] as? String
            {
                self.userUpdatedDate.text = self.setChangeDateFormate(previousDateStr: updateDate)
            }
            self.userImage.sd_setImage(with: URL(string: self.userProfileArray["avatar_url"] as! String), placeholderImage: UIImage(named: "placeholder.png"))
            self.setCornerRadiusImageView(radius: Float(self.userImage.frame.width/2), color: UIColor.clear, view:  self.userImage)
            if let htmlUrl = self.userProfileArray["html_url"] as? String
            {
                self.appd.pathGitUrl = htmlUrl
            }
            
        }
    }
    
    // MARK: - Action Methods
    @IBAction func backButton(_ sender: Any)
    {
        self.navigationController?.popViewController(animated: true)
    }
    
    @IBAction func clickPathOfgit(_ sender: Any)
    {
        if appd.pathGitUrl == ""
        {
            showAlertC(message: Alert.message)
        }
        else
        {
            let vc = UIStoryboard.init(name: "Main", bundle: Bundle.main).instantiateViewController(withIdentifier: ViewIdentifier.detailViewId) as? UserDetailsViewController
            self.navigationController?.pushViewController(vc!, animated: true)
        }
    }
}
