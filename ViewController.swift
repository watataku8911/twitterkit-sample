//
//  ViewController.swift
//  twitterapi
//
//  Created by watataku on 2018/02/27.
//  Copyright © 2018年 綿野拓也. All rights reserved.
//

import UIKit
import TwitterKit


class ViewController: UIViewController {

    // UserDefaultsを使用できるようにする
    let defaults = UserDefaults.standard
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
            let logInButton = TWTRLogInButton(logInCompletion: { session, error in
            if (session != nil) {
                //値の保存
                self.defaults.set(session?.userID, forKey: "userID")
                self.defaults.set(session?.userName, forKey: "userName")
                
                //画面遷移
                let storyboard: UIStoryboard = self.storyboard!
                let nextView = storyboard.instantiateViewController(withIdentifier: "tabbar")
                self.present(nextView, animated: true, completion: nil)

            } else {
                print("ログインエラー又はネットワークエラーです")
                let alert:UIAlertController=UIAlertController(title:nil,message:"ログインエラー又はネットワークエラーです",preferredStyle:.alert)
                let canselAction:UIAlertAction=UIAlertAction(title:"OK",style:.cancel,handler:nil)
                alert.addAction(canselAction)
                self.present(alert, animated: true, completion: nil)
            }
        })
        // スクリーンの横縦幅
        let screenWidth:CGFloat = self.view.frame.width
        let screenHeight:CGFloat = self.view.frame.height
        // logInButtonの位置設定
        logInButton.layer.position = CGPoint(x: screenWidth/2, y: screenHeight/1.2)
        //logInButton. = self.view.center
        self.view.addSubview(logInButton)
    
   
        // Do any additional setup after loading the view, typically from a nib.
    }
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

