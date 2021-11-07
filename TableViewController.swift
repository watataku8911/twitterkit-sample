//
//  TableViewController.swift
//  twitterapi
//
//  Created by watataku on 2018/03/04.
//  Copyright © 2018年 綿野拓也. All rights reserved.
//

import UIKit
import TwitterKit


class TableViewController: TWTRTimelineViewController {
    
    //UserDefaultに保存した値を取り出す
    var userId : String? = UserDefaults.standard.string(forKey: "userID")
    var userName : String? = UserDefaults.standard.string(forKey: "userName")
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.title = userName
        
        self.dataSource = TWTRSearchTimelineDataSource(searchQuery: "#乃木坂46", apiClient: TWTRAPIClient())
        
    }
    
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
    
   override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
    let secondViewController = segue.destination as! DetailViewController
    secondViewController.parameter = userName!
    }
   
    
    
}
