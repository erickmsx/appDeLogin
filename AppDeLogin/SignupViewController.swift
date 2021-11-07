//
//  SignupViewController.swift
//  AppDeLogin
//
//  Created by Erick Martins on 03/11/21.
//

import UIKit

var userList: [User] = []

class SignupViewController: UIViewController, UITextFieldDelegate, UIImagePickerControllerDelegate & UINavigationControllerDelegate {
    
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
        
        //Constructor parameters
        let user = User(userName: userName, userEmail: userEmail, userPassword: userPassword, userPasswordConf: userPasswordConf)
        
        user.image = imageView.image
        userList.append(user)
        
        presentMessage(message: "Usuário \(userName) cadastrado")
    }
    
    //Pop-up Message
    func presentMessage(message: String){
        
        let alert = UIAlertController(title: "App de login", message: message, preferredStyle: .alert)
        let okButton = UIAlertAction(title: "Ok", style: .default, handler: nil)
        alert.addAction(okButton)
        self.present(alert, animated: true, completion: nil)
    }
    
    //Button to select image
    @IBAction func selectImage(_ sender: Any) {
        
        let alert = UIAlertController(title: "App de login", message: "Selecione uma opção", preferredStyle: .actionSheet)
        
        //select from camera
        let cameraButton = UIAlertAction(title: "Câmera", style: .default) { _ in
            let imagePicker = UIImagePickerController()
            imagePicker.delegate = self
            imagePicker.sourceType = .camera
            self.present(imagePicker, animated: true, completion: nil)
        }
        
        alert.addAction(cameraButton)
        
        //select from library
        let libraryButton = UIAlertAction(title: "Biblioteca de fotos", style: .default) {_ in
            let imagePicker = UIImagePickerController()
            imagePicker.delegate = self
            imagePicker.sourceType = .photoLibrary
            self.present(imagePicker, animated: true, completion: nil)
        }
        
        alert.addAction(libraryButton)
        
        //cancel button in actionsheet
        let cancelButton = UIAlertAction(title: "Cancelar", style: .cancel, handler: nil)
        
        alert.addAction(cancelButton)
        
        present(alert, animated: true, completion: nil)
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        
        let selectedImage = info[.originalImage] as? UIImage //as? converts the function of the optional to UIImage
        
        if let image = selectedImage{
            imageView.image = image
        }else{
            presentMessage(message: "Você deve selecionar uma imagem")
        }
        
        picker.dismiss(animated: true, completion: nil)
    }
    
    //Pressing the return on key get back to the view
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        
        textField.resignFirstResponder()
        return true
    }
}

