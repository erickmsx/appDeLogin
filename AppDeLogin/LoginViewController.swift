//
//  LoginViewController.swift
//  AppDeLogin
//
//  Created by Erick Martins on 03/11/21.
//

import UIKit

class LoginViewController: UIViewController {
    
    
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "Login"
    }
    
    @IBAction func login(_ sender: Any) {
        
        guard let email = emailTextField.text, email != "" else {
            presentMessage(message: "Campo de email não preenchido")
            return
        }
        
        guard let password = passwordTextField.text, password != "" else {
            
            presentMessage(message: "Campo de senha deve ser preenchido")
            return
        }
        
        for user in userList{
            
            if user.email == email, user.password == password {
                let userDetailVC = UserDetailViewController(selectedUser: user)
                navigationController?.pushViewController(userDetailVC, animated: true)
                return
            }
        }
        
        presentMessage(message: "Nenhum usuário encontrado com as informações passadas")
    }
    
    func presentMessage(message: String){
        
        let alert = UIAlertController(title: "App de login", message: message, preferredStyle: .alert)
        let okButton = UIAlertAction(title: "Ok", style: .default, handler: nil)
        alert.addAction(okButton)
        self.present(alert, animated: true, completion: nil)
    }
}
