//
//  DetailViewController.swift
//  twitterapi
//
//  Created by watataku on 2018/05/16.
//  Copyright © 2018年 綿野拓也. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {

    @IBOutlet weak var webview: UIWebView!
    var parameter = ""
    override func viewDidLoad() {
        super.viewDidLoad()
        if let url=URL(string: "https://twitter.com/" + parameter){
            let request=URLRequest(url: url)
            self.webview.loadRequest(request)
        }
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
