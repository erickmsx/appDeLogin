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
        let password = passwordTextField
    }

    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        
        textField.resignFirstResponder()
        return true
    }


}
