//
//  ViewController.swift
//  BubbleHopper
//
//  Created by Michael on 7/24/17.
//  Copyright © 2017 mikeAttia. All rights reserved.
//

import UIKit
import FacebookCore
import FacebookLogin


class ViewController: UIViewController, LoginButtonDelegate {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        let loginBtn = LoginButton(readPermissions: [.publicProfile, .email, .userFriends])
        loginBtn.center = self.view.center
        loginBtn.delegate = self
        self.view.addSubview(loginBtn)
        
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewDidAppear(_ animated: Bool) {
        if let token = AccessToken.current{
            print(token)
            performSegue(withIdentifier: "loggedIn", sender: nil)
            
        }
    }
    
    
    //Facebook Login Delegate methods
    func loginButtonDidCompleteLogin(_ loginButton: LoginButton, result: LoginResult) {
        
        switch result {
        case .cancelled:
            break
        case .failed(let error):
            print(error)
        case .success(grantedPermissions: _, declinedPermissions: _, token: let token):
            print(token)
            performSegue(withIdentifier: "loggedIn", sender: nil)
        }
        
    }
    
    func loginButtonDidLogOut(_ loginButton: LoginButton) {
        // Implement Logout Logic
    }


}

