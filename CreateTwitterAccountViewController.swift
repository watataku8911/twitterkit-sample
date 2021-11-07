//
//  CreateTwitterAccountViewController.swift
//  twitterapi
//
//  Created by watataku on 2018/03/13.
//  Copyright © 2018年 綿野拓也. All rights reserved.
//

import UIKit

class CreateTwitterAccountViewController: UIViewController, UIWebViewDelegate{

    @IBOutlet weak var webview: UIWebView!
    
    @IBOutlet weak var myIndicator: UIActivityIndicatorView!
    override func viewDidLoad() {
        super.viewDidLoad()
        if let url=URL(string: "https://twitter.com/signup?lang=ja"){
            let request=URLRequest(url: url)
            self.webview.loadRequest(request)
        }
        webview.delegate = self

        // Do any additional setup after loading the view.
    }
    
    //読み込み開始
    func webViewDidStartLoad(_ webView: UIWebView) {
        myIndicator.startAnimating()
        myIndicator.isHidden = false
    }
    
    //読み込みエラー
    func webView(_ webView: UIWebView, didFailLoadWithError error: Error) {
        let alert:UIAlertController=UIAlertController(title:nil,message:"ネットワークエラーです",preferredStyle:.alert)
        let canselAction:UIAlertAction=UIAlertAction(title:"OK",style:.cancel,handler:{
            // ボタンが押された時の処理を書く（クロージャ実装）
            (action: UIAlertAction!) -> Void in
            if let url=URL(string: "https://twitter.com/signup?lang=ja"){
                let request=URLRequest(url: url)
                self.webview.loadRequest(request)
            }
        })
            alert.addAction(canselAction)
            self.present(alert, animated: true, completion: nil)
        
        
    }
    //読み込み終了
    func webViewDidFinishLoad(_ webView: UIWebView) {
        myIndicator.stopAnimating()
        myIndicator.isHidden=true
        
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
