//
//  SignupViewController.swift
//  AppDeLogin
//
//  Created by Erick Martins on 03/11/21.
//

import UIKit

class SignupViewController: UIViewController, UITextFieldDelegate {
    
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordConfTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupTextFields()
        
    }
    
    func setupTextFields(){
        
        nameTextField.delegate = self
        emailTextField.delegate = self
        passwordTextField.delegate = self
        passwordConfTextField.delegate = self
    }
    
    
    @IBAction func signup(_ sender: Any) {
        
        let name = nameTextField.text
        let email = emailTextField.text
        let password = passwordTextField.text
        let passwordConf = passwordConfTextField.text
        
        guard let userName = name, userName != "" else {
            presentMessage(message: "Campo nome deve ser preenchido")
            return
        }
        
        guard let userEmail = email, userEmail != "" else{
            presentMessage(message: "Campo email deve ser preenchido")
            return
        }
        
        guard let userPassword = password, userPassword != "" else{
            presentMessage(message: "Campo senha deve ser preenchido")
            return
        }
        
        guard let userPasswordConf = passwordConf, userPasswordConf != "" else{
            presentMessage(message: "Campo de confirmação de senha deve ser preenchido")
            return
        }
        
        guard userPasswordConf == userPassword else{
            presentMessage(message: "Campo de confirmação de senha e campo de senha devem ser iguais")
            return
        }
        
        let user = User(userName: userName, userEmail: userEmail, userPassword: userPassword, userPasswordConf: userPasswordConf)
        presentMessage(message: "Usuário cadastrado")
    }
    
    //Pop-up Message
    func presentMessage(message: String){
        
        let alert = UIAlertController(title: "App de login", message: message, preferredStyle: .alert)
        let okButton = UIAlertAction(title: "Ok", style: .default, handler: nil)
        alert.addAction(okButton)
        present(alert, animated: true, completion: nil)
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        
        textField.resignFirstResponder()
        return true
    }
}

