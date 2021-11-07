//
//  ProfileViewController.swift
//  twitterapi
//
//  Created by watataku on 2018/03/04.
//  Copyright © 2018年 綿野拓也. All rights reserved.
//

import UIKit
import TwitterKit

class ProfileViewController: UIViewController {
    
    @IBOutlet weak var logo: UIImageView!//プロフィール画像
    
    @IBOutlet weak var key: UIImageView!//鍵アカウント
    
    @IBOutlet weak var nameLabel: UILabel!//アカウント名
    
    @IBOutlet weak var fommatednameLabel: UILabel!//@のついたユーザー名
    
    @IBOutlet weak var tableview: UITableView!
    
    
    
    
    
    var userId : String? = UserDefaults.standard.string(forKey: "userID")
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loadUser()
        //self.dataSource = TWTRSearchTimelineDataSource(searchQuery: "#乃木坂46", apiClient: TWTRAPIClient())
        
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //ユーザー情報の取得
    func loadUser() {
        let client = TWTRAPIClient()
        client.loadUser(withID: self.userId!, completion: {(user, error) -> Void in
            if user != nil {
                self.nameLabel.text = user!.name
                self.fommatednameLabel.text = user!.formattedScreenName
                let url = URL(string: user!.profileImageLargeURL)
                let data = try? Data(contentsOf: url!)
                self.logo.image = UIImage(data: data!)
                if user!.isProtected {
                    let image = UIImage(named: "269-icon-free.png")
                   self.key.image = image
                }
            } else {
                print(error!)
            }
            
        })
    }
    

    @IBAction func pushTweet(_ sender: Any) {
        let composer = TWTRComposer()
        composer.setText("#乃木坂46")
        composer.show(from: self) { result in
            if (result == .done) {
                print("ツイート出来ました")
            } else {
                print("ツイート出来ませんでした")
            }
        }
    }
    
    @IBAction func pushLogout(_ sender: Any) {
        let defaults = UserDefaults.standard
        //UaerDefaultsの値削除
        defaults.removeObject(forKey:"userID")
        defaults.removeObject(forKey:"userName")
        
        let storyboard: UIStoryboard = self.storyboard!
        let nextView = storyboard.instantiateViewController(withIdentifier: "NavigationLogin")
        self.present(nextView, animated: true, completion: nil)
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
