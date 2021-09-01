//
//  LoginViewController.swift
//  ShindanMaker
//
//  Created by HechiZan on 2021/08/23.
//

import UIKit
import FirebaseAuth
import NVActivityIndicatorView//ローディング中のライブラリ

class LoginViewController: UIViewController {

    var provider:OAuthProvider?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.provider = OAuthProvider(providerID: TwitterAuthProviderID)
        provider?.customParameters = ["lang":"ja"]
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        self.navigationController?.isNavigationBarHidden = true
    }
    
    
    @IBAction func twitterLogin(_ sender: Any) {
        
        self.provider = OAuthProvider(providerID: TwitterAuthProviderID)
        provider?.customParameters = ["force_login":"true"]
        provider?.getCredentialWith(nil, completion: { (credntial,error)  in
            
            //ロードアニメーション
            let activityView = NVActivityIndicatorView(frame: self.view.bounds, type: .ballBeat, color: .magenta, padding: .none)
            self.view.addSubview(activityView)
            activityView.startAnimating()
            
            //ログインの処理
            Auth.auth().signIn(with: credntial!) { (result, error) in
                
                if error != nil{
                    
                    return
                }
                
                activityView.stopAnimating()
                
                //画面遷移
                let viewVC = self.storyboard?.instantiateViewController(identifier: "viewVC") as! ViewController
                viewVC.userName = (result?.user.displayName)!
                self.navigationController?.pushViewController(viewVC, animated: true)
                
                
            }
        
        })
    }
    
}
