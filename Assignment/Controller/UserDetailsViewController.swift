//
//  UserDetailsViewController.swift
//  Assignment
//
//  Created by Bhoopendra-28 on 02/12/2019.
//  Copyright © 2019 Bhoopendra-28. All rights reserved.
//

import UIKit

class UserDetailsViewController: UIViewController,UIWebViewDelegate {
    var appd = AppDelegate()
    //MARK:- Interface Builder Outlets
    @IBOutlet weak var webView: UIWebView!
    @IBOutlet weak var userName: UILabel!
    
    //MARK:- View Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        appd = UIApplication.shared.delegate as! AppDelegate
        CANetworkManager.sharedInstance.progressHUD(show: true)

        webView.delegate = self
        if let url = URL(string: appd.pathGitUrl)
        {
            let request = URLRequest(url: url)
            webView.loadRequest(request)
        }
        // Do any additional setup after loading the view.
    }
    
    func webViewDidFinishLoad(_ webView: UIWebView) {
        CANetworkManager.sharedInstance.progressHUD(show: false)
    }
    
    // MARK: - Action Methods
    @IBAction func backButton(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
}
