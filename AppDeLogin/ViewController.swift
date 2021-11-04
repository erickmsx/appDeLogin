//
//  ViewController.swift
//  AppDeLogin
//
//  Created by Erick Martins on 03/11/21.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    title = "Home"
    
    }
    
    @IBAction func goToLogin(_ sender: Any) {
        
        let loginVC = LoginViewController()
        
        navigationController?.pushViewController(loginVC, animated: true)
    }
    
    
    @IBAction func goToSignup(_ sender: Any) {
        
        let signupVC = SignupViewController()
        
        navigationController?.pushViewController(signupVC, animated: true)
    }
    
    
    
    
    
}

